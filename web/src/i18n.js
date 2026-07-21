// Traducciones de la web — mismos idiomas que el lente (ES / EN / FR).

export const LANGS = [
  { code: 'fr', label: 'FR' },
  { code: 'en', label: 'EN' },
  { code: 'es', label: 'ES' },
];

const STRINGS = {
  // Header
  tab_closet:    { es: 'Mi Closet', en: 'My Closet', fr: 'Mon Dressing' },
  tab_outfits:   { es: 'Mis Outfits', en: 'My Outfits', fr: 'Mes Tenues' },
  refresh:       { es: 'Actualizar', en: 'Refresh', fr: 'Actualiser' },
  refresh_title: { es: 'Volver a cargar desde la nube', en: 'Reload from the cloud', fr: 'Recharger depuis le cloud' },

  // Categorías
  cat_all:       { es: 'Todas', en: 'All', fr: 'Toutes' },
  cat_top:       { es: 'Top', en: 'Top', fr: 'Haut' },
  cat_bottom:    { es: 'Bottom', en: 'Bottom', fr: 'Bas' },
  cat_shoes:     { es: 'Calzado', en: 'Shoes', fr: 'Chaussures' },
  cat_outerwear: { es: 'Abrigo', en: 'Outerwear', fr: 'Veste' },
  cat_accessory: { es: 'Accesorio', en: 'Accessory', fr: 'Accessoire' },
  cat_dress:     { es: 'Vestido/One-Piece', en: 'Dress/One-Piece', fr: 'Robe/One-Piece' },
  cat_look:      { es: 'Look completo', en: 'Full Look', fr: 'Look complet' },

  vis_public:  { es: 'Público', en: 'Public', fr: 'Public' },
  vis_private: { es: 'Privado', en: 'Private', fr: 'Privé' },
  private_badge: { es: 'Privado', en: 'Private', fr: 'Privé' },
  vis_public_tip: {
    es: 'Closet público: cualquiera puede verlo en la galería. Tocá para hacerlo privado.',
    en: 'Public closet: anyone can view it in the gallery. Tap to make it private.',
    fr: 'Dressing public : visible par tous dans la galerie. Touche pour le rendre privé.',
  },
  vis_private_tip: {
    es: 'Closet privado: solo vos podés verlo, entrando con tu código. Tocá para hacerlo público.',
    en: 'Private closet: only you can view it, using your code. Tap to make it public.',
    fr: 'Dressing privé : toi seul peux le voir, avec ton code. Touche pour le rendre public.',
  },

  // Filtros
  search_placeholder: { es: 'Buscar prenda, marca, color…', en: 'Search item, brand, color…', fr: 'Chercher vêtement, marque, couleur…' },
  filter_season:   { es: 'Temporada', en: 'Season', fr: 'Saison' },
  filter_occasion: { es: 'Ocasión', en: 'Occasion', fr: 'Occasion' },
  filter_rarity:   { es: 'Rareza', en: 'Rarity', fr: 'Rareté' },
  only_favorites:  { es: 'Solo favoritos', en: 'Favorites only', fr: 'Favoris uniquement' },

  // Estados
  loading:        { es: 'Cargando tu closet…', en: 'Loading your closet…', fr: 'Chargement de ton dressing…' },
  empty_catalog:  {
    es: 'Tu catálogo está vacío por ahora. Escaneá una prenda con el lente y guardala: va a aparecer acá sola. ✨',
    en: 'Your catalog is empty for now. Scan a garment with the lens and save it: it will show up here on its own. ✨',
    fr: 'Ton catalogue est vide pour le moment. Scanne un vêtement avec la lens et enregistre-le : il apparaîtra ici tout seul. ✨',
  },
  empty_filters:  {
    es: 'No hay prendas que coincidan con los filtros.',
    en: 'No items match the filters.',
    fr: 'Aucun vêtement ne correspond aux filtres.',
  },
  empty_outfits:  {
    es: 'Todavía no hay outfits guardados. Armá una combinación en el lente: al ver el porcentaje, queda guardada acá.',
    en: 'No outfits saved yet. Compose a look in the lens: once it shows the match %, it is saved here.',
    fr: 'Aucune tenue enregistrée pour l’instant. Compose un look dans la lens : dès que le % s’affiche, il est enregistré ici.',
  },

  // Acciones
  delete:            { es: 'Eliminar', en: 'Delete', fr: 'Supprimer' },
  delete_item_title: { es: 'Eliminar del catálogo web', en: 'Delete from the web catalog', fr: 'Supprimer du catalogue web' },
  confirm_delete_item: {
    es: '¿Eliminar "{name}" del catálogo web? Esta acción no se puede deshacer.',
    en: 'Delete "{name}" from the web catalog? This cannot be undone.',
    fr: 'Supprimer « {name} » du catalogue web ? Cette action est irréversible.',
  },
  confirm_delete_outfit: {
    es: '¿Eliminar el outfit "{name}"?',
    en: 'Delete the outfit "{name}"?',
    fr: 'Supprimer la tenue « {name} » ?',
  },
  fav_add:    { es: 'Marcar favorito', en: 'Add to favorites', fr: 'Ajouter aux favoris' },
  fav_remove: { es: 'Quitar de favoritos', en: 'Remove from favorites', fr: 'Retirer des favoris' },

  // Banners
  demo_banner: {
    es: 'Modo demo con datos de ejemplo — completá .env con tu URL y anon key de Supabase para ver tu closet real.',
    en: 'Demo mode with sample data — fill .env with your Supabase URL and anon key to see your real closet.',
    fr: 'Mode démo avec des données d’exemple — complète .env avec ton URL et ta clé anon Supabase pour voir ton vrai dressing.',
  },
  backend_missing: {
    es: 'La base de datos todavía no tiene el módulo web: ejecutá supabase/web-access.sql en el SQL Editor.',
    en: 'The database is missing the web module: run supabase/web-access.sql in the SQL Editor.',
    fr: 'La base de données n’a pas encore le module web : exécute supabase/web-access.sql dans le SQL Editor.',
  },
  backend_error: { es: 'Error de conexión: ', en: 'Connection error: ', fr: 'Erreur de connexion : ' },

  // Ficha de detalle
  d_brand:     { es: 'Marca', en: 'Brand', fr: 'Marque' },
  d_color:     { es: 'Color', en: 'Color', fr: 'Couleur' },
  d_material:  { es: 'Material', en: 'Material', fr: 'Matière' },
  d_pattern:   { es: 'Estampado', en: 'Pattern', fr: 'Motif' },
  d_fit:       { es: 'Calce', en: 'Fit', fr: 'Coupe' },
  d_condition: { es: 'Estado', en: 'Condition', fr: 'État' },
  d_scanned:   { es: 'Escaneado', en: 'Scanned', fr: 'Scanné' },
  d_serial:    { es: 'Serial', en: 'Serial', fr: 'Série' },
  d_stats:     { es: 'Estadísticas', en: 'Stats', fr: 'Statistiques' },
  d_tags:      { es: 'Etiquetas', en: 'Tags', fr: 'Étiquettes' },
  d_note:      { es: 'Nota de la IA', en: 'AI note', fr: 'Note de l’IA' },
  d_close:     { es: 'Cerrar', en: 'Close', fr: 'Fermer' },
  stat_condition:   { es: 'Condición', en: 'Condition', fr: 'État' },
  stat_versatility: { es: 'Versatilidad', en: 'Versatility', fr: 'Polyvalence' },
  stat_match:       { es: 'Combinabilidad', en: 'Matchability', fr: 'Assortiment' },
  stat_unique:      { es: 'Unicidad', en: 'Uniqueness', fr: 'Originalité' },
  stat_trend:       { es: 'Tendencia', en: 'Trend', fr: 'Tendance' },

  // Galería de closets (landing)
  landing_sub: {
    es: 'Guardarropas escaneados con Spectacles. Elegí un closet para recorrerlo.',
    en: 'Wardrobes scanned with Spectacles. Pick a closet to browse it.',
    fr: 'Dressings scannés avec les Spectacles. Choisis un dressing à explorer.',
  },
  closet_of: { es: 'Closet de {name}', en: "{name}'s Closet", fr: 'Dressing de {name}' },
  back_gallery: { es: '← Closets', en: '← Closets', fr: '← Dressings' },
  owner_access: { es: '✦ Acceso con código (dueños)', en: '✦ Code access (owners)', fr: '✦ Accès par code (proprios)' },
  landing_empty: {
    es: 'Todavía no hay closets. Escaneá prendas con el lente y aparecés acá.',
    en: 'No closets yet. Scan garments with the lens and you appear here.',
    fr: 'Pas encore de dressings. Scanne des vêtements avec la lens et tu apparais ici.',
  },
  cancel: { es: 'Volver', en: 'Back', fr: 'Retour' },
  saved_on: { es: 'Guardado', en: 'Saved', fr: 'Enregistré' },
  send_to_lens: { es: '🕶️ Enviar al lente', en: '🕶️ Send to lens', fr: '🕶️ Envoyer à la lens' },
  sent_to_lens: {
    es: '¡Listo! La prenda va a reaparecer en tus Specs la próxima vez que abras el lente.',
    en: 'Done! The garment will reappear on your Specs the next time you open the lens.',
    fr: 'C’est fait ! Le vêtement réapparaîtra sur tes Specs à la prochaine ouverture de la lens.',
  },

  // Acerca de Closet Club
  about_link:  { es: 'Acerca de Closet Club', en: 'About Closet Club', fr: 'À propos de Closet Club' },
  about_intro: {
    es: 'Escaneá tu ropa con los Spectacles y construí tu guardarropa digital: cada prenda se convierte en una card coleccionable con análisis de IA, y tu closet vive en la web para siempre.',
    en: 'Scan your clothes with Spectacles and build your digital wardrobe: every garment becomes a collectible card with AI analysis, and your closet lives on the web forever.',
    fr: 'Scanne tes vêtements avec les Spectacles et construis ta garde-robe numérique : chaque pièce devient une carte de collection analysée par l’IA, et ton dressing vit sur le web pour toujours.',
  },
  step1_t: { es: 'Ponete los Specs', en: 'Put on your Specs', fr: 'Mets tes Specs' },
  step1_d: {
    es: 'Abrí el lente Closet Club en tus Spectacles y elegí tu idioma. Te conectás con tu cuenta de Snapchat, sin registros.',
    en: 'Open the Closet Club lens on your Spectacles and pick your language. You connect with your Snapchat account, no sign-ups.',
    fr: 'Ouvre la lens Closet Club sur tes Spectacles et choisis ta langue. Tu te connectes avec ton compte Snapchat, sans inscription.',
  },
  step2_t: { es: 'Escaneá una prenda', en: 'Scan a garment', fr: 'Scanne un vêtement' },
  step2_d: {
    es: 'Apuntá a una prenda — en percha, colgada o apoyada — y escaneala. También podés pararte frente a un espejo y escanear tu outfit completo de una vez.',
    en: 'Point at a garment — on a hanger, hung or laid flat — and scan it. You can also stand in front of a mirror and scan your whole outfit at once.',
    fr: 'Vise un vêtement — sur cintre, suspendu ou à plat — et scanne-le. Tu peux aussi te mettre devant un miroir et scanner ta tenue complète d’un coup.',
  },
  step3_t: { es: 'Nace tu card', en: 'Your card is born', fr: 'Ta carte est créée' },
  step3_d: {
    es: 'La IA la analiza: categoría, color, material, rareza y 5 estadísticas de estilo. Tocás Guardar, la IA genera la imagen de esa prenda y queda guardada como card coleccionable.',
    en: 'The AI analyzes it: category, color, material, rarity and 5 style stats. Tap Save, the AI generates that garment’s image and it is stored as a collectible card.',
    fr: 'L’IA l’analyse : catégorie, couleur, matière, rareté et 5 statistiques de style. Touche Enregistrer : l’IA génère l’image du vêtement et elle est gardée comme carte de collection.',
  },
  step4_t: { es: 'Organizá tu closet', en: 'Organize your closet', fr: 'Organise ton dressing' },
  step4_d: {
    es: 'Todas tus prendas se guardan en tu closet: tocá "Abrir closet" en tu muñeca y accedé a un carrusel con todas tus prendas escaneadas.',
    en: 'All your garments live in your closet: tap "Open closet" on your wrist and browse a carousel with everything you scanned.',
    fr: 'Tous tes vêtements sont rangés dans ton dressing : touche « Ouvrir le dressing » sur ton poignet et parcours un carrousel avec tout ce que tu as scanné.',
  },
  step5_t: { es: 'Armá outfits', en: 'Compose outfits', fr: 'Compose des tenues' },
  step5_d: {
    es: 'Combiná tus prendas en los slots del lente y mirá el porcentaje de match al instante. Cada look que armás queda registrado con su puntaje.',
    en: 'Combine your garments in the lens slots and see the match percentage instantly. Every look you build is saved with its score.',
    fr: 'Combine tes vêtements dans les emplacements de la lens et vois le pourcentage de match instantanément. Chaque look est enregistré avec son score.',
  },
  step6_t: { es: 'Tu perfil y tu código', en: 'Your profile & your code', fr: 'Ton profil et ton code' },
  step6_d: {
    es: 'Abrí tu Perfil en el lente: está en tu dedo anular, con la palma abierta mirando hacia vos. Tocá el botón del perfil y vas a ver tu código para entrar y editar tu closet en la web.',
    en: 'Open your Profile in the lens: it sits on your ring finger, with your palm open facing you. Tap the profile button and you will see your code to enter and edit your closet on the web.',
    fr: 'Ouvre ton Profil dans la lens : il se trouve sur ton annulaire, paume ouverte face à toi. Touche le bouton du profil et tu verras ton code pour entrer et gérer ton dressing sur le web.',
  },
  step7_t: { es: 'Todo aparece acá', en: 'Everything shows up here', fr: 'Tout apparaît ici' },
  step7_d: {
    es: 'Tu closet se sube solo a esta web, con tu Bitmoji y tu nombre. En tu Perfil del lente ves la dirección y tu código de dueño. Filtrá, mirá cada ficha y compartí tu link.',
    en: 'Your closet uploads itself to this site, with your Bitmoji and your name. In your lens Profile you see the address and your owner code. Filter, open each card and share your link.',
    fr: 'Ton dressing se télécharge tout seul sur ce site, avec ton Bitmoji et ton nom. Dans ton Profil de la lens tu vois l’adresse et ton code. Filtre, ouvre chaque fiche et partage ton lien.',
  },
  step8_t: { es: 'Recuperá prendas', en: 'Recover garments', fr: 'Récupère des vêtements' },
  step8_d: {
    es: '¿Borraste una prenda en el lente para liberar espacio? Desde la web abrí su ficha y tocá "🕶️ Enviar al lente": va a reaparecer en tus Specs, lista para armar outfits.',
    en: 'Deleted a garment in the lens to free up space? On the web, open its card and tap "🕶️ Send to lens": it will reappear on your Specs, ready for outfits.',
    fr: 'Tu as supprimé un vêtement dans la lens pour libérer de l’espace ? Sur le web, ouvre sa fiche et touche « 🕶️ Envoyer à la lens » : il réapparaîtra sur tes Specs, prêt pour tes tenues.',
  },
  capacity_t: {
    es: 'Tu inventario web es permanente',
    en: 'Your web inventory is permanent',
    fr: 'Ton inventaire web est permanent',
  },
  capacity_d: {
    es: 'Los Spectacles tienen memoria limitada, así que dentro del lente podés borrar prendas para liberar espacio y seguir escaneando: NO se borran de la web. Todo lo que escaneaste queda acá, como tu inventario completo. Para quitar algo de la web, se elimina desde la web — y solo puede hacerlo el dueño del closet.',
    en: 'Spectacles have limited memory, so inside the lens you can delete garments to free up space and keep scanning: they are NOT deleted from the web. Everything you scanned stays here as your complete inventory. To remove something from the web, delete it on the web — and only the closet owner can.',
    fr: 'Les Spectacles ont une mémoire limitée : dans la lens tu peux supprimer des vêtements pour libérer de l’espace et continuer à scanner — ils ne sont PAS supprimés du web. Tout ce que tu as scanné reste ici, comme ton inventaire complet. Pour retirer quelque chose du web, supprime-le sur le web — et seul le propriétaire du dressing le peut.',
  },
  owner_note: {
    es: '¿Es tu closet? Abrí tu Perfil dentro del lente: ahí ves esta web y tu código personal (CLUB-XXXX-XXXX), siempre disponibles. Usalo en "Acceso con código" para administrar tus prendas desde acá.',
    en: 'Is this your closet? Open your Profile inside the lens: there you see this website and your personal code (CLUB-XXXX-XXXX), always available. Use it in "Code access" to manage your garments from here.',
    fr: 'C’est ton dressing ? Ouvre ton Profil dans la lens : tu y vois ce site et ton code personnel (CLUB-XXXX-XXXX), toujours disponibles. Utilise-le dans « Accès par code » pour gérer tes vêtements d’ici.',
  },

  about_exclusive: {
    es: 'Exclusivo para los nuevos Specs — tu closet se escanea únicamente con estos lentes.',
    en: 'Exclusive to the new Specs — your closet can only be scanned with these glasses.',
    fr: 'Exclusif aux nouveaux Specs — ton dressing se scanne uniquement avec ces lunettes.',
  },

  // Vinculación
  link_sub: {
    es: 'Tu closet escaneado con Spectacles, en la web.\nIngresá tu código personal de Closet Club — el lente te lo muestra al conectarse.',
    en: 'Your closet scanned with Spectacles, on the web.\nEnter your personal Closet Club code — the lens shows it when it connects.',
    fr: 'Ton dressing scanné avec les Spectacles, sur le web.\nEntre ton code personnel Closet Club — la lens te le montre à la connexion.',
  },
  link_placeholder: { es: 'CLUB-XXXX-XXXX', en: 'CLUB-XXXX-XXXX', fr: 'CLUB-XXXX-XXXX' },
  link_button:      { es: 'Abrir mi closet', en: 'Open my closet', fr: 'Ouvrir mon dressing' },
  logout:           { es: 'Salir', en: 'Sign out', fr: 'Quitter' },
};

export function detectLang() {
  const saved = localStorage.getItem('closet_lang');
  if (saved && STRINGS.tab_closet[saved]) return saved;
  return 'en';
}

export function saveLang(code) {
  localStorage.setItem('closet_lang', code);
}

/** t('confirm_delete_item', 'es', { name: 'Blazer' }) */
export function translate(key, lang, vars) {
  const entry = STRINGS[key];
  let text = entry ? (entry[lang] || entry.en) : key;
  if (vars) {
    for (const [k, v] of Object.entries(vars)) {
      text = text.split('{' + k + '}').join(v);
    }
  }
  return text;
}
