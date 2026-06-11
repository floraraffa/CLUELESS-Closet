/**
 * Localization.ts — Centralized i18n for Closet Club
 *
 * Supports: English (en), French (fr), Spanish (es).
 * Default language: English
 *
 * Usage:
 *   import { t, tf, setLanguage, getLanguage } from './Localization';
 *   setLanguage('fr');
 *   t('scan_failed');             // "Scan échoué"
 *   tf('saving', { name: 'Blazer' }) // "Sauvegarde de Blazer..."
 *
 * @author Closet Club
 * @license MIT
 */

export type Lang = 'en' | 'fr' | 'es';

let currentLang: Lang = 'en';

export function setLanguage(lang: Lang): void {
    currentLang = lang;
    print('Localization: language set to ' + lang);
}

export function getLanguage(): Lang {
    return currentLang;
}

// =====================================================================
// TRANSLATION TABLE
// =====================================================================

const S: { [key: string]: { en: string; fr: string; es: string } } = {

    // -----------------------------------------------------------------
    // Language Container
    // -----------------------------------------------------------------
    accept_button:          { en: 'Accept', fr: 'Accepter', es: 'Aceptar' },

    // -----------------------------------------------------------------
    // Welcome Container
    // -----------------------------------------------------------------
    welcome_title:          { en: 'Start Scanning your clothes', fr: 'Commencez a scanner vos vetements', es: 'Empieza a escanear tu ropa' },
    welcome_description:    {
        en: 'Scan garments and outfits with Spectacles. Closet Club reads the item, builds a smart closet, and turns every save into a clean polaroid-style wardrobe card.',
        fr: 'Scannez des vêtements et des looks avec Spectacles. Closet Club identifie la pièce, crée un dressing intelligent et transforme chaque sauvegarde en carte façon polaroid.',
        es: 'Escanea prendas y looks con Spectacles. Closet Club interpreta la ropa, crea un armario inteligente y convierte cada guardado en una card estilo polaroid.',
    },
    solo:                   { en: 'Scan Clothes', fr: 'Scanner Vetements', es: 'Escanear Ropa' },
    connected_lens:         { en: 'Shared Closet', fr: 'Shared Closet', es: 'Armario compartido' },

    // -----------------------------------------------------------------
    // Static Container Texts (Yes/Cancel/warnings)
    // -----------------------------------------------------------------
    yes:                    { en: 'Yes', fr: 'Oui', es: 'Sí' },
    cancel_btn:             { en: 'Cancel', fr: 'Annuler', es: 'Cancelar' },
    action_undone:          { en: '\u26A0 This action cannot be undone. \u26A0', fr: '\u26A0 Cette action est irréversible. \u26A0', es: '\u26A0 Esta acción no se puede deshacer. \u26A0' },
    delete_card_question:   { en: 'Are you sure you want to delete this card?', fr: 'Voulez-vous supprimer cette carte ?', es: '¿Quieres eliminar esta carta?' },
    share_question:         { en: 'Are you sure you want to share your collection?', fr: 'Voulez-vous partager votre collection ?', es: '¿Quieres compartir tu colección?' },
    reset_question:         { en: 'Are you sure you want to reset your closet?', fr: 'Voulez-vous réinitialiser votre dressing ?', es: '¿Quieres reiniciar tu armario?' },
    give_card_default:      { en: 'Do you want to share this closet card with username?', fr: 'Voulez-vous partager cette carte dressing avec username ?', es: '¿Quieres compartir esta card de armario con username?' },
    trade_card_default:     { en: 'Do you want to request this closet card from username?', fr: 'Voulez-vous demander cette carte dressing à username ?', es: '¿Quieres pedir esta card de armario a username?' },

    // -----------------------------------------------------------------
    // Closet Scan Interface
    // -----------------------------------------------------------------
    dgns_title:             { en: 'Closet Club', fr: 'Closet Club', es: 'Closet Club' },
    loading_text:           { en: 'Loading', fr: 'Chargement', es: 'Cargando' },
    press_button_hint:      { en: 'Look at a garment or outfit', fr: 'Regardez un vêtement ou un look', es: 'Mira una prenda o un look' },

    // -----------------------------------------------------------------
    // Scanner UI
    // -----------------------------------------------------------------
    scan_vehicle:           { en: 'Scan Look', fr: 'Scanner Look', es: 'Escanear Look' },
    close_scanner:          { en: 'Close Scanner', fr: 'Fermer Scanner', es: 'Cerrar Escáner' },
    open_scanner:           { en: 'Open Scanner', fr: 'Ouvrir Scanner', es: 'Abrir Escáner' },
    scanning:               { en: 'Reading your style', fr: 'Lecture du style', es: 'Leyendo tu estilo' },
    car_detected:           { en: 'Clothing found, styling...', fr: 'Vêtement détecté, analyse...', es: 'Ropa detectada, analizando...' },
    scan_failed:            { en: 'Scan failed', fr: 'Scan échoué', es: 'Escaneo fallido' },
    no_car_detected:        { en: 'No clothing detected', fr: 'Aucun vêtement détecté', es: 'No se detectó ropa' },

    // -----------------------------------------------------------------
    // Style Narrator
    // -----------------------------------------------------------------
    scan_vehicle_first:     { en: 'Scan an item first!', fr: 'Scannez une pièce d\'abord !', es: '¡Escanea una prenda primero!' },
    loading_info:           { en: 'Loading info', fr: 'Chargement des infos', es: 'Cargando info' },
    no_info_available:      { en: 'No style notes available for this item.', fr: 'Aucune note de style disponible.', es: 'No hay notas de estilo para esta prenda.' },
    generating_audio:       { en: 'Generating audio', fr: 'Génération audio', es: 'Generando audio' },
    error_loading_info:     { en: 'Error loading style note.', fr: 'Erreur lors du chargement de la note de style.', es: 'Error al cargar la nota de estilo.' },
    review_in_progress:     { en: 'Review already in progress...', fr: 'Revue déjà en cours...', es: 'Revisión ya en curso...' },
    combine_in_progress:    { en: 'Combination already in progress...', fr: 'Combinaison déjà en cours...', es: 'Combinación ya en curso...' },
    combining_look:         { en: 'Combining from your closet', fr: 'Combinaison depuis votre dressing', es: 'Combinando desde tu armario' },
    combine_look_button:    { en: 'Combine', fr: 'Combiner', es: 'Combinar' },
    combine_need_more_items:{ en: 'Save at least one more closet item before combining looks.', fr: 'Sauvegardez au moins une autre pièce avant de combiner des looks.', es: 'Guarda al menos una prenda más antes de combinar looks.' },
    outfit_need_items:     { en: 'Add at least two pieces to the outfit slots first.', fr: 'Ajoutez au moins deux pièces dans les emplacements du look.', es: 'Agrega al menos dos prendas en los slots del outfit.' },
    outfit_feedback_loading:{ en: 'Reviewing your outfit', fr: 'Analyse de votre look', es: 'Revisando tu outfit' },
    outfit_slot_assigned:  { en: '{item} added to {slot}', fr: '{item} ajouté à {slot}', es: '{item} agregado a {slot}' },
    outfit_wrong_slot:     { en: '{item} belongs in {correctSlot}, not {slot}.', fr: '{item} va dans {correctSlot}, pas dans {slot}.', es: '{item} va en {correctSlot}, no en {slot}.' },
    outfit_category_unknown:{ en: 'I could not place {item}. Scan/category is unclear.', fr: 'Impossible de placer {item}. Le scan ou la catégorie n’est pas clair.', es: 'No pude ubicar {item}. El scan o la categoría no está claro.' },
    outfit_composed:       { en: 'Composed {count} outfit slots', fr: '{count} emplacements de look composés', es: 'Outfit armado con {count} slots' },
    outfit_feedback_fallback_match:{
        en: 'Match: this outfit combines {items}. The strongest move is to keep the colors connected and let one piece be the visual lead. If it feels busy, simplify the shoes or accessories first.',
        fr: 'Match : ce look combine {items}. Le plus important est de garder les couleurs cohérentes et de laisser une pièce guider le style. Si cela semble chargé, simplifiez d’abord les chaussures ou les accessoires.',
        es: 'Hace match: este outfit combina {items}. Lo más fuerte es mantener los colores conectados y dejar que una prenda sea protagonista. Si se siente cargado, simplifica primero los zapatos o accesorios.',
    },
    outfit_feedback_fallback_nomatch:{
        en: 'No match: {items} do not form a complete outfit yet. Add a clearer top-and-bottom pair, a dress with shoes, or simplify the colors before asking again.',
        fr: 'Pas de match : {items} ne forment pas encore un look complet. Ajoutez un duo haut-bas plus clair, une robe avec des chaussures, ou simplifiez les couleurs avant de réessayer.',
        es: 'No hace match: {items} todavía no forman un outfit completo. Agrega un top con bottom más claro, un vestido con zapatos, o simplifica los colores antes de probar de nuevo.',
    },
    look_mix_ready:         { en: 'Showing {count} closet cards for this look', fr: 'Affichage de {count} cartes pour ce look', es: 'Mostrando {count} cards para este look' },
    look_options_ready:     { en: 'Showing {count} best closet matches', fr: 'Affichage des {count} meilleures associations', es: 'Mostrando las {count} mejores combinaciones' },
    look_option_base:       { en: 'Base: {name}', fr: 'Base : {name}', es: 'Base: {name}' },
    look_option_match:      { en: 'Match: {name}', fr: 'Avec : {name}', es: 'Combina: {name}' },
    look_option_match_pct:  { en: '{percent}% Match: {name}', fr: '{percent}% Avec : {name}', es: '{percent}% Combina: {name}' },
    combine_fallback:       {
        en: 'Try {target} with {match}. It is the strongest match in your saved closet right now, so start there and adjust the shoes or layer after the next scan.',
        fr: 'Essayez {target} avec {match}. C’est la meilleure association dans votre dressing sauvegardé pour l’instant, puis ajustez les chaussures ou la couche après le prochain scan.',
        es: 'Prueba {target} con {match}. Es la combinación más fuerte dentro de tu armario guardado por ahora; después puedes ajustar zapatos o capas con el próximo scan.',
    },

    // -----------------------------------------------------------------
    // Stat Labels (Closet Card)
    // -----------------------------------------------------------------
    top_speed:              { en: 'Condition', fr: 'Etat', es: 'Condición' },
    acceleration:           { en: 'Versatility', fr: 'Polyvalence', es: 'Versatilidad' },
    braking:                { en: 'Matchability', fr: 'Association', es: 'Combinabilidad' },
    traction:               { en: 'Uniqueness', fr: 'Unicite', es: 'Unicidad' },
    comfort:                { en: 'Trend Score', fr: 'Tendance', es: 'Tendencia' },

    // -----------------------------------------------------------------
    // Collection Manager
    // -----------------------------------------------------------------
    close_collection:       { en: 'Close Closet', fr: 'Fermer Dressing', es: 'Cerrar Armario' },
    no_vehicles_collection: { en: 'No Items\nin Closet', fr: 'Aucune pièce\ndans le dressing', es: 'Sin prendas\nen armario' },
    open_collection:        { en: 'Open Closet', fr: 'Ouvrir Dressing', es: 'Abrir Armario' },
    share_confirm:          { en: 'Share your closet?', fr: 'Partager votre dressing ?', es: '¿Compartir tu armario?' },
    sharing:                { en: 'Sharing...', fr: 'Partage en cours...', es: 'Compartiendo...' },
    share_url:              { en: 'Closet shared to this URL:\n', fr: 'Dressing partagé à cette URL :\n', es: 'Armario compartido en esta URL:\n' },
    share_unavailable:      { en: 'Share unavailable (cloud not connected)', fr: 'Partage indisponible (cloud non connecté)', es: 'Compartir no disponible (nube no conectada)' },
    collection_not_shared:  { en: 'Closet not shared', fr: 'Dressing non partagé', es: 'Armario no compartido' },
    reset_confirm:          { en: 'Reset your closet?\nAll saved cards will be lost.', fr: 'Réinitialiser votre dressing ?\nToutes les cartes seront perdues.', es: '¿Reiniciar tu armario?\nSe perderán todas las cards guardadas.' },
    scanned_by_unknown:     { en: 'Styled by: Unknown', fr: 'Stylé par : Inconnu', es: 'Estilizado por: Desconocido' },
    no_vehicles_share:      { en: 'No closet items to share!', fr: 'Aucune pièce à partager !', es: '¡No hay prendas para compartir!' },
    share_collection_q:     { en: 'Share your closet?', fr: 'Partager votre dressing ?', es: '¿Compartir tu armario?' },
    sharing_collection:     { en: 'Sharing closet...', fr: 'Partage du dressing...', es: 'Compartiendo armario...' },
    collection_shared:      { en: 'Closet shared!', fr: 'Dressing partagé !', es: '¡Armario compartido!' },
    share_unavail_short:    { en: 'Share unavailable', fr: 'Partage indisponible', es: 'Compartir no disponible' },
    reset_profile_q:        { en: 'Reset closet?', fr: 'Réinitialiser le dressing ?', es: '¿Reiniciar armario?' },
    reset_cancelled:        { en: 'Reset cancelled', fr: 'Réinitialisation annulée', es: 'Reinicio cancelado' },
    profile_reset:          { en: 'Closet reset — {count} cards deleted', fr: 'Dressing réinitialisé — {count} cartes supprimées', es: 'Armario reiniciado — {count} cards eliminadas' },
    no_card_delete:         { en: 'No card to delete', fr: 'Pas de carte à supprimer', es: 'No hay carta para eliminar' },
    delete_confirm:         { en: 'Delete {name}?', fr: 'Supprimer {name} ?', es: '¿Eliminar {name}?' },
    card_deleted:           { en: '{name} deleted', fr: '{name} supprimé', es: '{name} eliminado' },
    delete_cancelled:       { en: 'Delete cancelled', fr: 'Suppression annulée', es: 'Eliminación cancelada' },
    save_in_progress:       { en: 'Save already in progress...', fr: 'Sauvegarde déjà en cours...', es: 'Guardado ya en curso...' },
    scan_first_save:        { en: 'Scan an item first!', fr: 'Scannez une pièce d\'abord !', es: '¡Escanea una prenda primero!' },
    error_prefab:           { en: 'ERROR: verticalCardPrefab not assigned', fr: 'ERREUR : verticalCardPrefab non assigné', es: 'ERROR: verticalCardPrefab no asignado' },
    max_cards:              { en: 'Closet is full! ({max}/{max})', fr: 'Dressing plein ! ({max}/{max})', es: '¡Armario lleno! ({max}/{max})' },
    saving:                 { en: 'Saving {name}...', fr: 'Sauvegarde de {name}...', es: 'Guardando {name}...' },
    already_saved:          { en: '{name} already saved!', fr: '{name} déjà sauvegardé !', es: '¡{name} ya guardado!' },
    generating_card:        { en: 'Generating polaroid card', fr: 'Génération de la carte polaroid', es: 'Generando card polaroid' },
    saving_scan_photo:      { en: 'Saving scan photo', fr: 'Sauvegarde de la photo scannée', es: 'Guardando foto escaneada' },
    card_instantiation_fail:{ en: 'ERROR: Card instantiation failed', fr: 'ERREUR : Création de carte échouée', es: 'ERROR: Fallo al crear la carta' },
    card_ready:             { en: '{name} card ready!', fr: 'Carte {name} prête !', es: '¡Carta {name} lista!' },
    added_to_collection:    { en: '{name} saved to closet! ({count} cards)', fr: '{name} ajouté au dressing ! ({count} cartes)', es: '¡{name} guardado en armario! ({count} cards)' },
    card_gen_failed:        { en: 'Could not generate card, please try again later...', fr: 'Impossible de générer la carte, réessayez plus tard...', es: 'No se pudo generar la carta, inténtalo más tarde...' },
    save_error:             { en: 'SAVE ERROR: {error}', fr: 'ERREUR SAUVEGARDE : {error}', es: 'ERROR DE GUARDADO: {error}' },
    wait_reveal:            { en: 'Wait for card reveal to finish...', fr: 'Attendez la fin de la révélation...', es: 'Espera a que termine la revelación...' },
    collection_empty:       { en: 'Closet empty — scan and save items first!', fr: 'Dressing vide — scannez et sauvegardez des pièces !', es: 'Armario vacío — escanea y guarda prendas primero!' },
    collection_count:       { en: 'Closet: {count} cards', fr: 'Dressing : {count} cartes', es: 'Armario: {count} cards' },
    collection_closed:      { en: 'Closet closed', fr: 'Dressing fermé', es: 'Armario cerrado' },
    card_duplicate:         { en: 'Already in closet!', fr: 'Déjà dans le dressing !', es: '¡Ya está en el armario!' },
    card_added:             { en: '{name} saved to closet!', fr: '{name} ajouté au dressing !', es: '¡{name} guardado en armario!' },
    card_given_away:        { en: '{name} given away!', fr: '{name} donné !', es: '¡{name} regalado!' },
    no_captured_photo:      { en: 'No captured photo — scan an item first', fr: 'Pas de photo — scannez une pièce d\'abord', es: 'Sin foto — escanea una prenda primero' },
    generating_card_n:      { en: 'Generating Polaroid ({n}/{total})', fr: 'Génération Polaroid ({n}/{total})', es: 'Generando Polaroid ({n}/{total})' },
    generating_garment_cutout:{ en: 'Creating closet image...', fr: 'Création de l’image dressing...', es: 'Creando imagen para el armario...' },
    garment_cutout_ready:   { en: '{name} closet image ready!', fr: 'Image dressing de {name} prête !', es: '¡Imagen de {name} lista en el armario!' },
    garment_cutout_failed:  { en: 'Could not create closet image, keeping scan photo', fr: 'Impossible de créer l’image dressing, photo conservée', es: 'No se pudo crear la imagen, queda la foto escaneada' },
    closet_slot_opened:     { en: 'Opening {name} card', fr: 'Ouverture de la carte {name}', es: 'Abriendo card de {name}' },
    closet_page_status:     { en: 'Closet page {page}/{pages}', fr: 'Page dressing {page}/{pages}', es: 'Página del armario {page}/{pages}' },
    image_gen_busy:         { en: 'Image generation busy, try again later', fr: 'Génération d\'image occupée, réessayez plus tard', es: 'Generación de imagen ocupada, inténtalo más tarde' },
    card_sparkle:           { en: '\u2728 {name} \u2728', fr: '\u2728 {name} \u2728', es: '\u2728 {name} \u2728' },
    release_to_collect:     { en: '{name} — release to collect', fr: '{name} — relâchez pour collecter', es: '{name} — suelta para coleccionar' },
    card_collected:         { en: 'Card collected!', fr: 'Carte collectée !', es: '¡Carta coleccionada!' },

    // -----------------------------------------------------------------
    // XP Manager
    // -----------------------------------------------------------------
    lvl_prefix:             { en: 'LVL ', fr: 'NIV ', es: 'NIV ' },
    xp_max:                 { en: 'XP {xp} / MAX', fr: 'XP {xp} / MAX', es: 'XP {xp} / MAX' },
    xp_progress:            { en: 'XP {xp}/{next}', fr: 'XP {xp}/{next}', es: 'XP {xp}/{next}' },
    streak_long:            { en: '\u2728 {days}-day streak! x{mult} XP \u2728', fr: '\u2728 Série de {days} jours ! x{mult} XP \u2728', es: '\u2728 ¡Racha de {days} días! x{mult} XP \u2728' },
    streak_short:           { en: '\u2B50 2-day streak! x{mult} XP', fr: '\u2B50 Série de 2 jours ! x{mult} XP', es: '\u2B50 ¡Racha de 2 días! x{mult} XP' },
    no_streak:              { en: 'No Streak...\nCome back tomorrow!', fr: 'Pas de série...\nRevenez demain !', es: 'Sin racha...\n¡Vuelve mañana!' },
    prestige_label:         { en: 'Prestige', fr: 'Prestige', es: 'Prestigio' },
    xp_popup:               { en: '+{amount} XP', fr: '+{amount} XP', es: '+{amount} XP' },
    trust_popup:            { en: '+{amount}% Trust', fr: '+{amount}% Confiance', es: '+{amount}% Confianza' },
    trust_penalty:          { en: '-{amount}% Trust', fr: '-{amount}% Confiance', es: '-{amount}% Confianza' },
    level_up:               { en: 'LEVEL UP! LVL {level}: {name}', fr: 'NIVEAU SUPÉRIEUR ! NIV {level} : {name}', es: '¡SUBIDA DE NIVEL! NIV {level}: {name}' },
    level_up_reveal_title:  { en: 'LEVEL UP!', fr: 'NIVEAU SUPÉRIEUR !', es: '¡SUBIDA DE NIVEL!' },
    level_up_reveal_body:   { en: 'You go from LVL {from} to LVL {to}: {name}. Congratulations!', fr: 'Vous passez de NIV {from} à NIV {to} : {name}. Félicitations !', es: 'Pasas de NIV {from} a NIV {to}: {name}. ¡Felicidades!' },
    prestige_up:            { en: 'Prestige {n}! Back to Learner Driver', fr: 'Prestige {n} ! Retour à Learner Driver', es: '¡Prestigio {n}! Vuelves a Learner Driver' },
    streak_bonus_long:      { en: '\u2728 {days}-day streak! \u2728\nx{mult} XP bonus!', fr: '\u2728 Série de {days} jours ! \u2728\nx{mult} XP bonus !', es: '\u2728 ¡Racha de {days} días! \u2728\n¡x{mult} XP bonus!' },
    streak_bonus_short:     { en: '\u2B50 2-day streak! \u2B50\nx{mult} XP bonus!', fr: '\u2B50 Série de 2 jours ! \u2B50\nx{mult} XP bonus !', es: '\u2B50 ¡Racha de 2 días! \u2B50\n¡x{mult} XP bonus!' },

    // -----------------------------------------------------------------
    // Cloud Manager
    // -----------------------------------------------------------------
    profile_collection_reset: { en: 'Closet reset', fr: 'Dressing réinitialisé', es: 'Armario reiniciado' },
    trade_failed_card:      { en: 'Request failed: card not found', fr: 'Demande échouée : carte introuvable', es: 'Solicitud fallida: card no encontrada' },
    trade_complete:         { en: 'Card shared! Closet card received.', fr: 'Carte partagée ! Carte dressing reçue.', es: '¡Card compartida! Card de armario recibida.' },
    trade_transfer_failed:  { en: 'Closet card transfer failed', fr: 'Transfert de carte dressing échoué', es: 'Falló la transferencia de la card de armario' },
    trade_request:          { en: 'Closet card request: {name}', fr: 'Demande de carte dressing : {name}', es: 'Solicitud de card de armario: {name}' },
    trade_accepted:         { en: 'Card shared! {name}', fr: 'Carte partagée ! {name}', es: '¡Card compartida! {name}' },
    not_connected:          { en: 'Not connected to cloud', fr: 'Non connecté au cloud', es: 'No conectado a la nube' },
    scan_vehicles_first:    { en: 'Scan some items first!', fr: 'Scannez quelques pièces d\'abord !', es: '¡Escanea algunas prendas primero!' },
    share_failed:           { en: 'Share failed', fr: 'Partage échoué', es: 'Error al compartir' },
    collection_shared_n:    { en: 'Closet shared! {count} items', fr: 'Dressing partagé ! {count} pièces', es: '¡Armario compartido! {count} prendas' },
    gallery_shared:         { en: 'Gallery shared!\n{url}', fr: 'Galerie partagée !\n{url}', es: '¡Galería compartida!\n{url}' },
    global_rank:            { en: 'Global Rank: #{rank} of {total}', fr: 'Classement : #{rank} sur {total}', es: 'Ranking global: #{rank} de {total}' },
    trade_request_card:     { en: 'Closet card request: {name} ({rarity}\u2605)', fr: 'Demande de carte dressing : {name} ({rarity}\u2605)', es: 'Solicitud de card de armario: {name} ({rarity}\u2605)' },
    cloud_not_connected:    { en: 'Cloud not connected', fr: 'Cloud non connecté', es: 'Nube no conectada' },
    share_failed_err:       { en: 'Share failed: {error}', fr: 'Partage échoué : {error}', es: 'Error al compartir: {error}' },

    // -----------------------------------------------------------------
    // Shared Closet Manager
    // -----------------------------------------------------------------
    anchor_found:           { en: 'Anchor found!\nSpatial map detected', fr: 'Ancre trouvée !\nCarte spatiale détectée', es: '¡Ancla encontrada!\nMapa espacial detectado' },
    aligning:               { en: 'Aligning...\nSyncing coordinate spaces', fr: 'Alignement...\nSynchronisation des espaces', es: 'Alineando...\nSincronizando espacios' },
    all_synced:             { en: 'All good, in sync!\nSpaces aligned — starting...', fr: 'Tout est bon, synchronisé !\nEspaces alignés — démarrage...', es: '¡Todo listo, sincronizado!\nEspacios alineados — iniciando...' },
    look_at_player:         { en: 'Look at your friend\nFace them head-on, within 2 meters', fr: 'Regardez votre ami\nFaites-lui face, à moins de 2 mètres', es: 'Mira a tu amigo\nPonte frente a él, a menos de 2 metros' },
    scan_room:              { en: 'You\'re the Host!\nSlowly look around to create a 3D map', fr: 'Vous êtes l\'Hôte !\nRegardez lentement autour pour créer une carte 3D', es: '¡Eres el Anfitrión!\nMira lentamente alrededor para crear un mapa 3D' },
    keep_scanning:          { en: 'Keep scanning...\nMove your head around the room', fr: 'Continuez à scanner...\nBougez la tête dans la pièce', es: 'Sigue escaneando...\nMueve la cabeza por la sala' },
    mapping_env:            { en: 'Mapping environment\nLook at walls, floor, and ceiling', fr: 'Cartographie en cours\nRegardez murs, sol et plafond', es: 'Mapeando entorno\nMira paredes, suelo y techo' },
    almost_there:           { en: 'Almost there...\nKeep looking around slowly', fr: 'Presque terminé...\nContinuez à regarder lentement', es: 'Casi listo...\nSigue mirando lentamente' },
    keep_looking_friend:    { en: 'Keep looking at your friend\nBoth players must wear Spectacles', fr: 'Continuez à regarder votre ami\nLes deux joueurs doivent porter des Spectacles', es: 'Sigue mirando a tu amigo\nAmbos jugadores deben llevar Spectacles' },
    aligning_spaces:        { en: 'Aligning spaces...\nYour Spectacles are syncing with theirs', fr: 'Alignement des espaces...\nVos Spectacles se synchronisent avec les siennes', es: 'Alineando espacios...\nTus Spectacles se sincronizan con las suyas' },
    good_lighting:          { en: 'Good lighting helps!\nStay within 2m, face-to-face', fr: 'Un bon éclairage aide !\nRestez à moins de 2m, face à face', es: '¡Buena iluminación ayuda!\nQuédate a menos de 2m, cara a cara' },
    partial_sync:           { en: 'Partial sync\nAlignment may be imprecise', fr: 'Synchronisation partielle\nL\'alignement peut être imprécis', es: 'Sincronización parcial\nEl alineamiento puede ser impreciso' },
    sync_timeout:           { en: 'Sync timeout\nBoth players must wear Spectacles\nand face each other (<2m)', fr: 'Timeout de synchronisation\nLes deux joueurs doivent porter des Spectacles\net se faire face (<2m)', es: 'Tiempo de sincronización agotado\nAmbos jugadores deben llevar Spectacles\ny mirarse (<2m)' },
    anchor_found_short:     { en: '\nAnchor found!', fr: '\nAncre trouvée !', es: '\n¡Ancla encontrada!' },
    aligning_coords:        { en: '\nAligning coordinates...', fr: '\nAlignement des coordonnées...', es: '\nAlineando coordenadas...' },

    // Phase-specific keys removed — unified guidance used instead
    coloc_no_located_warn:  { en: 'Alignment incomplete\nPositions may not be accurate', fr: 'Alignement incomplet\nLes positions peuvent être imprécises', es: 'Alineación incompleta\nLas posiciones pueden ser imprecisas' },
    give_card_confirm:      { en: 'Give {card} to {player}?', fr: 'Donner {card} à {player} ?', es: '¿Dar {card} a {player}?' },
    requesting_card:        { en: 'Requesting {card} from {player}...', fr: 'Demande de {card} à {player}...', es: 'Solicitando {card} a {player}...' },
    card_no_longer:         { en: 'Card no longer in your collection!', fr: 'Carte plus dans votre collection !', es: '¡La carta ya no está en tu colección!' },
    card_given:             { en: 'Card given away!', fr: 'Carte donnée !', es: '¡Carta regalada!' },
    trade_cancelled_dc:     { en: 'Share cancelled — player disconnected. Card restored.', fr: 'Partage annulé — joueur déconnecté. Carte restaurée.', es: 'Compartir cancelado — jugador desconectado. Carta restaurada.' },
    connected_lens_unavail: { en: 'Shared Closet unavailable', fr: 'Dressing partagé indisponible', es: 'Armario compartido no disponible' },
    session_error:          { en: 'Session error: {desc}', fr: 'Erreur de session : {desc}', es: 'Error de sesión: {desc}' },
    connection_failed:      { en: 'Connection failed\n{desc}', fr: 'Connexion échouée\n{desc}', es: 'Conexión fallida\n{desc}' },
    no_internet:            { en: 'No internet connection\nPlease check your WiFi', fr: 'Pas de connexion internet\nVérifiez votre WiFi', es: 'Sin conexión a internet\nRevisa tu WiFi' },
    session_lost:           { en: 'Session lost\nReturning to menu...', fr: 'Session perdue\nRetour au menu...', es: 'Sesión perdida\nVolviendo al menú...' },
    give_request_busy:      { en: 'Player is busy with another share request', fr: 'Le joueur est occupé avec une autre demande de partage', es: 'El jugador está ocupado con otra solicitud' },
    disconnected:           { en: 'Disconnected from session', fr: 'Déconnecté de la session', es: 'Desconectado de la sesión' },
    player_joined:          { en: '{name} joined!', fr: '{name} a rejoint !', es: '¡{name} se unió!' },
    player_left:            { en: '{name} left', fr: '{name} est parti', es: '{name} se fue' },
    received_card:          { en: 'Received {name}!', fr: '{name} reçu !', es: '¡{name} recibido!' },
    request_declined:       { en: 'Request declined.', fr: 'Demande refusée.', es: 'Solicitud rechazada.' },
    trade_expired:          { en: 'Closet card request expired.', fr: 'Demande de carte dressing expirée.', es: 'Solicitud de card de armario expirada.' },

    // -----------------------------------------------------------------
    // Music Player
    // -----------------------------------------------------------------
    no_tracks:              { en: 'No tracks', fr: 'Aucun titre', es: 'Sin pistas' },
    track_n:                { en: 'Track {n}', fr: 'Piste {n}', es: 'Pista {n}' },

    // -----------------------------------------------------------------
    // GPT Prompts — Language instruction appended to system prompt
    // -----------------------------------------------------------------
    gpt_narrator_lang:      {
        en: '- Write in English',
        fr: '- Écris en français',
        es: '- Escribe en español',
    },
    gpt_narrator_prompt:    {
        en: 'Give me a short stylist note for {vehicle}, category {type}, brand {brand}.',
        fr: 'Donne-moi une courte note de styliste pour {vehicle}, catégorie {type}, marque {brand}.',
        es: 'Dame una nota corta de estilismo para {vehicle}, categoría {type}, marca {brand}.',
    },
    tts_instruction:        {
        en: 'Speak in English like a calm, confident fashion stylist. Clear, warm, and practical.',
        fr: 'Parle en français comme un styliste calme et confiant. Clair, chaleureux et pratique.',
        es: 'Habla en español como un estilista tranquilo y seguro. Claro, cálido y práctico.',
    },
};

// =====================================================================
// IDLE PHRASES — 20 per language
// =====================================================================

const IDLE_PHRASES_TABLE: { en: string[]; fr: string[]; es: string[] } = {
    en: [
        'Point at a garment and press Scan.',
        'Your closet is waiting for its next card.',
        'Scan a look. Keep the good ideas.',
        'A good outfit deserves an archive.',
        'Look at a piece, then let Closet Club read it.',
        'Scan tops, bottoms, shoes, or a full look.',
        'Your wardrobe is becoming searchable.',
        'One scan closer to a smarter closet.',
        'That outfit has something to say.',
        'Find the piece. Save the look.',
        'Scan now, style later.',
        'A little closet intelligence never hurt.',
        'Let the Lens read the fit.',
        'Build your wardrobe one polaroid at a time.',
        'No typing. Just scan the item.',
        'The next outfit starts here.',
        'Catalog the piece while it is in front of you.',
        'Your closet is about to get organized.',
        'Scan the item. Save the story.',
        'Ready when the outfit is.',
    ],
    fr: [
        'Trouvez des voitures, collectionnez-les toutes...',
        'Pointez une voiture et appuyez sur Scanner !',
        'Certains disent que ce scanner est plus rapide qu\'un tour du Stig...',
        'Vous cherchez quelque chose à quatre roues ?',
        'Chaque voiture a une histoire. Quelle est la vôtre ?',
        'Vous avez repéré une beauté ? Scannez-la !',
        'C\'est pas si compliqué ! Appuyez sur le bouton !',
        'Vitesse. Puissance. Bouton Scanner.',
        'Les voitures ne se scannent pas toutes seules... pas encore.',
        'Votre collection attend sa prochaine carte.',
        'C\'est une Lambo ? Un seul moyen de le savoir...',
        'Ambition. Vitesse. Un appareil photo. C\'est parti.',
        'Ce soir dans l\'émission... vous scannez une voiture !',
        'Dans le monde... le meilleur scanner...',
        'PUISSAAANCE ! Et aussi... scanner.',
        'Prêt à ajouter des chevaux à votre collection ?',
        'Cette voiture a l\'air seule. Offrez-lui une carte.',
        'Même une Reliant Robin mérite sa carte.',
        'Clarkson approuverait. Scannez ce truc.',
        'Ceci n\'est pas un exercice. C\'est un scanner.',
    ],
    es: [
        'Apunta a una prenda y pulsa Escanear.',
        'Tu armario espera su próxima card.',
        'Escanea un look. Guarda las buenas ideas.',
        'Un buen outfit merece archivo.',
        'Mira una prenda y deja que Closet Club la lea.',
        'Escanea tops, bottoms, zapatos o un look completo.',
        'Tu armario se está volviendo searchable.',
        'Un scan más cerca de un armario inteligente.',
        'Ese outfit tiene algo para decir.',
        'Encuentra la prenda. Guarda el look.',
        'Escanea ahora, combina después.',
        'Un poco de inteligencia de armario no hace daño.',
        'Deja que el Lens lea el fit.',
        'Construye tu armario una polaroid a la vez.',
        'Sin escribir. Solo escanea la prenda.',
        'El próximo outfit empieza acá.',
        'Cataloga la prenda mientras la tienes enfrente.',
        'Tu armario está por ordenarse.',
        'Escanea la prenda. Guarda la historia.',
        'Listo cuando el outfit lo esté.',
    ],
};

// =====================================================================
// CHEAT MESSAGES — 15 per language
// =====================================================================

const CHEAT_MESSAGES_TABLE: { en: string[]; fr: string[]; es: string[] } = {
    en: [
        "That looks like a screen.\nPoint Closet Club at real clothing.",
        "Nice try, but this closet\nneeds real garments.",
        "Screenshots do not belong\nin the wardrobe archive.",
        "Scan the item in front of you,\nnot a photo of it.",
        "Closet Club wants fabric,\nshape, and color in real space.",
        "That is not a live scan.\nFind the actual piece.",
        "A closet card should start\nwith a real garment.",
        "Your Trust score dropped.\nScan clothing in person.",
        "This is a wardrobe scanner,\nnot a screenshot collector.",
        "Point at a top, bottom,\nshoe, or full outfit.",
        "The archive gets smarter\nwhen the scan is real.",
        "Try again with the item\nin front of the camera.",
        "Closet Club can read style,\nbut not shortcuts.",
        "Real clothes only.\nYour closet deserves better.",
        "Trust drops again.\nScan real wardrobe pieces.",
    ],
    fr: [
        "C'est pas une vraie voiture, mon ami.\nSors dehors et trouve-en une !\nTes jambes fonctionnent, non ?",
        "Bien essayé, mais je ne suis pas\nné de la dernière pluie.\nScanne une VRAIE voiture.",
        "Un écran ? Sérieusement ?\nC'est comme mettre une photo\nde nourriture dans ton assiette.",
        "J'ai vu de meilleurs tricheurs\nqu'un GPS recalculant.\nTon score de Confiance vient de chuter.",
        "Hammond serait\ndéçu de toi.\nEn fait non, il ferait pareil.",
        "Si tu continues comme ça,\nta réputation sera pire\nqu'une Reliant Robin.",
        "C'est une photo, espèce\nd'âne ! Va trouver quelque\nchose avec de vraies roues !",
        "Ton score de Confiance chute\nplus vite qu'une caravane\nd'une falaise. Arrête de tricher.",
        "Franchement, c'est si dur\nde trouver une vraie voiture ?\nIl y en a PARTOUT.",
        "Bon. À ce rythme ton\nrang de Confiance affichera\n'Voleur de Voitures'. Je dis ça...",
        "C'est un jeu de scan,\npas un jeu de captures d'écran.\nSors de chez toi !",
        "Oh non. Bref...\nTon score de Confiance vient\nde prendre un autre coup.",
        "Certains disent que tu as triché.\nTout ce qu'on sait, c'est que\ntu as perdu plus de Confiance.",
        "Tricher dans un jeu de voitures ?\nC'est comme mettre\nune perruque à un cochon.",
        "Sur ce coup de théâtre...\nton score de Confiance baisse\nENCORE. Scanne de vraies voitures !",
    ],
    es: [
        "Eso parece una pantalla.\nApunta Closet Club a ropa real.",
        "Buen intento, pero este armario\nnecesita prendas reales.",
        "Las capturas no pertenecen\nal archivo de tu armario.",
        "Escanea la prenda frente a ti,\nno una foto de ella.",
        "Closet Club necesita tela,\nforma y color en espacio real.",
        "Eso no es un scan en vivo.\nBusca la prenda real.",
        "Una card de armario debería\nnacer de una prenda real.",
        "Tu Confianza bajó.\nEscanea ropa en persona.",
        "Esto es un scanner de armario,\nno de screenshots.",
        "Apunta a un top, bottom,\nzapato o look completo.",
        "El archivo mejora cuando\nel scan es real.",
        "Intenta otra vez con la prenda\nfrente a la cámara.",
        "Closet Club puede leer estilo,\npero no atajos.",
        "Solo ropa real.\nTu armario merece algo mejor.",
        "La Confianza baja otra vez.\nEscanea prendas reales.",
    ],
};

// =====================================================================
// COLOCATION GUIDANCE ARRAYS
// =====================================================================

const COLOCATION_GUIDANCE_TABLE: { en: string[]; fr: string[]; es: string[] } = {
    en: [
        'Look around slowly\nScan the room to build a shared 3D map',
        'Face your friend, within 2 meters\nBoth Spectacles need to see each other',
        'Keep scanning...\nLook at walls, floor, ceiling, and objects',
        'Stay close to your friend\nFace-to-face helps alignment',
        'Good lighting helps!\nAvoid dark or featureless areas',
        'Aligning spaces...\nKeep looking around and stay within 2m',
        'Both players: look around slowly\nThe room is being mapped for shared AR',
        'Tip: stay within 2m of each other\nThe closer you are, the faster it syncs',
    ],
    fr: [
        'Regardez lentement autour de vous\nScannez la pièce pour créer une carte 3D partagée',
        'Faites face à votre ami, à moins de 2 mètres\nLes deux Spectacles doivent se voir',
        'Continuez à scanner...\nRegardez murs, sol, plafond et objets',
        'Restez proche de votre ami\nFace à face aide l\'alignement',
        'Un bon éclairage aide !\nÉvitez les zones sombres ou uniformes',
        'Alignement en cours...\nContinuez à regarder autour, restez à 2m',
        'Les deux joueurs : regardez autour lentement\nLa pièce est cartographiée pour l\'AR partagé',
        'Astuce : restez à moins de 2m l\'un de l\'autre\nPlus vous êtes proches, plus c\'est rapide',
    ],
    es: [
        'Mira lentamente a tu alrededor\nEscanea la sala para crear un mapa 3D compartido',
        'Mira a tu amigo, a menos de 2 metros\nAmbas Spectacles deben verse',
        'Sigue escaneando...\nMira paredes, suelo, techo y objetos',
        'Quédate cerca de tu amigo\nCara a cara ayuda a la alineación',
        '¡Buena iluminación ayuda!\nEvita zonas oscuras o sin rasgos',
        'Alineando espacios...\nSigue mirando alrededor, quédate a 2m',
        'Ambos jugadores: miren lentamente\nLa sala se mapea para AR compartido',
        'Consejo: quédense a menos de 2m\nMás cerca = sincronización más rápida',
    ],
};

// =====================================================================
// PUBLIC API
// =====================================================================

export function t(key: string): string {
    const entry = S[key];
    if (!entry) return key;
    return entry[currentLang] || entry['en'] || key;
}

export function tf(key: string, params: { [k: string]: string | number }): string {
    let text = t(key);
    const keys = Object.keys(params);
    for (let i = 0; i < keys.length; i++) {
        const k = keys[i];
        const parts = text.split('{' + k + '}');
        text = parts.join(String(params[k]));
    }
    return text;
}

export function getIdlePhrases(): string[] {
    return IDLE_PHRASES_TABLE[currentLang] || IDLE_PHRASES_TABLE['en'];
}

export function getCheatMessages(): string[] {
    return CHEAT_MESSAGES_TABLE[currentLang] || CHEAT_MESSAGES_TABLE['en'];
}

export function getColocationGuidanceMessages(): string[] {
    return COLOCATION_GUIDANCE_TABLE[currentLang] || COLOCATION_GUIDANCE_TABLE['en'];
}
