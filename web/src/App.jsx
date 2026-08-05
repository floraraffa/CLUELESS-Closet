import { useEffect, useMemo, useState } from 'react';
import { supabase, isDemoMode } from './supabaseClient.js';
import { mockItems, mockOutfits } from './mockData.js';
import { LANGS, detectLang, saveLang, translate } from './i18n.js';
import specsHero from './assets/specs-hero.jpg';

const CATEGORY_KEYS = ['top', 'bottom', 'shoes', 'outerwear', 'accessory', 'dress', 'look'];

// Enteritos (romper/jumpsuit/overall/one-piece) viven en la categoría vestidos.
const normalizeCat = (c) => (c === 'romper' || c === 'jumpsuit' || c === 'overall' || c === 'overalls' || c === 'one-piece') ? 'dress' : c;

const CATEGORY_EMOJI = {
  top: '👕', bottom: '👖', shoes: '👟', outerwear: '🧥',
  accessory: '👜', dress: '👗', look: '✨',
};

// Token de vinculación con el usuario del lente (Snapchat).
// Viene del .env (uso personal) o de localStorage (pantalla de vinculación).
const ENV_TOKEN = import.meta.env.VITE_WEB_TOKEN || '';

function getWebToken() {
  return ENV_TOKEN || localStorage.getItem('closet_web_token') || '';
}

function StarRating({ value }) {
  const r = Math.max(1, Math.min(5, Math.round(value || 1)));
  return (
    <span className="stars">
      {'★'.repeat(r)}
      <span className="off">{'★'.repeat(5 - r)}</span>
    </span>
  );
}

function BrandLabel({ className }) {
  return <span className={className}>CLOSET<em>CLUB</em></span>;
}

function matchClass(pct) {
  if (pct >= 75) return 'match-high';
  if (pct >= 55) return 'match-mid';
  return 'match-low';
}

// ---------------------------------------------------------------------
// Pantalla de vinculación (solo si no hay token configurado)
// ---------------------------------------------------------------------
function LinkScreen({ t, onCancel }) {
  const [code, setCode] = useState('');
  const [line1, line2] = t('link_sub').split('\n');

  function saveToken(e) {
    e.preventDefault();
    const clean = code.trim().toUpperCase();
    if (clean.length < 8) return;
    localStorage.setItem('closet_web_token', clean);
    window.location.hash = '';
    window.location.reload();
  }

  return (
    <div className="login-wrap">
      <h1 className="logo">CLOSET<em>CLUB</em></h1>
      <p className="login-sub">{line1}<br />{line2}</p>
      <form onSubmit={saveToken} className="login-form">
        <input
          type="text" required placeholder={t('link_placeholder')}
          value={code} onChange={(e) => setCode(e.target.value)}
        />
        <button type="submit">{t('link_button')}</button>
      </form>
      {onCancel && (
        <button className="signout" onClick={onCancel}>{t('cancel')}</button>
      )}
    </div>
  );
}

/** URL pública del Bitmoji subido por el lente. */
function avatarUrl(userId) {
  return `${import.meta.env.VITE_SUPABASE_URL}/storage/v1/object/public/closet-images/${userId}/avatar.png`;
}

// ---------------------------------------------------------------------
// Ficha de detalle de una prenda (modal)
// ---------------------------------------------------------------------
function ItemDetail({ item, onClose, t, onSendToLens }) {
  useEffect(() => {
    const onKey = (e) => { if (e.key === 'Escape') onClose(); };
    window.addEventListener('keydown', onKey);
    return () => window.removeEventListener('keydown', onKey);
  }, [onClose]);

  const cat = normalizeCat((item.category || item.type || '').toLowerCase());
  const catLabel = CATEGORY_KEYS.includes(cat) ? t('cat_' + cat) : (cat || '—');

  const rows = [
    [t('d_brand'), item.brand],
    [t('d_color'), item.color],
    [t('d_material'), item.material],
    [t('d_pattern'), item.pattern],
    [t('d_fit'), item.fit],
    [t('d_condition'), item.condition],
  ].filter(([, v]) => v && String(v).trim().length > 0);

  const stats = [
    [t('stat_condition'), item.top_speed],
    [t('stat_versatility'), item.acceleration],
    [t('stat_match'), item.braking],
    [t('stat_unique'), item.traction],
    [t('stat_trend'), item.comfort],
  ];

  const tags = [
    ...(item.style_tags || []),
    ...(item.occasion_tags || []),
    ...(item.season_tags || []),
    ...(item.custom_tags || []),
  ];

  return (
    <div className="modal-overlay" onClick={onClose}>
      <div className="sheet-zone" onClick={(e) => e.stopPropagation()}>
        <BrandLabel className="sheet-label" />
        <div className="modal">
          <button className="modal-close" title={t('d_close')} onClick={onClose}>✕</button>
          <div className="modal-media">
            {item.image_url ? (
              <img src={item.image_url} alt={item.item_name} />
            ) : (
              <div className={`card-placeholder cat-${cat || 'look'}`}>
                <span>{CATEGORY_EMOJI[cat] || '🧺'}</span>
              </div>
            )}
          </div>
          <div className="modal-info">
            <div className="serial">{item.serial}</div>
            <h2>{item.item_name || item.brand_model}</h2>
            <div className="card-top-row" style={{ justifyContent: 'flex-start', gap: 14 }}>
              <span className="chip chip-cat">{catLabel}</span>
              <span className="rarity" title={item.rarity_label}>
                <StarRating value={item.rarity} /> {item.rarity_label}
              </span>
            </div>

            <div className="stat-list">
              {stats.map(([label, value]) => (
                <div key={label} className="stat-row">
                  <span className="stat-label">{label}</span>
                  <span className="stat-stars"><StarRating value={value} /></span>
                </div>
              ))}
            </div>

            {rows.length > 0 && (
              <dl className="detail-rows">
                {rows.map(([label, value]) => (
                  <div key={label} className="detail-row">
                    <dt>{label}</dt>
                    <dd>{value}</dd>
                  </div>
                ))}
              </dl>
            )}

            {tags.length > 0 && (
              <>
                <h4>{t('d_tags')}</h4>
                <div className="chips">
                  {tags.map((tag, i) => <span key={tag + i} className="chip chip-soft">{tag}</span>)}
                </div>
              </>
            )}

            {(item.feedback || item.ai_note) && (
              <>
                <h4>{t('d_note')}</h4>
                <p className="ai-note">“{item.feedback || item.ai_note}”</p>
              </>
            )}

            <p className="meta">
              {t('d_scanned')}: {item.date_scanned}{item.city_scanned ? ' · ' + item.city_scanned : ''}
            </p>

            {onSendToLens && (
              <button className="send-btn" onClick={() => onSendToLens(item)}>
                {t('send_to_lens')}
              </button>
            )}
          </div>
        </div>
      </div>
    </div>
  );
}

// ---------------------------------------------------------------------
// Tarjeta de prenda
// ---------------------------------------------------------------------
function ItemCard({ item, onToggleFavorite, onDelete, onOpen, t, readOnly }) {
  const cat = normalizeCat((item.category || item.type || '').toLowerCase());
  const catLabel = CATEGORY_KEYS.includes(cat) ? t('cat_' + cat) : (cat || '—');
  return (
    <div className="cardz">
      <BrandLabel className="card-label" />
      <article className="card" onClick={() => onOpen(item)}>
        <div className="card-media">
          {item.image_url ? (
            <img src={item.image_url} alt={item.item_name} loading="lazy" />
          ) : (
            <div className={`card-placeholder cat-${cat || 'look'}`}>
              <span>{CATEGORY_EMOJI[cat] || '🧺'}</span>
            </div>
          )}
          {readOnly ? (
            item.favorite && <span className="fav-btn active">♥</span>
          ) : (
            <button
              className={'fav-btn' + (item.favorite ? ' active' : '')}
              title={item.favorite ? t('fav_remove') : t('fav_add')}
              onClick={(e) => { e.stopPropagation(); onToggleFavorite(item); }}
            >
              {item.favorite ? '♥' : '♡'}
            </button>
          )}
        </div>
        <div className="card-body">
          <div className="serial">{item.serial}</div>
          <h3>{item.item_name || item.brand_model}</h3>
          {item.brand && <p className="brand">{item.brand}</p>}
          <div className="card-top-row">
            <span className="chip chip-cat">{catLabel}</span>
            <StarRating value={item.rarity} />
          </div>
          <div className="chips">
            {item.color && <span className="chip chip-soft">{item.color}</span>}
            {item.material && <span className="chip chip-soft">{item.material}</span>}
            {(item.occasion_tags || []).slice(0, 2).map((tag) => (
              <span key={tag} className="chip chip-soft">{tag}</span>
            ))}
          </div>
          <div className="card-footer">
            <p className="meta">
              {item.date_scanned}{item.city_scanned ? ' · ' + item.city_scanned : ''}
            </p>
            {!readOnly && (
              <button
                className="del-btn" title={t('delete_item_title')}
                onClick={(e) => { e.stopPropagation(); onDelete(item); }}
              >
                {t('delete')}
              </button>
            )}
          </div>
        </div>
      </article>
    </div>
  );
}

// ---------------------------------------------------------------------
// Tarjeta de outfit
// ---------------------------------------------------------------------
function OutfitCard({ outfit, onToggleFavorite, onDelete, onOpenItem, t, lang, itemsBySerial, readOnly }) {
  const savedDate = (() => {
    const d = new Date(outfit.updated_at || outfit.created_at || Date.now());
    const locales = { es: 'es-AR', en: 'en-US', fr: 'fr-FR' };
    try {
      return d.toLocaleDateString(locales[lang] || 'en-US', { day: 'numeric', month: 'short', year: 'numeric' });
    } catch (e) { return ''; }
  })();
  // Resuelve cada serial del outfit a su prenda real (imagen + datos).
  // Si la prenda fue eliminada del catálogo, se muestra el nombre guardado.
  const garments = (outfit.item_serials || []).map((serial, i) => {
    const item = itemsBySerial[serial] || null;
    const name = item?.item_name || item?.brand_model || (outfit.item_names || [])[i] || '?';
    const cat = normalizeCat((item?.category || item?.type || '').toLowerCase());
    return { serial, name, cat, image_url: item?.image_url || '', item };
  });

  return (
    <div className="ocardz">
      <div className="ocard-tab">✦ Look Analysis · <em>Closet Club</em></div>
      <article className="outfit-card">
        <div className="outfit-header">
          <div className={'match-badge ' + matchClass(outfit.match_percent)}>
            <span className="lbl">Look Analysis<br />Match</span>
            <span className="pct">{outfit.match_percent}%</span>
          </div>
          <h3>{outfit.name}</h3>
          {readOnly ? (
            outfit.favorite && <span className="fav-btn inline active">♥</span>
          ) : (
            <button
              className={'fav-btn inline' + (outfit.favorite ? ' active' : '')}
              onClick={() => onToggleFavorite(outfit)}
            >
              {outfit.favorite ? '♥' : '♡'}
            </button>
          )}
        </div>
        <div className="outfit-thumbs" style={{ '--n': garments.length }}>
          {garments.map((g) => (
            <figure
              key={g.serial}
              className="thumb"
              title={g.name}
              onClick={() => { if (g.item) onOpenItem(g.item); }}
            >
              {g.image_url ? (
                <div className="card-media"><img src={g.image_url} alt={g.name} loading="lazy" /></div>
              ) : (
                <div className={`thumb-placeholder cat-${g.cat || 'look'}`}>
                  <span>{CATEGORY_EMOJI[g.cat] || '🧺'}</span>
                </div>
              )}
              <figcaption>{g.name}</figcaption>
            </figure>
          ))}
        </div>
        <div className="outfit-footer">
          <span className="meta">
            {savedDate && <span className="saved-date">{t('saved_on')} {savedDate}</span>}
            {outfit.ai_feedback && <span className="ai-note"> · “{outfit.ai_feedback}”</span>}
          </span>
          {!readOnly && (
            <button className="del-btn" onClick={() => onDelete(outfit)}>{t('delete')}</button>
          )}
        </div>
      </article>
    </div>
  );
}

// ---------------------------------------------------------------------
// App principal
// ---------------------------------------------------------------------
export default function App() {
  const webToken = getWebToken();
  const [lang, setLang] = useState(detectLang());
  const [profile, setProfile] = useState(null);   // perfil del DUEÑO (por código)
  const [closetPublic, setClosetPublic] = useState(true); // visibilidad del closet propio
  const [users, setUsers] = useState([]);          // galería de closets
  const [viewUser, setViewUser] = useState(null);  // closet que se está mirando
  const [showLink, setShowLink] = useState(false); // pantalla de código (dueños)
  const [showAbout, setShowAbout] = useState(false); // Acerca de Closet Club
  const t = (key, vars) => translate(key, lang, vars);
  function changeLang(code) { saveLang(code); setLang(code); }
  const [tab, setTab] = useState('closet');
  const [items, setItems] = useState([]);
  const [outfits, setOutfits] = useState([]);
  const [loading, setLoading] = useState(true);
  const [backendError, setBackendError] = useState('');
  const [detail, setDetail] = useState(null); // prenda abierta en la ficha

  // Filtros
  const [search, setSearch] = useState('');
  const [category, setCategory] = useState('');
  const [season, setSeason] = useState('');
  const [occasion, setOccasion] = useState('');
  const [rarity, setRarity] = useState('');
  const [onlyFavs, setOnlyFavs] = useState(false);

  // El dueño de un closet es quien tiene el código de ese closet.
  const isOwner = isDemoMode ||
    !!(webToken && profile && viewUser && profile.user_id === viewUser.user_id);

  // --- Galería: lista pública de closets ---
  async function loadUsers() {
    const { data, error } = await supabase.rpc('web_list_users');
    if (error) {
      setBackendError(error.code === 'PGRST202' ? 'MISSING_MODULE' : 'ERROR:' + error.message);
      setLoading(false);
      return;
    }
    setBackendError('');
    setUsers(data || []);
    // Link directo a un closet: #u=<uuid>
    const m = window.location.hash.match(/^#u=([0-9a-f-]{36})/i);
    if (m) {
      const u = (data || []).find((x) => x.user_id === m[1]);
      if (u) setViewUser(u);
    }
    setLoading(false);
  }

  // --- Closet de un usuario (lectura pública) ---
  async function loadCloset(user) {
    if (!user) return;
    setLoading(true);
    const [itemsRes, outfitsRes] = await Promise.all([
      supabase.rpc('web_user_items', { p_user: user.user_id, p_token: webToken || null }),
      supabase.rpc('web_user_outfits', { p_user: user.user_id, p_token: webToken || null }),
    ]);
    if (itemsRes.error || outfitsRes.error) {
      const err = itemsRes.error || outfitsRes.error;
      setBackendError(err.code === 'PGRST202' ? 'MISSING_MODULE' : 'ERROR:' + err.message);
    } else {
      setBackendError('');
      setItems(itemsRes.data || []);
      setOutfits(outfitsRes.data || []);
    }
    setLoading(false);
  }

  useEffect(() => {
    // Vinculación por link: closetclub.netlify.app#c=CLUB-XXXX-XXXX
    const mc = window.location.hash.match(/^#c=([A-Za-z0-9-]{8,})/);
    if (mc) {
      localStorage.setItem('closet_web_token', mc[1]);
      window.location.hash = '';
      window.location.reload();
      return;
    }
    if (isDemoMode) {
      setViewUser({ user_id: 'demo', display_name: 'Demo' });
      setItems(mockItems);
      setOutfits(mockOutfits);
      setLoading(false);
      return;
    }
    // Perfil del dueño (si este navegador tiene código guardado)
    if (webToken) {
      supabase.rpc('web_get_profile', { p_token: webToken }).then(({ data }) => {
        const prof = data && data[0] ? data[0] : null;
        setProfile(prof);
        if (prof) {
          setClosetPublic(prof.is_public !== false);
          // Si la URL apunta a mi propio closet (p. ej. privado tras un refresh),
          // entro directo aunque no aparezca en la lista pública.
          const mu = window.location.hash.match(/^#u=([0-9a-f-]{36})/i);
          if (mu && mu[1] === prof.user_id) {
            setViewUser({ user_id: prof.user_id, display_name: prof.display_name });
          }
        }
      });
    }
    loadUsers();
  }, []);

  useEffect(() => {
    if (isDemoMode || !viewUser) return;
    loadCloset(viewUser);
  }, [viewUser]);

  function openCloset(u) {
    window.location.hash = 'u=' + u.user_id;
    setTab('closet');
    setViewUser(u);
  }

  function backToGallery() {
    window.location.hash = '';
    setViewUser(null);
    setItems([]);
    setOutfits([]);
  }

  // --- Visibilidad del closet (público / privado) ---
  async function toggleVisibility() {
    if (!isOwner || !webToken || isDemoMode) return;
    const next = !closetPublic;
    setClosetPublic(next);
    const { data, error } = await supabase.rpc('web_set_visibility', { p_token: webToken, p_public: next });
    if (error || data === false) setClosetPublic(!next);
  }

  // --- Favoritos ---
  async function toggleItemFavorite(item) {
    if (!isOwner) return;
    const next = !item.favorite;
    setItems((prev) => prev.map((i) => (i.id === item.id ? { ...i, favorite: next } : i)));
    if (!isDemoMode) {
      await supabase.rpc('web_set_item_favorite', { p_token: webToken, p_id: item.id, p_favorite: next });
    }
  }
  async function toggleOutfitFavorite(outfit) {
    if (!isOwner) return;
    const next = !outfit.favorite;
    setOutfits((prev) => prev.map((o) => (o.id === outfit.id ? { ...o, favorite: next } : o)));
    if (!isDemoMode) {
      await supabase.rpc('web_set_outfit_favorite', { p_token: webToken, p_id: outfit.id, p_favorite: next });
    }
  }

  // --- Eliminación (solo desde la web — el lente nunca borra el catálogo) ---
  async function deleteItem(item) {
    if (!isOwner) return;
    const name = item.item_name || item.brand_model || '?';
    if (!window.confirm(t('confirm_delete_item', { name }))) return;
    setItems((prev) => prev.filter((i) => i.id !== item.id));
    if (!isDemoMode) {
      const { data, error } = await supabase.rpc('web_delete_item', { p_token: webToken, p_id: item.id });
      if (error || data !== true) {
        // El servidor no borró: avisar y restaurar la vista real
        window.alert(t('backend_error') + (error ? error.message : 'delete failed'));
        loadCloset(viewUser);
      }
    }
  }

  // "Enviar al lente": deja el pedido para que los Specs recuperen la prenda
  async function sendToLens(item) {
    if (!isOwner || !item.serial) return;
    if (isDemoMode) { window.alert(t('sent_to_lens')); return; }
    const { data, error } = await supabase.rpc('web_request_restore', {
      p_token: webToken, p_serial: item.serial,
    });
    if (!error && data === true) window.alert(t('sent_to_lens'));
    else window.alert(t('backend_error') + (error ? error.message : 'request failed'));
  }

  async function deleteOutfit(outfit) {
    if (!isOwner) return;
    if (!window.confirm(t('confirm_delete_outfit', { name: outfit.name }))) return;
    setOutfits((prev) => prev.filter((o) => o.id !== outfit.id));
    if (!isDemoMode) {
      const { data, error } = await supabase.rpc('web_delete_outfit', { p_token: webToken, p_id: outfit.id });
      if (error || data !== true) {
        window.alert(t('backend_error') + (error ? error.message : 'delete failed'));
        loadCloset(viewUser);
      }
    }
  }

  // --- Opciones de filtros derivadas de los datos ---
  const seasons = useMemo(
    () => [...new Set(items.flatMap((i) => i.season_tags || []))].sort(),
    [items]
  );
  const occasions = useMemo(
    () => [...new Set(items.flatMap((i) => i.occasion_tags || []))].sort(),
    [items]
  );
  const itemsBySerial = useMemo(() => {
    const map = {};
    for (const i of items) { if (i.serial) map[i.serial] = i; }
    return map;
  }, [items]);

  const categoryCounts = useMemo(() => {
    const counts = {};
    for (const i of items) {
      const c = normalizeCat((i.category || i.type || '').toLowerCase());
      if (c) counts[c] = (counts[c] || 0) + 1;
    }
    return counts;
  }, [items]);

  const filteredItems = useMemo(() => {
    const q = search.trim().toLowerCase();
    return items.filter((i) => {
      if (onlyFavs && !i.favorite) return false;
      if (category && normalizeCat((i.category || i.type || '').toLowerCase()) !== category) return false;
      if (season && !(i.season_tags || []).includes(season)) return false;
      if (occasion && !(i.occasion_tags || []).includes(occasion)) return false;
      if (rarity && String(i.rarity) !== rarity) return false;
      if (q) {
        const hay = [i.item_name, i.brand_model, i.brand, i.color, i.material,
          ...(i.style_tags || []), ...(i.custom_tags || [])].join(' ').toLowerCase();
        if (!hay.includes(q)) return false;
      }
      return true;
    });
  }, [items, search, category, season, occasion, rarity, onlyFavs]);

  const filteredOutfits = useMemo(
    () => outfits.filter((o) => !onlyFavs || o.favorite),
    [outfits, onlyFavs]
  );

  // Pantalla de código (solo cuando un dueño la pide desde la galería)
  if (showLink) {
    return <LinkScreen t={t} onCancel={() => setShowLink(false)} />;
  }

  const langButtons = (
    <div className="lang-row">
      {LANGS.map((l) => (
        <button
          key={l.code}
          className={'lang-btn' + (lang === l.code ? ' active' : '')}
          onClick={() => changeLang(l.code)}
        >
          {l.label}
        </button>
      ))}
    </div>
  );

  // ============ ACERCA DE CLOSET CLUB (tutorial gráfico) ============
  if (showAbout) {
    return (
      <div className="app">
        <div className="tray-zone">
          <div className="logo-tab"><h1 className="logo">CLOSET<em>CLUB</em></h1></div>
          <div className="side-label">✦ &nbsp;Info&nbsp; ✦</div>
          <div className="tray">
            <div className="navrow">
              <button className="signout back-btn" onClick={() => setShowAbout(false)}>
                {t('back_gallery')}
              </button>
              <h2 className="about-title">{t('about_link')}</h2>
              {langButtons}
            </div>

            <p className="about-intro">{t('about_intro')}</p>

            <figure className="specs-photo">
              <img src={specsHero} alt="Snapchat Spectacles" />
              <figcaption>
                {t('about_exclusive').split('Specs').map((part, i, arr) => (
                  i < arr.length - 1
                    ? <span key={i}>{part}<a className="specs-link" href="https://www.specs.com/" target="_blank" rel="noreferrer">Specs</a></span>
                    : <span key={i}>{part}</span>
                ))}
              </figcaption>
            </figure>

            <div className="lens-cta-wrap">
              <a
                className="lens-cta"
                href="https://www.spectacles.com/lens/2709490ffb00419ab451a68aa34b01d4?type=SNAPCODE&metadata=01"
                target="_blank" rel="noreferrer"
              >
                {t('lens_cta')}
              </a>
            </div>

            <div className="steps">
              {[1, 2, 3, 4, 5, 6, 7, 8].map((n) => (
                <div key={n} className="step-card">
                  <span className="step-num">{n}</span>
                  <h3>{t('step' + n + '_t')}</h3>
                  <p>{t('step' + n + '_d')}</p>
                </div>
              ))}
            </div>

            <div className="capacity-box">
              <h3>📦 {t('capacity_t')}</h3>
              <p>{t('capacity_d')}</p>
            </div>

            <p className="owner-note">{t('owner_note')}</p>
          </div>
        </div>
      </div>
    );
  }

  // ============ GALERÍA: portada pública con los Bitmojis ============
  if (!viewUser) {
    const missingBanner = backendError === 'MISSING_MODULE'
      ? t('backend_missing')
      : backendError.startsWith('ERROR:') ? t('backend_error') + backendError.slice(6) : '';
    const ownPrivate = !!(profile && !users.some((u) => u.user_id === profile.user_id));
    return (
      <div className="app">
        {missingBanner && <div className="demo-banner">{missingBanner}</div>}
        <div className="tray-zone">
          <div className="logo-tab"><h1 className="logo">CLOSET<em>CLUB</em></h1></div>
          <div className="side-label">✦ &nbsp;Closets&nbsp; ✦</div>
          <div className="tray">
            <div className="navrow">
              <p className="landing-sub">{t('landing_sub')}</p>
              {langButtons}
            </div>
            {loading ? (
              <p className="empty">{t('loading')}</p>
            ) : users.length === 0 && !ownPrivate ? (
              <p className="empty">{t('landing_empty')}</p>
            ) : (
              <div className="user-grid">
                {ownPrivate && (
                  <button
                    className="user-card private-card"
                    onClick={() => openCloset({ user_id: profile.user_id, display_name: profile.display_name })}
                  >
                    <span className="uc-avatar">
                      <span className="uc-fallback">👤</span>
                      <img
                        src={avatarUrl(profile.user_id)} alt=""
                        onError={(e) => { e.currentTarget.style.display = 'none'; }}
                      />
                    </span>
                    <span className="uc-name">{t('closet_of', { name: profile.display_name })}</span>
                    <span className="uc-count">🔒 {t('private_badge')}</span>
                  </button>
                )}
                {users.map((u) => (
                  <button key={u.user_id} className="user-card" onClick={() => openCloset(u)}>
                    <span className="uc-avatar">
                      <span className="uc-fallback">👤</span>
                      <img
                        src={avatarUrl(u.user_id)} alt=""
                        onError={(e) => { e.currentTarget.style.display = 'none'; }}
                      />
                    </span>
                    <span className="uc-name">{t('closet_of', { name: u.display_name })}</span>
                    <span className="uc-count">
                      {u.item_count} · {u.outfit_count} ✦
                    </span>
                  </button>
                ))}
              </div>
            )}
            <div className="lens-cta-wrap">
              <a
                className="lens-cta"
                href="https://www.spectacles.com/lens/2709490ffb00419ab451a68aa34b01d4?type=SNAPCODE&metadata=01"
                target="_blank" rel="noreferrer"
              >
                {t('lens_cta')}
              </a>
              <p className="lens-cta-sub">{t('lens_cta_sub')}</p>
            </div>
            <div className="landing-foot">
              <button className="signout" onClick={() => setShowAbout(true)}>
                {t('about_link')}
              </button>
              <button className="signout" onClick={() => setShowLink(true)}>
                {t('owner_access')}
              </button>
            </div>
          </div>
        </div>
      </div>
    );
  }

  const backendBanner = backendError === 'MISSING_MODULE'
    ? t('backend_missing')
    : backendError.startsWith('ERROR:')
      ? t('backend_error') + backendError.slice(6)
      : '';

  return (
    <div className="app">
      {isDemoMode && <div className="demo-banner">{t('demo_banner')}</div>}
      {backendBanner && <div className="demo-banner">{backendBanner}</div>}

      <div className="tray-zone">
        <div className="logo-tab"><h1 className="logo">CLOSET<em>CLUB</em></h1></div>
        <div className="side-label">
          ✦ {tab === 'closet' ? t('tab_closet') : t('tab_outfits')} ✦
        </div>
        <div className="tray">

      <header className="navrow">
        <button className="signout back-btn" onClick={backToGallery}>{t('back_gallery')}</button>
        <nav className="tabs">
          <button className={tab === 'closet' ? 'active' : ''} onClick={() => setTab('closet')}>
            {t('tab_closet')} <span className="count">{items.length}</span>
          </button>
          <button className={tab === 'outfits' ? 'active' : ''} onClick={() => setTab('outfits')}>
            {t('tab_outfits')} <span className="count">{outfits.length}</span>
          </button>
        </nav>
        <div className="lang-row">
          {LANGS.map((l) => (
            <button
              key={l.code}
              className={'lang-btn' + (lang === l.code ? ' active' : '')}
              onClick={() => changeLang(l.code)}
            >
              {l.label}
            </button>
          ))}
        </div>
        {!isDemoMode && (
          <button className="signout" onClick={() => loadCloset(viewUser)} title={t('refresh_title')}>
            {t('refresh')}
          </button>
        )}
        {!isDemoMode && (
          <div className="user-chip">
            <img
              className="avatar"
              alt=""
              src={avatarUrl(viewUser.user_id)}
              onError={(e) => { e.currentTarget.style.display = 'none'; }}
            />
            <span className="user-name">{viewUser.display_name}</span>
            {isOwner && !isDemoMode && (
              <button
                className={'vis-toggle' + (closetPublic ? '' : ' locked')}
                onClick={toggleVisibility}
                title={closetPublic ? t('vis_public_tip') : t('vis_private_tip')}
              >
                {closetPublic ? '🌍' : '🔒'} <span className="vis-label">{closetPublic ? t('vis_public') : t('vis_private')}</span>
              </button>
            )}
            {isOwner && !ENV_TOKEN && (
              <button
                className="signout"
                onClick={() => { localStorage.removeItem('closet_web_token'); window.location.reload(); }}
              >
                {t('logout')}
              </button>
            )}
          </div>
        )}
      </header>

      {tab === 'closet' && Object.keys(categoryCounts).length > 0 && (
        <div className="cat-row">
          <button
            className={'cat-chip' + (category === '' ? ' active' : '')}
            onClick={() => setCategory('')}
          >
            {t('cat_all')} <span className="count">{items.length}</span>
          </button>
          {Object.entries(categoryCounts).map(([c, n]) => (
            <button
              key={c}
              className={'cat-chip' + (category === c ? ' active' : '')}
              onClick={() => setCategory(category === c ? '' : c)}
            >
              {CATEGORY_EMOJI[c] || ''} {CATEGORY_KEYS.includes(c) ? t('cat_' + c) : c} <span className="count">{n}</span>
            </button>
          ))}
        </div>
      )}

      <div className="filters">
        {tab === 'closet' && (
          <>
            <input
              className="search" type="search" placeholder={t('search_placeholder')}
              value={search} onChange={(e) => setSearch(e.target.value)}
            />
            <select value={season} onChange={(e) => setSeason(e.target.value)}>
              <option value="">{t('filter_season')}</option>
              {seasons.map((s) => <option key={s} value={s}>{s}</option>)}
            </select>
            <select value={occasion} onChange={(e) => setOccasion(e.target.value)}>
              <option value="">{t('filter_occasion')}</option>
              {occasions.map((o) => <option key={o} value={o}>{o}</option>)}
            </select>
            <select value={rarity} onChange={(e) => setRarity(e.target.value)}>
              <option value="">{t('filter_rarity')}</option>
              <option value="5">★★★★★ Signature</option>
              <option value="4">★★★★ Statement</option>
              <option value="3">★★★ Versatile</option>
              <option value="2">★★ Everyday</option>
              <option value="1">★ Basic</option>
            </select>
          </>
        )}
        <label className="fav-filter">
          <input type="checkbox" checked={onlyFavs} onChange={(e) => setOnlyFavs(e.target.checked)} />
          {t('only_favorites')}
        </label>
      </div>

      <main>
        {loading ? (
          <p className="empty">{t('loading')}</p>
        ) : tab === 'closet' ? (
          filteredItems.length === 0 ? (
            <p className="empty">
              {items.length === 0 ? t('empty_catalog') : t('empty_filters')}
            </p>
          ) : (
            <div className="grid">
              {filteredItems.map((item) => (
                <ItemCard
                  key={item.serial || item.id} item={item} t={t} readOnly={!isOwner}
                  onToggleFavorite={toggleItemFavorite} onDelete={deleteItem}
                  onOpen={setDetail}
                />
              ))}
            </div>
          )
        ) : filteredOutfits.length === 0 ? (
          <p className="empty">{t('empty_outfits')}</p>
        ) : (
          <div className="outfit-list">
            {filteredOutfits.map((o) => (
              <OutfitCard
                key={o.serial_key || o.id} outfit={o} t={t} lang={lang} itemsBySerial={itemsBySerial} readOnly={!isOwner}
               
                onToggleFavorite={toggleOutfitFavorite} onDelete={deleteOutfit}
                onOpenItem={setDetail}
              />
            ))}
          </div>
        )}
      </main>

        </div>
      </div>

      {detail && (
        <ItemDetail
          item={detail} onClose={() => setDetail(null)} t={t}
          onSendToLens={isOwner ? sendToLens : null}
        />
      )}
    </div>
  );
}
