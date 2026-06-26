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
    language_welcome_heading:{ en: 'Choose your\nlanguage', fr: 'Choisissez\nvotre langue', es: 'Elige tu\nidioma' },
    language_select_hint:   { en: 'Select language', fr: 'Selectionnez la langue', es: 'Selecciona idioma' },

    // -----------------------------------------------------------------
    // Welcome Container
    // -----------------------------------------------------------------
    welcome_title:          { en: 'Scan\nyour clothes', fr: 'Scannez\nvos vêtements', es: 'Escanea\ntu ropa.' },
    welcome_description:    {
        en: 'Scan clothes and outfits with Spectacles. \n\nCloset Club reads every garment, creates a smart wardrobe, and turns every save into a Polaroid-style closet card. Scan your garment individually or stand in front of a mirror and scan your entire outfit.',
        fr: 'Scannez vos vêtements et tenues avec vos Spectacles. \n\nCloset Club analyse chaque vêtement, crée une garde-robe intelligente et transforme chaque sauvegarde en une fiche de dressing façon Polaroid. Scannez vos vêtements individuellement ou placez-vous devant un miroir pour scanner votre tenue complète.',
        es: 'Escanea prendas y looks con Spectacles.\n\nCloset Club lee cada prenda, crea un armario inteligente y convierte cada guardado en una card de armario estilo polaroid. Escanea tu prenda individualmente o parate frente a un espejo y escanea tu look completo.',
    },
    solo:                   { en: 'Scan Clothes', fr: 'Scanner Vetements', es: 'Escanear Ropa' },
    connected_lens:         { en: 'Shared Closet', fr: 'Shared Closet', es: 'Armario compartido' },
    closet_club_title:      { en: 'Closet Club', fr: 'Closet Club', es: 'Closet Club' },

    // -----------------------------------------------------------------
    // Static Container Texts (Yes/Cancel/warnings)
    // -----------------------------------------------------------------
    yes:                    { en: 'Yes', fr: 'Oui', es: 'Sí' },
    cancel_btn:             { en: 'Cancel', fr: 'Annuler', es: 'Cancelar' },
    action_undone:          { en: '\u26A0 This action cannot be undone. \u26A0', fr: '\u26A0 Cette action est irréversible. \u26A0', es: '\u26A0 Esta acción no se puede deshacer. \u26A0' },
    delete_card_question:   { en: 'Are you sure you want to delete this card?', fr: 'Voulez-vous supprimer cette carte ?', es: '¿Quieres eliminar esta carta?' },
    share_question:         { en: 'Are you sure you want to share your collection?', fr: 'Voulez-vous partager votre collection ?', es: '¿Quieres compartir tu colección?' },
    reset_question:         { en: 'Are you sure you want to reset your closet?', fr: 'Voulez-vous réinitialiser votre dressing ?', es: '¿Quieres reiniciar tu armario?' },
    reset_closet_question:  { en: 'Reset your closet?\nAll saved wardrobe cards will be lost!', fr: 'Réinitialiser votre dressing ?\nToutes les cartes sauvegardées seront perdues !', es: '¿Reiniciar tu armario?\nSe perderán todas las cards guardadas.' },
    give_card_default:      { en: 'Do you want to share this closet card with username?', fr: 'Voulez-vous partager cette carte dressing avec username ?', es: '¿Quieres compartir esta card de armario con username?' },
    trade_card_default:     { en: 'Do you want to request this closet card from username?', fr: 'Voulez-vous demander cette carte dressing à username ?', es: '¿Quieres pedir esta card de armario a username?' },

    // -----------------------------------------------------------------
    // Closet Scan Interface
    // -----------------------------------------------------------------
    dgns_title:             { en: 'Closet Club', fr: 'Closet Club', es: 'Closet Club' },
    loading_text:           { en: 'Loading', fr: 'Chargement', es: 'Cargando' },
    press_button_hint:      { en: 'Look at a garment or outfit', fr: 'Regardez un vêtement ou un look', es: 'Mira una prenda o un look' },
    scan_looks_build:       { en: 'Scan looks, build your closet.', fr: 'Scannez des looks, construisez votre dressing.', es: 'Escanea looks, arma tu armario.' },
    save_the_look:          { en: 'Save the look', fr: 'Sauvegarder le look', es: 'Guardar el look' },
    mute_narrator:          { en: 'Mute\nNarrator', fr: 'Couper\nNarrateur', es: 'Silenciar\nNarrador' },
    music_player:           { en: 'Music Player', fr: 'Lecteur musique', es: 'Reproductor musical' },

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
    delete_btn:             { en: 'Delete', fr: 'Supprimer', es: 'Eliminar' },
    get_more_info_button:   { en: 'Get More Info', fr: 'Plus d\'infos', es: 'Mas info' },
    combine_looks_button:   { en: 'Combine Looks', fr: 'Composer looks', es: 'Combinar looks' },
    combine_need_more_items:{ en: 'Save at least one more closet item before combining looks.', fr: 'Sauvegardez au moins une autre pièce avant de combiner des looks.', es: 'Guarda al menos una prenda más antes de combinar looks.' },
    outfit_need_items:     { en: 'Add at least two pieces to the outfit slots first.', fr: 'Ajoutez au moins deux pièces dans les emplacements du look.', es: 'Agrega al menos dos prendas en los slots del outfit.' },
    outfit_feedback_loading:{ en: 'Reviewing your outfit', fr: 'Analyse de votre look', es: 'Revisando tu outfit' },
    outfit_slot_assigned:  { en: '{item} added to {slot}', fr: '{item} ajouté à {slot}', es: '{item} agregado a {slot}' },
    outfit_wrong_slot:     { en: '{item} belongs in {correctSlot}, not {slot}.', fr: '{item} va dans {correctSlot}, pas dans {slot}.', es: '{item} va en {correctSlot}, no en {slot}.' },
    outfit_category_unknown:{ en: 'I could not place {item}. Scan/category is unclear.', fr: 'Impossible de placer {item}. Le scan ou la catégorie n’est pas clair.', es: 'No pude ubicar {item}. El scan o la categoría no está claro.' },
    outfit_composed:       { en: 'Composed {count} outfit slots', fr: '{count} emplacements de look composés', es: 'Outfit armado con {count} slots' },
    composing_outfit_ai:   { en: 'Styling your outfit...', fr: 'Composition de ta tenue...', es: 'Creando tu look...' },
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
    item_name_label:        { en: 'Item Name', fr: 'Nom de la piece', es: 'Nombre de prenda' },
    category_label:         { en: 'Category', fr: 'Categorie', es: 'Categoria' },
    closet_card_code_label: { en: 'Closet Card', fr: 'Carte dressing', es: 'Card de armario' },
    occasion_label:         { en: 'Occasion', fr: 'Occasion', es: 'Ocasión' },
    year_label:             { en: 'Year', fr: 'Annee', es: 'Año' },
    date_label:             { en: 'date', fr: 'date', es: 'fecha' },
    city_label:             { en: 'city', fr: 'ville', es: 'ciudad' },
    closet_value_label:     { en: 'Closet Value', fr: 'Valeur dressing', es: 'Valor de armario' },
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
    reset_profile_button:   { en: 'Reset Profile ⚠️', fr: 'Réinitialiser profil ⚠️', es: 'Reiniciar perfil ⚠️' },
    delete_card_button:     { en: 'Delete\nCard', fr: 'Supprimer\nCarte', es: 'Eliminar\nCard' },
    reset_cancelled:        { en: 'Reset cancelled', fr: 'Réinitialisation annulée', es: 'Reinicio cancelado' },
    profile_reset:          { en: 'Closet reset — {count} cards deleted', fr: 'Dressing réinitialisé — {count} cartes supprimées', es: 'Armario reiniciado — {count} cards eliminadas' },
    no_card_delete:         { en: 'No card to delete', fr: 'Pas de carte à supprimer', es: 'No hay carta para eliminar' },
    delete_item_button:     { en: 'Delete Item', fr: 'Supprimer', es: 'Eliminar' },
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
    outfit_card_progress:   { en: 'Cutting out {name} ({index}/{total})...', fr: 'Découpe de {name} ({index}/{total})...', es: 'Recortando {name} ({index}/{total})...' },
    outfit_ready:           { en: 'Outfit ready — {count} cards!', fr: 'Tenue prête — {count} cartes !', es: '¡Look listo — {count} cartas!' },
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
    lvl_prefix:             { en: 'Style Lv. ', fr: 'Style niv. ', es: 'Estilo niv. ' },
    xp_max:                 { en: 'Style points {xp} / MAX', fr: 'Points style {xp} / MAX', es: 'Puntos de estilo {xp} / MAX' },
    xp_progress:            { en: 'Style points {xp}/{next}', fr: 'Points style {xp}/{next}', es: 'Puntos de estilo {xp}/{next}' },
    streak_long:            { en: 'Closet Lover', fr: 'Fan du dressing', es: 'Closet lover' },
    streak_short:           { en: 'Closet Lover', fr: 'Fan du dressing', es: 'Closet lover' },
    no_streak:              { en: 'Closet Lover', fr: 'Fan du dressing', es: 'Closet lover' },
    prestige_label:         { en: 'Signature cycle', fr: 'Cycle signature', es: 'Ciclo signature' },
    xp_popup:               { en: '+{amount} style points', fr: '+{amount} points style', es: '+{amount} puntos de estilo' },
    trust_popup:            { en: '+{amount}% Fashion Trust', fr: '+{amount}% Confiance mode', es: '+{amount}% Confianza fashion' },
    trust_penalty:          { en: '-{amount}% Fashion Trust', fr: '-{amount}% Confiance mode', es: '-{amount}% Confianza fashion' },
    fashion_trust_score:    { en: 'Fashion Trust: {score}%', fr: 'Confiance mode : {score}%', es: 'Confianza fashion: {score}%' },
    rank_style_icon:        { en: 'Style Icon', fr: 'Icône style', es: 'Icono de estilo' },
    rank_trusted_stylist:   { en: 'Trusted Stylist', fr: 'Styliste fiable', es: 'Stylist confiable' },
    rank_closet_lover:      { en: 'Closet Lover', fr: 'Fan du dressing', es: 'Closet lover' },
    rank_style_explorer:    { en: 'Style Explorer', fr: 'Explorateur style', es: 'Explorador de estilo' },
    rank_needs_review:      { en: 'Needs Style Review', fr: 'Besoin de revue style', es: 'Necesita revisión de estilo' },
    rank_scan_rookie:       { en: 'Scan Rookie', fr: 'Debutant scan', es: 'Nuevo escaneando' },
    rank_closet_newcomer:   { en: 'Closet Newcomer', fr: 'Nouveau dressing', es: 'Nuevo en closet' },
    rank_unverified:        { en: 'Unverified Stylist', fr: 'Styliste non verifie', es: 'Stylist sin verificar' },
    level_up:               { en: 'STYLE LEVEL UP! {level}: {name}', fr: 'NIVEAU STYLE ! {level} : {name}', es: '¡NUEVO NIVEL DE ESTILO! {level}: {name}' },
    level_up_reveal_title:  { en: 'STYLE LEVEL UP!', fr: 'NIVEAU STYLE !', es: '¡NUEVO NIVEL DE ESTILO!' },
    level_up_reveal_body:   { en: 'You moved from style level {from} to {to}: {name}.', fr: 'Vous passez du niveau style {from} à {to} : {name}.', es: 'Pasas del nivel de estilo {from} al {to}: {name}.' },
    prestige_up:            { en: 'Signature cycle {n}! Back to Style Starter', fr: 'Cycle signature {n} ! Retour à Style Starter', es: '¡Ciclo signature {n}! Vuelves a Style Starter' },
    streak_bonus_long:      { en: 'Welcome back, {name}', fr: 'Bon retour, {name}', es: 'Bienvenido de nuevo, {name}' },
    streak_bonus_short:     { en: 'Welcome back, {name}', fr: 'Bon retour, {name}', es: 'Bienvenido de nuevo, {name}' },
    welcome_user:           { en: 'Welcome, {name}', fr: 'Bienvenue, {name}', es: 'Bienvenido, {name}' },
    welcome_back_user:      { en: 'Welcome back, {name}', fr: 'Bon retour, {name}', es: 'Bienvenido de nuevo, {name}' },
    daily_bonus:            { en: 'Closet Lover', fr: 'Fan du dressing', es: 'Closet lover' },
    daily_bonus_none:       { en: 'Closet Lover', fr: 'Fan du dressing', es: 'Closet lover' },
    style_level_line:       { en: 'Style level {level}: {name}', fr: 'Niveau style {level} : {name}', es: 'Nivel de estilo {level}: {name}' },
    style_level_short:      { en: 'Style {level}', fr: 'Style {level}', es: 'Estilo {level}' },
    style_level_static:     { en: 'Style Level: Icon', fr: 'Niveau style : Icône', es: 'Nivel de estilo: Icono' },
    xp_placeholder:         { en: 'Closet Lover', fr: 'Fan du dressing', es: 'Closet lover' },
    style_score_static:     { en: 'Style Icon | Fashion Trust: 100%', fr: 'Icône style | Confiance mode : 100%', es: 'Icono de estilo | Confianza fashion: 100%' },
    level_placeholder:      { en: 'Style level ready', fr: 'Niveau style prêt', es: 'Nivel de estilo listo' },
    user_profile_title:     { en: 'User Profile', fr: 'Profil utilisateur', es: 'Perfil de usuario' },
    prestige_button:        { en: 'Prestige ✨', fr: 'Prestige ✨', es: 'Prestigio ✨' },
    look_analysis_label:    { en: 'LOOK ANALYSIS', fr: 'LOOK ANALYSIS', es: 'LOOK ANALYSIS' },
    match_label:            { en: 'MATCH', fr: 'MATCH', es: 'MATCH' },
    lorem_placeholder:      { en: 'Your AI style note will appear here.', fr: 'Votre note style IA apparaîtra ici.', es: 'Tu nota de estilo de IA aparecera aqui.' },
    card_review_placeholder:{ en: '{item}\nTap Get More Info for an AI style note.', fr: '{item}\nTouchez Plus d\'infos pour une note style IA.', es: '{item}\nToca Mas info para una nota de estilo IA.' },
    card_label_collection:  { en: 'Collection', fr: 'Collection', es: 'Coleccion' },
    card_label_versatility: { en: 'Versatility', fr: 'Polyvalence', es: 'Versatilidad' },
    card_label_quality:     { en: 'Quality', fr: 'Qualite', es: 'Calidad' },
    card_label_pairing:     { en: 'Pairing', fr: 'Association', es: 'Combinacion' },
    collection_title:       { en: 'Your Closet Collection', fr: 'Votre collection dressing', es: 'Tu coleccion de armario' },
    scanned_by_preview:     { en: 'Styled by: Username\nFashion Trust: 100%', fr: 'Stylé par : Username\nConfiance mode : 100%', es: 'Estilizado por: Username\nConfianza fashion: 100%' },

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
        'Pointez une piece et appuyez sur Scanner.',
        'Votre dressing attend sa prochaine carte.',
        'Scannez un look. Gardez les bonnes idees.',
        'Un bon outfit merite une archive.',
        'Regardez une piece et laissez Closet Club la lire.',
        'Scannez hauts, bas, chaussures ou un look complet.',
        'Votre dressing devient searchable.',
        'Un scan de plus vers un dressing intelligent.',
        'Ce look a quelque chose a dire.',
        'Trouvez la piece. Sauvegardez le look.',
        'Scannez maintenant, stylisez plus tard.',
        'Un peu d intelligence de dressing ne fait pas de mal.',
        'Laissez le Lens lire le fit.',
        'Construisez votre dressing une polaroid a la fois.',
        'Pas de saisie. Scannez juste la piece.',
        'Le prochain outfit commence ici.',
        'Cataloguez la piece pendant qu elle est devant vous.',
        'Votre dressing va s organiser.',
        'Scannez la piece. Sauvegardez son histoire.',
        'Pret quand le look l est.',
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
        "Your Fashion Trust dropped.\nScan clothing in person.",
        "This is a wardrobe scanner,\nnot a screenshot collector.",
        "Point at a top, bottom,\nshoe, or full outfit.",
        "The archive gets smarter\nwhen the scan is real.",
        "Try again with the item\nin front of the camera.",
        "Closet Club can read style,\nbut not shortcuts.",
        "Real clothes only.\nYour closet deserves better.",
        "Fashion Trust drops again.\nScan real wardrobe pieces.",
    ],
    fr: [
        "Cela ressemble a un ecran.\nPointez Closet Club vers de vrais vetements.",
        "Bien essaye, mais ce dressing\na besoin de vraies pieces.",
        "Les captures ne vont pas\ndans l archive du dressing.",
        "Scannez la piece devant vous,\npas une photo.",
        "Closet Club veut tissu,\nforme et couleur en vrai espace.",
        "Ce n est pas un scan live.\nTrouvez la vraie piece.",
        "Une carte dressing commence\navec un vrai vetement.",
        "Votre confiance mode baisse.\nScannez les vetements en personne.",
        "C est un scanner de dressing,\npas de captures d ecran.",
        "Pointez un haut, un bas,\ndes chaussures ou un look complet.",
        "L archive devient plus intelligente\nquand le scan est reel.",
        "Reessayez avec la piece\ndevant la camera.",
        "Closet Club sait lire le style,\npas les raccourcis.",
        "Vrais vetements seulement.\nVotre dressing merite mieux.",
        "La confiance mode baisse encore.\nScannez de vraies pieces.",
    ],
    es: [
        "Eso parece una pantalla.\nApunta Closet Club a ropa real.",
        "Buen intento, pero este armario\nnecesita prendas reales.",
        "Las capturas no pertenecen\nal archivo de tu armario.",
        "Escanea la prenda frente a ti,\nno una foto de ella.",
        "Closet Club necesita tela,\nforma y color en espacio real.",
        "Eso no es un scan en vivo.\nBusca la prenda real.",
        "Una card de armario debería\nnacer de una prenda real.",
        "Tu confianza fashion bajó.\nEscanea ropa en persona.",
        "Esto es un scanner de armario,\nno de screenshots.",
        "Apunta a un top, bottom,\nzapato o look completo.",
        "El archivo mejora cuando\nel scan es real.",
        "Intenta otra vez con la prenda\nfrente a la cámara.",
        "Closet Club puede leer estilo,\npero no atajos.",
        "Solo ropa real.\nTu armario merece algo mejor.",
        "La confianza fashion baja otra vez.\nEscanea prendas reales.",
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

const STATIC_TEXT_TO_KEY: { [normalizedText: string]: string } = {
    'Welcome to Closet Club': 'language_welcome_heading',
    'Choose your language': 'language_welcome_heading',
    'Sélectionnez la langue - Select language - Selecciona idioma': 'language_select_hint',
    'Seleccionez la langue - Select language - Selecciona idioma': 'language_select_hint',
    'Select language': 'language_select_hint',
    'Accept': 'accept_button',
    'Yes': 'yes',
    'Cancel': 'cancel_btn',
    'Scan Clothes': 'solo',
    'Start Scanning your clothes': 'welcome_title',
    'Scan garments and outfits with Spectacles. Closet Club reads each item, builds a smart closet, and turns every save into a polaroid-style wardrobe card.': 'welcome_description',
    'Scan garments and outfits with Spectacles. Closet Club reads each item, builds a smart closet, and turns every save into a polaroid-style wardrobe card. Look at your outfit in front of a mirror, or just scan your clothes individually. Just Scan It!': 'welcome_description',
    'Look at a garment or outfit, or just scan you in front of a mirror': 'welcome_title',
    'LOOK ANALYSIS': 'look_analysis_label',
    'MATCH': 'match_label',
    'Loading': 'loading_text',
    'Scan Look': 'scan_vehicle',
    'Open Scanner': 'open_scanner',
    'Scan looks, build your closet.': 'scan_looks_build',
    'Save the look': 'save_the_look',
    'Mute Narrator': 'mute_narrator',
    'Music Player': 'music_player',
    'Combine Look': 'get_more_info_button',
    'Get More Info': 'get_more_info_button',
    'Delete Item': 'delete_item_button',
    'Delete Card': 'delete_card_button',
    'Combine Looks': 'combine_looks_button',
    'Reset Profile ⚠️': 'reset_profile_button',
    'Reset your closet? All saved wardrobe cards will be lost!': 'reset_closet_question',
    'Are you sure you want to delete this card?': 'delete_card_question',
    '⚠️CAUTION: This action cannot be undone.⚠️': 'action_undone',
    '⚠️This action cannot be undone.⚠️': 'action_undone',
    'XP XXXX/XXXX': 'xp_placeholder',
    'Daily style bonus': 'xp_placeholder',
    'Closet Lover': 'xp_placeholder',
    'Grand Tourer | Trust: 100%': 'style_score_static',
    'LVL 10: Legend': 'style_level_static',
    'Style Level: Icon': 'style_level_static',
    'Style Icon | Style Score: 100%': 'style_score_static',
    'Style Icon | Fashion Trust: 100%': 'style_score_static',
    'Level body text': 'level_placeholder',
    'Style level ready': 'level_placeholder',
    'User Profile': 'user_profile_title',
    'Prestige ✨': 'prestige_button',
    'Texto simulado, texto simulado,': 'lorem_placeholder',
    'Your AI style note will appear here.': 'lorem_placeholder',
    'Car Brand and model': 'item_name_label',
    'Car Type': 'category_label',
    'DGNS-C28E-5D1A-26AC': 'closet_card_code_label',
    'CLOSET-CARD-0000': 'closet_card_code_label',
    'Item Name': 'item_name_label',
    'Category': 'category_label',
    'Closet Card': 'closet_card_code_label',
    'Occ': 'occasion_label',
    'Year': 'year_label',
    'date': 'date_label',
    'date ': 'date_label',
    'city': 'city_label',
    'Closet Value': 'closet_value_label',
    'Collection': 'card_label_collection',
    'Versatility': 'card_label_versatility',
    'Quality': 'card_label_quality',
    'Pairing': 'card_label_pairing',
    'Open Collection': 'open_collection',
    'Your Closet Collection': 'collection_title',
    'Cluelees WareRope': 'closet_club_title',
    'Closet Club': 'closet_club_title',
    'Scanned by: Username Fashion Trust: 100%': 'scanned_by_preview',
    'Styled by: Username Style Score: 100%': 'scanned_by_preview',
    'Styled by: Username Fashion Trust: 100%': 'scanned_by_preview',
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.': 'lorem_placeholder',
};

const STATIC_OBJECT_NAME_TO_KEY: { [normalizedName: string]: string } = {
    'Level Up Title': 'level_up_reveal_title',
    'Tittle Start Scanning your clothes': 'welcome_title',
    'Tittle Start Scanning your clothes 1': 'welcome_title',
    'Confirm Delete Card Container': 'delete_card_question',
    'Confirm Reset Profile Container': 'reset_closet_question',
    'Reset Profile': 'reset_profile_button',
    'Delete Card Button': 'delete_card_button',
    'Scanner Button': 'open_scanner',
    'Scan vehicle button text': 'scan_vehicle',
    'Level Number': 'welcome_back_user',
    'XP counter': 'xp_placeholder',
    'Bonus info': 'style_level_line',
    'User Profile Info': 'user_profile_title',
};

function normalizeStaticText(text: string): string {
    return (text || '')
        .replace(/\r\n/g, '\n')
        .replace(/\u2028/g, '\n')
        .replace(/\u2029/g, '\n')
        .replace(/\s+/g, ' ')
        .trim();
}

export function translateStaticText(text: string): string {
    const normalized = normalizeStaticText(text);
    if (normalized.length === 0) return text;

    const directKey = STATIC_TEXT_TO_KEY[normalized];
    if (directKey) return t(directKey);

    const keys = Object.keys(STATIC_TEXT_TO_KEY);
    for (let i = 0; i < keys.length; i++) {
        const key = STATIC_TEXT_TO_KEY[keys[i]];
        const entry = S[key];
        if (!entry) continue;
        if (normalizeStaticText(entry.en) === normalized ||
            normalizeStaticText(entry.fr) === normalized ||
            normalizeStaticText(entry.es) === normalized) {
            return t(key);
        }
    }

    return text;
}

export function translateStaticTextForObject(objectName: string, text: string): string {
    const objectKey = STATIC_OBJECT_NAME_TO_KEY[normalizeStaticText(objectName)];
    if (objectKey && objectKey !== 'welcome_back_user' && objectKey !== 'style_level_line') return t(objectKey);
    return translateStaticText(text);
}

export function getIdlePhrases(): string[] {
    return IDLE_PHRASES_TABLE[currentLang] || IDLE_PHRASES_TABLE['en'];
}

export function getCheatMessages(): string[] {
    return CHEAT_MESSAGES_TABLE[currentLang] || CHEAT_MESSAGES_TABLE['en'];
}
