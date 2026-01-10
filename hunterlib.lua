-- ============================================================
-- HUNTER LEVEL SYSTEM LIB (hg_lib) - STABLE VERSION 2025
-- ============================================================

hg_lib = {}

-- ============================================================
-- SISTEMA TRADUZIONI MULTILINGUA SERVER-SIDE
-- ============================================================
hg_lib.translations = {
    -- ITALIANO (default)
    ["it"] = {
        -- SYSTEM
        SYSTEM = "SISTEMA",
        ERROR = "ERRORE",
        WARNING = "ATTENZIONE",
        GLORY = "Gloria",
        GLORY_EXTRA = "Gloria Extra",
        TOTAL = "TOTALE",
        COMPLETE = "complete",
        EVENT = "EVENTO",
        
        -- GLORY DETAILS
        GLORY_BASE = "Gloria Base",
        BASE_GLORY = "Gloria Base",
        GLORY_DETAIL = "DETTAGLIO GLORIA",
        
        -- EVENTS
        EVENT_LOTTERY_END = "Sorteggio a fine evento: +{PTS} Gloria!",
        EVENT_IN_PROGRESS = "[EVENTO IN CORSO]",
        
        -- MISSIONS
        MISSION_COMPLETED = "MISSIONE COMPLETATA",
        
        -- ITEMS
        ITEM_NO_FRACTURES = "Nessuna frattura disponibile nei registri.",
        ITEM_FRACTURE_SUMMONED = "Frattura {RANK} evocata!",
        ITEM_FOCUS_SYSCHAT = "Effetto Focus attivo: la tua percezione delle ricompense e' aumentata.",
        ITEM_DIMKEY_SYSCHAT = "Il prossimo baule garantira' un bonus Gloria extra!",
        ITEM_SEAL_SYSCHAT = "L'energia del Sigillo ti permettera' di saltare la fase di difesa.",
        ITEM_SIGNAL_SYSCHAT = "Una Missione d'Emergenza verra' attivata contro il prossimo bersaglio Elite.",
        ITEM_RESONATOR_NOPARTY = "Devi essere in un party per usare questo oggetto!",
        ITEM_RESONATOR_SYSCHAT = "Risonatore attivato! Il party riceve +20% Gloria sulla prossima kill elite!",
        ITEM_CALIBRATOR_SYSCHAT = "Il Calibratore e' attivo: la prossima frattura casuale sara' di Rango C o superiore.",
        ITEM_STABILIZER_DESC1 = "L'artefatto risuona, pronto a piegare la realta'.",
        ITEM_STABILIZER_DESC2 = "Focalizzati sull'energia che desideri richiamare.",
        
        -- FRACTURES
        CALIBRATOR = "CALIBRATORE",
        CALIBRATOR_ACTIVE_MSG = "Filtro attivo: Rango C+ garantito!",
        CONFLICT = "CONFLITTO",
        CONFLICT_EMERGENCY = "Completa prima l'Emergency Quest in corso!",
        CONFLICT_DEFENSE = "Stai gia' difendendo un'altra frattura!",
        ERROR_IDENTIFY_FRACTURE = "Impossibile identificare la frattura!",
        SEAL_OF_CONQUEST = "SIGILLO DI CONQUISTA",
        SEAL_INSTANT_OPEN = "La frattura si apre istantaneamente!",
        
        -- CHESTS
        CHEST_OPENED = "Hai aperto {NAME} - +{PTS} Gloria",
        
        -- RESONANCE
        RESONANCE = "RISONANZA",
        RESONANCE_BONUS = "+20% Gloria di Gruppo! (+{BONUS})",
        
        -- ACHIEVEMENTS
        ACHIEVEMENT = "TRAGUARDO",
        REWARD = "RICOMPENSA",
        COMPLETED = "completato",
        ACH_NOT_FOUND = "Achievement non trovato.",
        ACH_ALREADY_CLAIMED = "Gia' riscosso!",
        ACH_NOT_HUNTER = "Non sei un Hunter!",
        ACH_NOT_UNLOCKED = "Non ancora sbloccato! {PROG}/{REQ}",
        ACH_RECEIVED = "Ricevuto x{COUNT} oggetto!",
        SMART_INV_FULL = "Inventario pieno! Riscossi {COUNT} traguardi.",
        SMART_CLAIMED = "Riscossi {COUNT} traguardi!",
        SMART_NONE = "Nessun traguardo da riscuotere.",
        
        -- SHOP
        SHOP = "NEGOZIO",
        SHOP_INSUFFICIENT = "Gloria insufficiente! Hai {HAVE}, serve {NEED}",
        SHOP_PURCHASED = "Acquistato: {ITEM} x{COUNT}",
        SPENDABLE_GLORY = "Gloria Spendibile",
        SHOP_INV_FULL = "Inventario pieno!",
        
        -- MISSIONS
        ALL_MISSIONS_COMPLETE = "TUTTE LE MISSIONI COMPLETE!",
        BONUS_50_COMPLETION = "BONUS 50% COMPLETAMENTO",
        ACTIVATED = "ATTIVATO",
        FRACTURE_BONUS = "Bonus Fratture +50%",
        
        -- ELITE
        ELITE = "ELITE",
        BONUS = "BONUS",
        
        -- LANGUAGE
        LANG_CHANGED = "Lingua cambiata!",
        
        -- SECURITY/ADMIN
        SECURITY_ERROR = "Errore di sicurezza.",
        HUNTER_ERROR = "Errore Hunter. Contatta un GM.",
        ITEM_NOT_FOUND = "Oggetto non trovato.",
        PLEASE_WAIT = "Attendere prego...",
        PRICE_ERROR = "Errore: Prezzo oggetto non valido.",
        
        -- SHOP DIALOGS
        shop_title = "MERCANTE HUNTER",
        shop_ask = "Vuoi acquistare questo oggetto?",
        shop_opt_confirm = "Conferma Acquisto",
        shop_opt_cancel = "Annulla",
        shop_quantity = "Quantita'",
        shop_cost = "Costo",
        shop_error_funds = "ERRORE: GLORIA INSUFFICIENTE.",
        
        -- REWARD DIALOGS
        reward_type_daily = "Giornaliera",
        reward_type_weekly = "Settimanale",
        reward_claimed = "{PLAYER} ha riscosso il premio Top Classifica {TYPE}!",
        reward_title = "RICOMPENSE HUNTER",
        reward_none = "Nessun premio in attesa al momento.",
        reward_climb = "Scala la classifica per ottenere gloria!",
        rewards_available = "PREMI DISPONIBILI",
        claim_daily = "Riscuoti Premio Giornaliero",
        claim_weekly = "Riscuoti Premio Settimanale",
        claim_all = "Riscuoti TUTTO",
        
        -- ACHIEVEMENT DIALOGS
        ach_requirement = "Requisito",
        ach_kills = "Uccisioni",
        ach_reward = "Ricompensa",
        ach_already_claimed = "[!] RICOMPENSA GIA' RISCOSSA",
        ach_locked = "[!] BLOCCATO - Impegnati di piu'",
        ach_claim = "Riscuoti Premio",
        ach_close = "Chiudi",
        ach_item_received = "OGGETTO RICEVUTO",
        
        -- DEFENSE SYSTEM
        DEFENSE = "DIFESA",
        defense_start = "UCCIDI TUTTI I MOB! Hai {SECONDS} secondi!",
        defense_success_click = "FRATTURA CONQUISTATA! Hai 5 minuti per aprirla!",
        TOUCH_PORTAL = "TOCCA IL PORTALE!",
        WAVE = "ONDATA",
        WAVE_MSG = "ONDATA {WAVE}: Uccidi {COUNT} mob!",
        DEFENSE_FAILED = "DIFESA FALLITA!",
        DEFENSE_SUCCESS = "DIFESA COMPLETATA!",
        PENALTY_ABANDON = "Penalita' abbandono: -{PTS} Gloria",
        TIME_EXPIRED = "Tempo scaduto!",
        OUT_OF_RANGE = "Sei troppo lontano dalla frattura!",
        
        -- EMERGENCY QUEST
        EMERG_QUEST = "EMERGENZA",
        EMERG_REWARD = "Gloria Ricompensa: +{PTS}",
        EMERG_BONUS_ITEM = "BONUS OGGETTO: {ITEM} x{COUNT}",
        EMERG_COMPLETED = "QUEST D'EMERGENZA COMPLETATA!",
        EMERG_FAILED = "Quest d'Emergenza Fallita!",
        
        -- BOSS/MOB
        BOSS_ALERT = "BOSS IN ARRIVO!",
        MOB_KILLED = "Mob ucciso!",
        KILL_COUNT = "Uccisioni: {CURRENT}/{TOTAL}",
        
        -- MISSIONS
        DAILY_MISSIONS = "MISSIONI GIORNALIERE",
        WEEKLY_MISSIONS = "MISSIONI SETTIMANALI",
        MISSION_PROGRESS = "Progresso: {CURRENT}/{TOTAL}",
        MISSION_REWARD = "Ricompensa: +{PTS} Gloria",
        
        -- RANKING
        POSITION = "Posizione",
        RANK_UP = "RANK UP!",
        NEW_RANK = "Nuovo Rango: {RANK}",
        OVERTAKE = "HAI SUPERATO {NAME}!",
        OVERTAKEN = "SEI STATO SUPERATO DA {NAME}!",
        
        -- EVENT
        EVENT_REGISTRATION = "ISCRIZIONE EVENTO",
        EVENT_BONUS_ACTIVE = "BONUS ATTIVO! Gloria aumentata durante evento!",
        EVENT_JOINED = "Iscritto all'evento: {NAME}",
        RANK_INSUFFICIENT = "Rank insufficiente! Richiesto: {RANK}-Rank",
        
        -- JACKPOT
        JACKPOT = "JACKPOT",
        JACKPOT_GLORY = "JACKPOT! +{PTS} Gloria Extra!",
        JACKPOT_ITEMS = "BONUS! {ITEMS}",
        
        -- EMERGENCY MISSION
        emerg_mission_label = "Missione",
        emerg_default_name = "Orda Improvvisa",
        
        -- FRACTURE MESSAGES (BRIDGE/GATE LOGIC)
        fracture_destroyed = "Questa frattura e' stata distrutta!",
        fracture_failed_defense = "Un altro Hunter ha fallito la difesa.",
        fracture_seek_other = "Cerca un'altra frattura. Buona caccia!",
        fracture_ownership_expired = "Il diritto di conquista precedente e' scaduto. La frattura e' libera!",
        fracture_conquered_other = "Frattura conquistata da un altro Hunter!",
        fracture_available_in = "Tornera' disponibile tra {SECONDS} secondi se non viene aperta.",
        fracture_reserved_other_party = "Frattura riservata da un altro party!",
        fracture_reserved_self = "Frattura RISERVATA al tuo party per 60 secondi!",
        fracture_reserved_msg = "Frattura riservata! Tutti devono toccarla entro 60 secondi!",
        fracture_timeout_lost = "Tempo scaduto! Il party ha perso la prenotazione.",
        fracture_timeout_freed = "Tempo scaduto! La frattura e' tornata libera.",
        fracture_party_ready = "{NAME} e' pronto! ({CURRENT}/{TOTAL}) - {REMAINING}s rimasti",
        fracture_all_ready = "Tutti pronti! La frattura si sta aprendo!",
        defense_timeout_failed = "TEMPO SCADUTO! Mob rimasti: {COUNT}",
        event_time_remaining = "Tempo rimanente: {MINUTES} minuti",
        
        -- WAVE/DEFENSE NOTIFICATIONS
        defense_wave_spawn = "ONDATA {WAVE}! DIFENDITI!",
        WAVE_NOTIFICATION = "ONDATA {WAVE}! +{MOBS} mob!",
        
        -- WINNERS/LEADERBOARD
        winners_sep_daily = "|cffFFD700======================================|r",
        winners_title_daily = "|cffFFD700[HUNTER SYSTEM]|r |cff00FFFF* VINCITORI CLASSIFICA GIORNALIERA *|r",
        winners_sep_kill = "|cffFF8800======================================|r",
        winners_title_kill = "|cffFF8800[HUNTER SYSTEM]|r |cffFF8800* VINCITORI CLASSIFICA KILL GIORNALIERA *|r",
        winners_sep_weekly = "|cffFF6600======================================|r",
        winners_title_weekly = "|cffFF6600[HUNTER SYSTEM]|r |cffFFD700** VINCITORI CLASSIFICA SETTIMANALE **|r",
        winners_glory = "Gloria",
        winners_kills = "Kill",
        winners_glory_syschat = "[HUNTER SYSTEM] Vincitori Gloria",
        winners_kill_syschat = "[HUNTER SYSTEM] Vincitori Kill",
        reset_daily = "|cffFFD700[HUNTER SYSTEM]|r Classifica Giornaliera Resettata! La corsa al potere ricomincia.",
        reset_weekly = "|cffFF6600[HUNTER SYSTEM]|r Classifica Settimanale Resettata! I premi sono stati distribuiti.",
        
        -- CLASSIC GATE
        classic_gate_intro = "Questo portale emana un'energia instabile.",
        classic_gate_worthy = "Il tuo Rango Hunter e' sufficiente.",
        classic_gate_ask = "Vuoi spezzare il sigillo ed entrare?",
        classic_gate_not_worthy = "Non possiedi abbastanza Gloria.",
        
        -- WELCOME MESSAGES BY RANK
        welcome_E_border = "====================================================",
        welcome_E_title = "              [E-RANK] RISVEGLIATO",
        welcome_E_line1 = "   Bentornato nel Sistema, Cacciatore.",
        welcome_E_line2 = "   La strada e lunga, ma ogni viaggio",
        welcome_E_line3 = "   inizia con un singolo passo.",
        welcome_E_stats = "   >> Status: ATTIVO | Minacce: IN ATTESA <<",
        welcome_E_quote = "   'Il debole di oggi... il forte di domani.'",
        
        welcome_D_border = "====================================================",
        welcome_D_title = "           [D-RANK] APPRENDISTA",
        welcome_D_line1 = "   Bentornato, Apprendista.",
        welcome_D_line2 = "   Il tuo potenziale sta emergendo.",
        welcome_D_line3 = "   Il Sistema osserva i tuoi progressi.",
        welcome_D_stats = "   >> Status: IN CRESCITA | Missioni: BASE <<",
        welcome_D_quote = "   'Chi non rischia, non vince.'",
        
        welcome_C_border = "====================================================",
        welcome_C_title = "           * [C-RANK] CACCIATORE *",
        welcome_C_line1 = "   Benvenuto, Cacciatore Esperto.",
        welcome_C_line2 = "   Le tue gesta risuonano nei registri.",
        welcome_C_line3 = "   Il Sistema ti riconosce come guerriero.",
        welcome_C_stats = "   >> Status: ESPERTO | Missioni: DISPONIBILI <<",
        welcome_C_quote = "   'La forza non e tutto. La volonta lo e.'",
        
        welcome_B_border = "====================================================",
        welcome_B_title = "          ** [B-RANK] VETERANO **",
        welcome_B_line1 = "   ATTENZIONE: Veterano B-Rank rilevato.",
        welcome_B_line2 = "   Pochi raggiungono questo livello.",
        welcome_B_line3 = "   Il Sistema onora il tuo cammino.",
        welcome_B_stats = "   >> Status: ELITE | Autorizzazione: ALTA <<",
        welcome_B_quote = "   'I deboli temono il buio. I forti lo dominano.'",
        
        welcome_A_border = "====================================================",
        welcome_A_title = "         *** [A-RANK] MAESTRO ***",
        welcome_A_line1 = "   !! ALLERTA !! Maestro A-Rank online !!",
        welcome_A_line2 = "   Il Sistema si inchina al tuo potere.",
        welcome_A_line3 = "   Sei tra i piu forti di questo mondo.",
        welcome_A_stats = "   >> Status: MAESTRO | Autorizzazione: MASSIMA <<",
        welcome_A_quote = "   'Quando un Maestro cammina, il mondo trema.'",
        
        welcome_S_border = "====================================================",
        welcome_S_title = "       **** [S-RANK] LEGGENDA ****",
        welcome_S_line1 = "   !!! ALLERTA CRITICA !!! Leggenda online !!!",
        welcome_S_line2 = "   Il Sistema stesso riconosce il tuo dominio.",
        welcome_S_line3 = "   I tuoi nemici tremano al solo sentire il tuo nome.",
        welcome_S_stats = "   >> Status: LEGGENDA | Potere: DEVASTANTE <<",
        welcome_S_quote = "   'Io non combatto. Io anniento.'",
        
        welcome_N_border = "====================================================",
        welcome_N_title = "     ***** [NATIONAL] MONARCA *****",
        welcome_N_line1 = "   !!! ALLARME MASSIMO !!! MONARCA ONLINE !!!",
        welcome_N_line2 = "   Il Sistema stesso si piega davanti a te.",
        welcome_N_line3 = "   Tu sei oltre ogni classificazione.",
        welcome_N_stats = "   >> Status: MONARCA | Potere: ASSOLUTO <<",
        welcome_N_quote = "   'Io sono il Sistema. Il Sistema sono io.'",
    },
    
    -- ENGLISH
    ["en"] = {
        SYSTEM = "SYSTEM",
        ERROR = "ERROR",
        WARNING = "WARNING",
        GLORY = "Glory",
        GLORY_EXTRA = "Extra Glory",
        TOTAL = "TOTAL",
        COMPLETE = "complete",
        EVENT = "EVENT",
        GLORY_BASE = "Base Glory",
        BASE_GLORY = "Base Glory",
        GLORY_DETAIL = "GLORY DETAIL",
        EVENT_LOTTERY_END = "End event lottery: +{PTS} Glory!",
        EVENT_IN_PROGRESS = "[EVENT IN PROGRESS]",
        MISSION_COMPLETED = "MISSION COMPLETED",
        ITEM_NO_FRACTURES = "No fractures available in records.",
        ITEM_FRACTURE_SUMMONED = "Fracture {RANK} summoned!",
        ITEM_FOCUS_SYSCHAT = "Focus effect active: your reward perception is increased.",
        ITEM_DIMKEY_SYSCHAT = "The next chest will grant an extra Glory bonus!",
        ITEM_SEAL_SYSCHAT = "The Seal energy will let you skip the defense phase.",
        ITEM_SIGNAL_SYSCHAT = "An Emergency Mission will activate against the next Elite target.",
        ITEM_RESONATOR_NOPARTY = "You must be in a party to use this item!",
        ITEM_RESONATOR_SYSCHAT = "Resonator activated! Party receives +20% Glory on next elite kill!",
        ITEM_CALIBRATOR_SYSCHAT = "Calibrator active: next random fracture will be Rank C or higher.",
        ITEM_STABILIZER_DESC1 = "The artifact resonates, ready to bend reality.",
        ITEM_STABILIZER_DESC2 = "Focus on the energy you wish to summon.",
        CALIBRATOR = "CALIBRATOR",
        CALIBRATOR_ACTIVE_MSG = "Filter active: Rank C+ guaranteed!",
        CONFLICT = "CONFLICT",
        CONFLICT_EMERGENCY = "Complete the ongoing Emergency Quest first!",
        CONFLICT_DEFENSE = "You are already defending another fracture!",
        ERROR_IDENTIFY_FRACTURE = "Unable to identify the fracture!",
        SEAL_OF_CONQUEST = "SEAL OF CONQUEST",
        SEAL_INSTANT_OPEN = "The fracture opens instantly!",
        CHEST_OPENED = "You opened {NAME} - +{PTS} Glory",
        RESONANCE = "RESONANCE",
        RESONANCE_BONUS = "+20% Group Glory! (+{BONUS})",
        -- ACHIEVEMENTS
        ACHIEVEMENT = "ACHIEVEMENT",
        REWARD = "REWARD",
        COMPLETED = "completed",
        ACH_NOT_FOUND = "Achievement not found.",
        ACH_ALREADY_CLAIMED = "Already claimed!",
        ACH_NOT_HUNTER = "You're not a Hunter!",
        ACH_NOT_UNLOCKED = "Not unlocked yet! {PROG}/{REQ}",
        ACH_RECEIVED = "Received x{COUNT} item!",
        SMART_INV_FULL = "Inventory full! Claimed {COUNT} achievements.",
        SMART_CLAIMED = "Claimed {COUNT} achievements!",
        SMART_NONE = "No achievements to claim.",
        -- SHOP
        SHOP = "SHOP",
        SHOP_INSUFFICIENT = "Insufficient Glory! You have {HAVE}, need {NEED}",
        SHOP_PURCHASED = "Purchased: {ITEM} x{COUNT}",
        SPENDABLE_GLORY = "Spendable Glory",
        SHOP_INV_FULL = "Inventory full!",
        -- MISSIONS
        ALL_MISSIONS_COMPLETE = "ALL MISSIONS COMPLETE!",
        BONUS_50_COMPLETION = "50% COMPLETION BONUS",
        ACTIVATED = "ACTIVATED",
        FRACTURE_BONUS = "Fracture Bonus +50%",
        -- ELITE
        ELITE = "ELITE",
        BONUS = "BONUS",
        -- LANGUAGE
        LANG_CHANGED = "Language changed!",
        -- SECURITY/ADMIN
        SECURITY_ERROR = "Security error.",
        HUNTER_ERROR = "Hunter error. Contact a GM.",
        ITEM_NOT_FOUND = "Item not found.",
        PLEASE_WAIT = "Please wait...",
        PRICE_ERROR = "Error: Invalid item price.",
        -- SHOP DIALOGS
        shop_title = "HUNTER MERCHANT",
        shop_ask = "Do you want to buy this item?",
        shop_opt_confirm = "Confirm Purchase",
        shop_opt_cancel = "Cancel",
        shop_quantity = "Quantity",
        shop_cost = "Cost",
        shop_error_funds = "ERROR: INSUFFICIENT GLORY.",
        -- REWARD DIALOGS
        reward_type_daily = "Daily",
        reward_type_weekly = "Weekly",
        reward_claimed = "{PLAYER} claimed the Top Ranking {TYPE} reward!",
        reward_title = "HUNTER REWARDS",
        reward_none = "No rewards pending at the moment.",
        reward_climb = "Climb the rankings to earn glory!",
        rewards_available = "AVAILABLE REWARDS",
        claim_daily = "Claim Daily Reward",
        claim_weekly = "Claim Weekly Reward",
        claim_all = "Claim ALL",
        -- ACHIEVEMENT DIALOGS
        ach_requirement = "Requirement",
        ach_kills = "Kills",
        ach_reward = "Reward",
        ach_already_claimed = "|cffFF0000[!] REWARD ALREADY CLAIMED|r",
        ach_locked = "|cff888888[!] LOCKED - Try harder!|r",
        ach_claim = "Claim Reward",
        ach_close = "Close",
        ach_item_received = "ITEM RECEIVED",
        -- DEFENSE SYSTEM
        DEFENSE = "DEFENSE",
        defense_start = "KILL ALL MOBS! You have {SECONDS} seconds!",
        defense_success_click = "FRACTURE CONQUERED! You have 5 minutes to open it!",
        TOUCH_PORTAL = "TOUCH THE PORTAL!",
        WAVE = "WAVE",
        WAVE_MSG = "WAVE {WAVE}: Kill {COUNT} mobs!",
        DEFENSE_FAILED = "DEFENSE FAILED!",
        DEFENSE_SUCCESS = "DEFENSE COMPLETED!",
        PENALTY_ABANDON = "Abandon penalty: -{PTS} Glory",
        TIME_EXPIRED = "Time expired!",
        OUT_OF_RANGE = "You are too far from the fracture!",
        -- EMERGENCY QUEST
        EMERG_QUEST = "EMERGENCY",
        EMERG_REWARD = "Glory Reward: +{PTS}",
        EMERG_BONUS_ITEM = "ITEM BONUS: {ITEM} x{COUNT}",
        EMERG_COMPLETED = "EMERGENCY QUEST COMPLETED!",
        EMERG_FAILED = "Emergency Quest Failed!",
        -- BOSS/MOB
        BOSS_ALERT = "BOSS INCOMING!",
        MOB_KILLED = "Mob killed!",
        KILL_COUNT = "Kills: {CURRENT}/{TOTAL}",
        -- MISSIONS
        DAILY_MISSIONS = "DAILY MISSIONS",
        WEEKLY_MISSIONS = "WEEKLY MISSIONS",
        MISSION_PROGRESS = "Progress: {CURRENT}/{TOTAL}",
        MISSION_REWARD = "Reward: +{PTS} Glory",
        -- RANKING
        POSITION = "Position",
        RANK_UP = "RANK UP!",
        NEW_RANK = "New Rank: {RANK}",
        OVERTAKE = "YOU PASSED {NAME}!",
        OVERTAKEN = "YOU WERE PASSED BY {NAME}!",
        -- EVENT
        EVENT_REGISTRATION = "EVENT REGISTRATION",
        EVENT_BONUS_ACTIVE = "BONUS ACTIVE! Increased Glory during event!",
        EVENT_JOINED = "Joined event: {NAME}",
        RANK_INSUFFICIENT = "Rank insufficient! Required: {RANK}-Rank",
        -- JACKPOT
        JACKPOT = "JACKPOT",
        JACKPOT_GLORY = "JACKPOT! +{PTS} Extra Glory!",
        JACKPOT_ITEMS = "BONUS! {ITEMS}",
        
        -- EMERGENCY MISSION
        emerg_mission_label = "Mission",
        emerg_default_name = "Sudden Horde",
        
        -- FRACTURE MESSAGES (BRIDGE/GATE LOGIC)
        fracture_destroyed = "This fracture has been destroyed!",
        fracture_failed_defense = "Another Hunter failed the defense.",
        fracture_seek_other = "Seek another fracture. Good hunting!",
        fracture_ownership_expired = "The previous ownership right has expired. The fracture is free!",
        fracture_conquered_other = "Fracture conquered by another Hunter!",
        fracture_available_in = "It will be available again in {SECONDS} seconds if not opened.",
        fracture_reserved_other_party = "Fracture reserved by another party!",
        fracture_reserved_self = "Fracture RESERVED for your party for 60 seconds!",
        fracture_reserved_msg = "Fracture reserved! Everyone must touch it within 60 seconds!",
        fracture_timeout_lost = "Time expired! The party lost the reservation.",
        fracture_timeout_freed = "Time expired! The fracture is free again.",
        fracture_party_ready = "{NAME} is ready! ({CURRENT}/{TOTAL}) - {REMAINING}s left",
        fracture_all_ready = "Everyone ready! The fracture is opening!",
        defense_timeout_failed = "TIME EXPIRED! Mobs remaining: {COUNT}",
        event_time_remaining = "Time remaining: {MINUTES} minutes",
        
        -- WAVE/DEFENSE NOTIFICATIONS
        defense_wave_spawn = "WAVE {WAVE}! DEFEND YOURSELF!",
        WAVE_NOTIFICATION = "WAVE {WAVE}! +{MOBS} mobs!",
        -- WINNERS/LEADERBOARD
        winners_sep_daily = "|cffFFD700======================================|r",
        winners_title_daily = "|cffFFD700[HUNTER SYSTEM]|r |cff00FFFF* DAILY GLORY LEADERBOARD WINNERS *|r",
        winners_sep_kill = "|cffFF8800======================================|r",
        winners_title_kill = "|cffFF8800[HUNTER SYSTEM]|r |cffFF8800* DAILY KILLS LEADERBOARD WINNERS *|r",
        winners_sep_weekly = "|cffFF6600======================================|r",
        winners_title_weekly = "|cffFF6600[HUNTER SYSTEM]|r |cffFFD700** WEEKLY LEADERBOARD WINNERS **|r",
        winners_glory = "Glory",
        winners_kills = "Kills",
        winners_glory_syschat = "[HUNTER SYSTEM] Glory Winners",
        winners_kill_syschat = "[HUNTER SYSTEM] Kills Winners",
        reset_daily = "|cffFFD700[HUNTER SYSTEM]|r Daily Leaderboard Reset! The race for power begins again.",
        reset_weekly = "|cffFF6600[HUNTER SYSTEM]|r Weekly Leaderboard Reset! Rewards have been distributed.",
        classic_gate_intro = "This portal emanates unstable energy.",
        classic_gate_worthy = "Your Hunter Rank is sufficient.",
        classic_gate_ask = "Do you want to break the seal and enter?",
        classic_gate_not_worthy = "You don't have enough Glory.",
        welcome_E_border = "====================================================",
        welcome_E_title = "              [E-RANK] AWAKENED",
        welcome_E_line1 = "   Welcome back to the System, Hunter.",
        welcome_E_line2 = "   The road is long, but every journey",
        welcome_E_line3 = "   begins with a single step.",
        welcome_E_stats = "   >> Status: ACTIVE | Threats: PENDING <<",
        welcome_E_quote = "   'Today's weak... tomorrow's strong.'",
        welcome_D_border = "====================================================",
        welcome_D_title = "           [D-RANK] APPRENTICE",
        welcome_D_line1 = "   Welcome back, Apprentice.",
        welcome_D_line2 = "   Your potential is emerging.",
        welcome_D_line3 = "   The System watches your progress.",
        welcome_D_stats = "   >> Status: GROWING | Missions: BASIC <<",
        welcome_D_quote = "   'Who doesn't risk, doesn't win.'",
        welcome_C_border = "====================================================",
        welcome_C_title = "           * [C-RANK] HUNTER *",
        welcome_C_line1 = "   Welcome, Expert Hunter.",
        welcome_C_line2 = "   Your deeds echo in the records.",
        welcome_C_line3 = "   The System recognizes you as warrior.",
        welcome_C_stats = "   >> Status: EXPERT | Missions: AVAILABLE <<",
        welcome_C_quote = "   'Strength is not everything. Will is.'",
        welcome_B_border = "====================================================",
        welcome_B_title = "          ** [B-RANK] VETERAN **",
        welcome_B_line1 = "   WARNING: B-Rank Veteran detected.",
        welcome_B_line2 = "   Few reach this level.",
        welcome_B_line3 = "   The System honors your path.",
        welcome_B_stats = "   >> Status: ELITE | Authorization: HIGH <<",
        welcome_B_quote = "   'The weak fear darkness. The strong dominate it.'",
        welcome_A_border = "====================================================",
        welcome_A_title = "         *** [A-RANK] MASTER ***",
        welcome_A_line1 = "   !! ALERT !! A-Rank Master online !!",
        welcome_A_line2 = "   The System bows to your power.",
        welcome_A_line3 = "   You are among the strongest in this world.",
        welcome_A_stats = "   >> Status: MASTER | Authorization: MAXIMUM <<",
        welcome_A_quote = "   'When a Master walks, the world trembles.'",
        welcome_S_border = "====================================================",
        welcome_S_title = "       **** [S-RANK] LEGEND ****",
        welcome_S_line1 = "   !!! CRITICAL ALERT !!! Legend online !!!",
        welcome_S_line2 = "   The System itself recognizes your dominion.",
        welcome_S_line3 = "   Your enemies tremble at your name.",
        welcome_S_stats = "   >> Status: LEGEND | Power: DEVASTATING <<",
        welcome_S_quote = "   'I don't fight. I annihilate.'",
        welcome_N_border = "====================================================",
        welcome_N_title = "     ***** [NATIONAL] MONARCH *****",
        welcome_N_line1 = "   !!! MAXIMUM ALARM !!! MONARCH ONLINE !!!",
        welcome_N_line2 = "   The System itself bends before you.",
        welcome_N_line3 = "   You are beyond any classification.",
        welcome_N_stats = "   >> Status: MONARCH | Power: ABSOLUTE <<",
        welcome_N_quote = "   'I am the System. The System is me.'",
    },
    
    -- FRANCAIS
    ["fr"] = {
        SYSTEM = "SYSTEME",
        ERROR = "ERREUR",
        WARNING = "ATTENTION",
        GLORY = "Gloire",
        GLORY_EXTRA = "Gloire Extra",
        TOTAL = "TOTAL",
        COMPLETE = "terminees",
        EVENT = "EVENEMENT",
        GLORY_BASE = "Gloire de Base",
        BASE_GLORY = "Gloire de Base",
        GLORY_DETAIL = "DETAIL GLOIRE",
        EVENT_LOTTERY_END = "Tirage fin d'evenement: +{PTS} Gloire!",
        EVENT_IN_PROGRESS = "[EVENEMENT EN COURS]",
        MISSION_COMPLETED = "MISSION TERMINEE",
        ITEM_NO_FRACTURES = "Aucune faille disponible dans les registres.",
        ITEM_FRACTURE_SUMMONED = "Faille {RANK} invoquee!",
        ITEM_FOCUS_SYSCHAT = "Effet Focus actif: ta perception des recompenses est augmentee.",
        ITEM_DIMKEY_SYSCHAT = "Le prochain coffre garantira un bonus Gloire extra!",
        ITEM_SEAL_SYSCHAT = "L'energie du Sceau te permettra de sauter la phase de defense.",
        ITEM_SIGNAL_SYSCHAT = "Une Mission d'Urgence sera activee contre la prochaine cible Elite.",
        ITEM_RESONATOR_NOPARTY = "Tu dois etre dans un groupe pour utiliser cet objet!",
        ITEM_RESONATOR_SYSCHAT = "Resonateur active! Le groupe recoit +20% Gloire sur le prochain kill elite!",
        ITEM_CALIBRATOR_SYSCHAT = "Calibrateur actif: la prochaine faille aleatoire sera de Rang C ou superieur.",
        ITEM_STABILIZER_DESC1 = "L'artefact resonne, pret a plier la realite.",
        ITEM_STABILIZER_DESC2 = "Concentre-toi sur l'energie que tu souhaites invoquer.",
        CALIBRATOR = "CALIBRATEUR",
        CALIBRATOR_ACTIVE_MSG = "Filtre actif: Rang C+ garanti!",
        CONFLICT = "CONFLIT",
        CONFLICT_EMERGENCY = "Complete d'abord la Quete d'Urgence en cours!",
        CONFLICT_DEFENSE = "Tu defends deja une autre faille!",
        ERROR_IDENTIFY_FRACTURE = "Impossible d'identifier la faille!",
        SEAL_OF_CONQUEST = "SCEAU DE CONQUETE",
        SEAL_INSTANT_OPEN = "La faille s'ouvre instantanement!",
        CHEST_OPENED = "Tu as ouvert {NAME} - +{PTS} Gloire",
        RESONANCE = "RESONANCE",
        RESONANCE_BONUS = "+20% Gloire de Groupe! (+{BONUS})",
        -- ACHIEVEMENTS
        ACHIEVEMENT = "SUCCES",
        REWARD = "RECOMPENSE",
        COMPLETED = "complete",
        ACH_NOT_FOUND = "Succes non trouve.",
        ACH_ALREADY_CLAIMED = "Deja reclame!",
        ACH_NOT_HUNTER = "Tu n'es pas un Chasseur!",
        ACH_NOT_UNLOCKED = "Pas encore debloque! {PROG}/{REQ}",
        ACH_RECEIVED = "Recu x{COUNT} objet!",
        SMART_INV_FULL = "Inventaire plein! {COUNT} succes reclames.",
        SMART_CLAIMED = "{COUNT} succes reclames!",
        SMART_NONE = "Aucun succes a reclamer.",
        -- SHOP
        SHOP = "BOUTIQUE",
        SHOP_INSUFFICIENT = "Gloire insuffisante! Tu as {HAVE}, besoin {NEED}",
        SHOP_PURCHASED = "Achete: {ITEM} x{COUNT}",
        SPENDABLE_GLORY = "Gloire Depensable",
        SHOP_INV_FULL = "Inventaire plein!",
        -- MISSIONS
        ALL_MISSIONS_COMPLETE = "TOUTES LES MISSIONS COMPLETEES!",
        BONUS_50_COMPLETION = "BONUS 50% COMPLETION",
        ACTIVATED = "ACTIVE",
        FRACTURE_BONUS = "Bonus Faille +50%",
        -- ELITE
        ELITE = "ELITE",
        BONUS = "BONUS",
        -- LANGUAGE
        LANG_CHANGED = "Langue changee!",
        -- SECURITY/ADMIN
        SECURITY_ERROR = "Erreur de securite.",
        HUNTER_ERROR = "Erreur Hunter. Contacte un GM.",
        ITEM_NOT_FOUND = "Objet non trouve.",
        PLEASE_WAIT = "Veuillez patienter...",
        PRICE_ERROR = "Erreur: Prix d'objet invalide.",
        -- SHOP DIALOGS
        shop_title = "MARCHAND CHASSEUR",
        shop_ask = "Veux-tu acheter cet objet?",
        shop_opt_confirm = "Confirmer Achat",
        shop_opt_cancel = "Annuler",
        shop_quantity = "Quantite",
        shop_cost = "Cout",
        shop_error_funds = "ERREUR: GLOIRE INSUFFISANTE.",
        -- REWARD DIALOGS
        reward_type_daily = "Quotidienne",
        reward_type_weekly = "Hebdomadaire",
        reward_claimed = "{PLAYER} a reclame la recompense Top Classement {TYPE}!",
        reward_title = "RECOMPENSES CHASSEUR",
        reward_none = "Aucune recompense en attente.",
        reward_climb = "Monte dans le classement pour la gloire!",
        rewards_available = "RECOMPENSES DISPONIBLES",
        claim_daily = "Reclamer Prix Quotidien",
        claim_weekly = "Reclamer Prix Hebdomadaire",
        claim_all = "Reclamer TOUT",
        -- ACHIEVEMENT DIALOGS
        ach_requirement = "Condition",
        ach_kills = "Kills",
        ach_reward = "Recompense",
        ach_already_claimed = "|cffFF0000[!] RECOMPENSE DEJA RECLAMEE|r",
        ach_locked = "|cff888888[!] BLOQUE - Fais plus d'efforts!|r",
        ach_claim = "Reclamer Recompense",
        ach_close = "Fermer",
        ach_item_received = "OBJET RECU",
        -- DEFENSE SYSTEM
        DEFENSE = "DEFENSE",
        defense_start = "TUE TOUS LES MOBS! Tu as {SECONDS} secondes!",
        defense_success_click = "FAILLE CONQUISE! Tu as 5 minutes pour l'ouvrir!",
        TOUCH_PORTAL = "TOUCHE LE PORTAIL!",
        WAVE = "VAGUE",
        WAVE_MSG = "VAGUE {WAVE}: Tue {COUNT} mobs!",
        DEFENSE_FAILED = "DEFENSE ECHOUEE!",
        DEFENSE_SUCCESS = "DEFENSE TERMINEE!",
        PENALTY_ABANDON = "Penalite abandon: -{PTS} Gloire",
        TIME_EXPIRED = "Temps ecoule!",
        OUT_OF_RANGE = "Tu es trop loin de la faille!",
        -- EMERGENCY QUEST
        EMERG_QUEST = "URGENCE",
        EMERG_REWARD = "Recompense Gloire: +{PTS}",
        EMERG_BONUS_ITEM = "BONUS OBJET: {ITEM} x{COUNT}",
        EMERG_COMPLETED = "QUETE D'URGENCE TERMINEE!",
        EMERG_FAILED = "Quete d'Urgence Echouee!",
        -- BOSS/MOB
        BOSS_ALERT = "BOSS EN APPROCHE!",
        MOB_KILLED = "Mob tue!",
        KILL_COUNT = "Tues: {CURRENT}/{TOTAL}",
        -- MISSIONS
        DAILY_MISSIONS = "MISSIONS QUOTIDIENNES",
        WEEKLY_MISSIONS = "MISSIONS HEBDOMADAIRES",
        MISSION_PROGRESS = "Progression: {CURRENT}/{TOTAL}",
        MISSION_REWARD = "Recompense: +{PTS} Gloire",
        -- RANKING
        POSITION = "Position",
        RANK_UP = "RANG MONTE!",
        NEW_RANK = "Nouveau Rang: {RANK}",
        OVERTAKE = "TU AS DEPASSE {NAME}!",
        OVERTAKEN = "TU AS ETE DEPASSE PAR {NAME}!",
        -- EVENT
        EVENT_REGISTRATION = "INSCRIPTION EVENEMENT",
        EVENT_BONUS_ACTIVE = "BONUS ACTIF! Gloire augmentee pendant l'evenement!",
        EVENT_JOINED = "Inscrit a l'evenement: {NAME}",
        RANK_INSUFFICIENT = "Rang insuffisant! Requis: {RANK}-Rang",
        -- JACKPOT
        JACKPOT = "JACKPOT",
        JACKPOT_GLORY = "JACKPOT! +{PTS} Gloire Extra!",
        JACKPOT_ITEMS = "BONUS! {ITEMS}",
        
        -- EMERGENCY MISSION
        emerg_mission_label = "Mission",
        emerg_default_name = "Horde Soudaine",
        
        -- FRACTURE MESSAGES (BRIDGE/GATE LOGIC)
        fracture_destroyed = "Cette fracture a ete detruite!",
        fracture_failed_defense = "Un autre Chasseur a echoue la defense.",
        fracture_seek_other = "Cherchez une autre fracture. Bonne chasse!",
        fracture_ownership_expired = "Le droit de propriete precedent a expire. La fracture est libre!",
        fracture_conquered_other = "Fracture conquise par un autre Chasseur!",
        fracture_available_in = "Elle sera a nouveau disponible dans {SECONDS} secondes si non ouverte.",
        fracture_reserved_other_party = "Fracture reservee par un autre groupe!",
        fracture_reserved_self = "Fracture RESERVEE pour votre groupe pendant 60 secondes!",
        fracture_reserved_msg = "Fracture reservee! Tout le monde doit la toucher dans 60 secondes!",
        fracture_timeout_lost = "Temps expire! Le groupe a perdu la reservation.",
        fracture_timeout_freed = "Temps expire! La fracture est a nouveau libre.",
        fracture_party_ready = "{NAME} est pret! ({CURRENT}/{TOTAL}) - {REMAINING}s restants",
        fracture_all_ready = "Tout le monde est pret! La fracture s'ouvre!",
        defense_timeout_failed = "TEMPS EXPIRE! Monstres restants: {COUNT}",
        event_time_remaining = "Temps restant: {MINUTES} minutes",
        
        -- WAVE/DEFENSE NOTIFICATIONS
        defense_wave_spawn = "VAGUE {WAVE}! DEFENDS-TOI!",
        WAVE_NOTIFICATION = "VAGUE {WAVE}! +{MOBS} mobs!",
        -- WINNERS/LEADERBOARD
        winners_sep_daily = "|cffFFD700======================================|r",
        winners_title_daily = "|cffFFD700[HUNTER SYSTEM]|r |cff00FFFF* GAGNANTS CLASSEMENT GLOIRE QUOTIDIEN *|r",
        winners_sep_kill = "|cffFF8800======================================|r",
        winners_title_kill = "|cffFF8800[HUNTER SYSTEM]|r |cffFF8800* GAGNANTS CLASSEMENT KILLS QUOTIDIEN *|r",
        winners_sep_weekly = "|cffFF6600======================================|r",
        winners_title_weekly = "|cffFF6600[HUNTER SYSTEM]|r |cffFFD700** GAGNANTS CLASSEMENT HEBDOMADAIRE **|r",
        winners_glory = "Gloire",
        winners_kills = "Kills",
        winners_glory_syschat = "[HUNTER SYSTEM] Gagnants Gloire",
        winners_kill_syschat = "[HUNTER SYSTEM] Gagnants Kills",
        reset_daily = "|cffFFD700[HUNTER SYSTEM]|r Classement Quotidien Reinitialise! La course au pouvoir recommence.",
        reset_weekly = "|cffFF6600[HUNTER SYSTEM]|r Classement Hebdomadaire Reinitialise! Les recompenses ont ete distribuees.",
        classic_gate_intro = "Ce portail emane une energie instable.",
        classic_gate_worthy = "Ton Rang Chasseur est suffisant.",
        classic_gate_ask = "Veux-tu briser le sceau et entrer?",
        classic_gate_not_worthy = "Tu n'as pas assez de Gloire.",
        welcome_E_border = "====================================================",
        welcome_E_title = "              [E-RANK] EVEILLE",
        welcome_E_line1 = "   Bienvenue dans le Systeme, Chasseur.",
        welcome_E_line2 = "   La route est longue, mais chaque voyage",
        welcome_E_line3 = "   commence par un seul pas.",
        welcome_E_stats = "   >> Status: ACTIF | Menaces: EN ATTENTE <<",
        welcome_E_quote = "   'Le faible d'aujourd'hui... le fort de demain.'",
        welcome_D_border = "====================================================",
        welcome_D_title = "           [D-RANK] APPRENTI",
        welcome_D_line1 = "   Bienvenue, Apprenti.",
        welcome_D_line2 = "   Ton potentiel emerge.",
        welcome_D_line3 = "   Le Systeme observe tes progres.",
        welcome_D_stats = "   >> Status: EN CROISSANCE | Missions: BASE <<",
        welcome_D_quote = "   'Qui ne risque rien, n'a rien.'",
        welcome_C_border = "====================================================",
        welcome_C_title = "           * [C-RANK] CHASSEUR *",
        welcome_C_line1 = "   Bienvenue, Chasseur Expert.",
        welcome_C_line2 = "   Tes exploits resonnent dans les registres.",
        welcome_C_line3 = "   Le Systeme te reconnait comme guerrier.",
        welcome_C_stats = "   >> Status: EXPERT | Missions: DISPONIBLES <<",
        welcome_C_quote = "   'La force n'est pas tout. La volonte l'est.'",
        welcome_B_border = "====================================================",
        welcome_B_title = "          ** [B-RANK] VETERAN **",
        welcome_B_line1 = "   ATTENTION: Veteran B-Rank detecte.",
        welcome_B_line2 = "   Peu atteignent ce niveau.",
        welcome_B_line3 = "   Le Systeme honore ton chemin.",
        welcome_B_stats = "   >> Status: ELITE | Autorisation: HAUTE <<",
        welcome_B_quote = "   'Les faibles craignent l'obscurite. Les forts la dominent.'",
        welcome_A_border = "====================================================",
        welcome_A_title = "         *** [A-RANK] MAITRE ***",
        welcome_A_line1 = "   !! ALERTE !! Maitre A-Rank en ligne !!",
        welcome_A_line2 = "   Le Systeme s'incline devant ton pouvoir.",
        welcome_A_line3 = "   Tu es parmi les plus forts de ce monde.",
        welcome_A_stats = "   >> Status: MAITRE | Autorisation: MAXIMALE <<",
        welcome_A_quote = "   'Quand un Maitre marche, le monde tremble.'",
        welcome_S_border = "====================================================",
        welcome_S_title = "       **** [S-RANK] LEGENDE ****",
        welcome_S_line1 = "   !!! ALERTE CRITIQUE !!! Legende en ligne !!!",
        welcome_S_line2 = "   Le Systeme lui-meme reconnait ta domination.",
        welcome_S_line3 = "   Tes ennemis tremblent a ton nom.",
        welcome_S_stats = "   >> Status: LEGENDE | Pouvoir: DEVASTATEUR <<",
        welcome_S_quote = "   'Je ne combats pas. J'aneantis.'",
        welcome_N_border = "====================================================",
        welcome_N_title = "     ***** [NATIONAL] MONARQUE *****",
        welcome_N_line1 = "   !!! ALARME MAXIMALE !!! MONARQUE EN LIGNE !!!",
        welcome_N_line2 = "   Le Systeme lui-meme se plie devant toi.",
        welcome_N_line3 = "   Tu es au-dela de toute classification.",
        welcome_N_stats = "   >> Status: MONARQUE | Pouvoir: ABSOLU <<",
        welcome_N_quote = "   'Je suis le Systeme. Le Systeme c'est moi.'",
    },
    
    -- DEUTSCH
    ["de"] = {
        SYSTEM = "SYSTEM",
        ERROR = "FEHLER",
        WARNING = "WARNUNG",
        GLORY = "Ruhm",
        GLORY_EXTRA = "Extra Ruhm",
        TOTAL = "GESAMT",
        COMPLETE = "abgeschlossen",
        EVENT = "EREIGNIS",
        GLORY_BASE = "Basis Ruhm",
        BASE_GLORY = "Basis Ruhm",
        GLORY_DETAIL = "RUHM DETAIL",
        EVENT_LOTTERY_END = "End-Ereignis Verlosung: +{PTS} Ruhm!",
        EVENT_IN_PROGRESS = "[EREIGNIS IM GANGE]",
        MISSION_COMPLETED = "MISSION ABGESCHLOSSEN",
        ITEM_NO_FRACTURES = "Keine Risse in den Aufzeichnungen verfuegbar.",
        ITEM_FRACTURE_SUMMONED = "Riss {RANK} beschworen!",
        ITEM_FOCUS_SYSCHAT = "Fokus-Effekt aktiv: deine Belohnungswahrnehmung ist erhoeht.",
        ITEM_DIMKEY_SYSCHAT = "Die naechste Truhe garantiert einen Extra-Ruhm-Bonus!",
        ITEM_SEAL_SYSCHAT = "Die Siegel-Energie laesst dich die Verteidigungsphase ueberspringen.",
        ITEM_SIGNAL_SYSCHAT = "Eine Notfall-Mission wird gegen das naechste Elite-Ziel aktiviert.",
        ITEM_RESONATOR_NOPARTY = "Du musst in einer Gruppe sein um diesen Gegenstand zu benutzen!",
        ITEM_RESONATOR_SYSCHAT = "Resonator aktiviert! Gruppe erhaelt +20% Ruhm beim naechsten Elite-Kill!",
        ITEM_CALIBRATOR_SYSCHAT = "Kalibrator aktiv: naechster zufaelliger Riss wird Rang C oder hoeher sein.",
        ITEM_STABILIZER_DESC1 = "Das Artefakt resoniert, bereit die Realitaet zu biegen.",
        ITEM_STABILIZER_DESC2 = "Fokussiere dich auf die Energie die du beschworen willst.",
        CALIBRATOR = "KALIBRATOR",
        CALIBRATOR_ACTIVE_MSG = "Filter aktiv: Rang C+ garantiert!",
        CONFLICT = "KONFLIKT",
        CONFLICT_EMERGENCY = "Schliesse zuerst die laufende Notfall-Quest ab!",
        CONFLICT_DEFENSE = "Du verteidigst bereits einen anderen Riss!",
        ERROR_IDENTIFY_FRACTURE = "Kann den Riss nicht identifizieren!",
        SEAL_OF_CONQUEST = "SIEGEL DER EROBERUNG",
        SEAL_INSTANT_OPEN = "Der Riss oeffnet sich sofort!",
        CHEST_OPENED = "Du hast {NAME} geoeffnet - +{PTS} Ruhm",
        RESONANCE = "RESONANZ",
        RESONANCE_BONUS = "+20% Gruppen-Ruhm! (+{BONUS})",
        -- ACHIEVEMENTS
        ACHIEVEMENT = "ERFOLG",
        REWARD = "BELOHNUNG",
        COMPLETED = "abgeschlossen",
        ACH_NOT_FOUND = "Erfolg nicht gefunden.",
        ACH_ALREADY_CLAIMED = "Bereits eingeloest!",
        ACH_NOT_HUNTER = "Du bist kein Jaeger!",
        ACH_NOT_UNLOCKED = "Noch nicht freigeschaltet! {PROG}/{REQ}",
        ACH_RECEIVED = "x{COUNT} Gegenstand erhalten!",
        SMART_INV_FULL = "Inventar voll! {COUNT} Erfolge eingeloest.",
        SMART_CLAIMED = "{COUNT} Erfolge eingeloest!",
        SMART_NONE = "Keine Erfolge einzuloesen.",
        -- SHOP
        SHOP = "LADEN",
        SHOP_INSUFFICIENT = "Nicht genug Ruhm! Du hast {HAVE}, brauchst {NEED}",
        SHOP_PURCHASED = "Gekauft: {ITEM} x{COUNT}",
        SPENDABLE_GLORY = "Ausgbbarer Ruhm",
        SHOP_INV_FULL = "Inventar voll!",
        -- MISSIONS
        ALL_MISSIONS_COMPLETE = "ALLE MISSIONEN ABGESCHLOSSEN!",
        BONUS_50_COMPLETION = "50% ABSCHLUSS BONUS",
        ACTIVATED = "AKTIVIERT",
        FRACTURE_BONUS = "Riss Bonus +50%",
        -- ELITE
        ELITE = "ELITE",
        BONUS = "BONUS",
        -- LANGUAGE
        LANG_CHANGED = "Sprache geaendert!",
        -- SECURITY/ADMIN
        SECURITY_ERROR = "Sicherheitsfehler.",
        HUNTER_ERROR = "Jaeger-Fehler. Kontaktiere einen GM.",
        ITEM_NOT_FOUND = "Gegenstand nicht gefunden.",
        PLEASE_WAIT = "Bitte warten...",
        PRICE_ERROR = "Fehler: Ungueltiger Gegenstandspreis.",
        -- SHOP DIALOGS
        shop_title = "JAEGER HAENDLER",
        shop_ask = "Moechtest du diesen Gegenstand kaufen?",
        shop_opt_confirm = "Kauf Bestaetigen",
        shop_opt_cancel = "Abbrechen",
        shop_quantity = "Menge",
        shop_cost = "Kosten",
        shop_error_funds = "FEHLER: UNZUREICHENDER RUHM.",
        -- REWARD DIALOGS
        reward_type_daily = "Taeglich",
        reward_type_weekly = "Woechentlich",
        reward_claimed = "{PLAYER} hat die Top Rangliste {TYPE} Belohnung eingeloest!",
        reward_title = "JAEGER BELOHNUNGEN",
        reward_none = "Keine Belohnungen ausstehend.",
        reward_climb = "Erklimme die Rangliste fuer Ruhm!",
        rewards_available = "VERFUEGBARE BELOHNUNGEN",
        claim_daily = "Tagesbelohnung Einloesen",
        claim_weekly = "Wochenbelohnung Einloesen",
        claim_all = "ALLES Einloesen",
        -- ACHIEVEMENT DIALOGS
        ach_requirement = "Anforderung",
        ach_kills = "Kills",
        ach_reward = "Belohnung",
        ach_already_claimed = "|cffFF0000[!] BELOHNUNG BEREITS ABGEHOLT|r",
        ach_locked = "|cff888888[!] GESPERRT - Streng dich mehr an!|r",
        ach_claim = "Belohnung abholen",
        ach_close = "Schliessen",
        ach_item_received = "GEGENSTAND ERHALTEN",
        -- DEFENSE SYSTEM
        DEFENSE = "VERTEIDIGUNG",
        defense_start = "TOETE ALLE MOBS! Du hast {SECONDS} Sekunden!",
        defense_success_click = "RISS EROBERT! Du hast 5 Minuten um ihn zu oeffnen!",
        TOUCH_PORTAL = "BERUEHRE DAS PORTAL!",
        WAVE = "WELLE",
        WAVE_MSG = "WELLE {WAVE}: Toete {COUNT} Mobs!",
        DEFENSE_FAILED = "VERTEIDIGUNG GESCHEITERT!",
        DEFENSE_SUCCESS = "VERTEIDIGUNG ABGESCHLOSSEN!",
        PENALTY_ABANDON = "Abbruch-Strafe: -{PTS} Ruhm",
        TIME_EXPIRED = "Zeit abgelaufen!",
        OUT_OF_RANGE = "Du bist zu weit vom Riss entfernt!",
        -- EMERGENCY QUEST
        EMERG_QUEST = "NOTFALL",
        EMERG_REWARD = "Ruhm Belohnung: +{PTS}",
        EMERG_BONUS_ITEM = "GEGENSTAND BONUS: {ITEM} x{COUNT}",
        EMERG_COMPLETED = "NOTFALL-QUEST ABGESCHLOSSEN!",
        EMERG_FAILED = "Notfall-Quest Gescheitert!",
        -- BOSS/MOB
        BOSS_ALERT = "BOSS NAEHERT SICH!",
        MOB_KILLED = "Mob getoetet!",
        KILL_COUNT = "Kills: {CURRENT}/{TOTAL}",
        -- MISSIONS
        DAILY_MISSIONS = "TAEGLICHE MISSIONEN",
        WEEKLY_MISSIONS = "WOECHENTLICHE MISSIONEN",
        MISSION_PROGRESS = "Fortschritt: {CURRENT}/{TOTAL}",
        MISSION_REWARD = "Belohnung: +{PTS} Ruhm",
        -- RANKING
        POSITION = "Position",
        RANK_UP = "RANG AUFSTIEG!",
        NEW_RANK = "Neuer Rang: {RANK}",
        OVERTAKE = "DU HAST {NAME} UEBERHOLT!",
        OVERTAKEN = "DU WURDEST VON {NAME} UEBERHOLT!",
        -- EVENT
        EVENT_REGISTRATION = "EREIGNIS ANMELDUNG",
        EVENT_BONUS_ACTIVE = "BONUS AKTIV! Erhoehter Ruhm waehrend Ereignis!",
        EVENT_JOINED = "Am Ereignis teilgenommen: {NAME}",
        RANK_INSUFFICIENT = "Rang unzureichend! Benoetigt: {RANK}-Rang",
        -- JACKPOT
        JACKPOT = "JACKPOT",
        JACKPOT_GLORY = "JACKPOT! +{PTS} Extra Ruhm!",
        JACKPOT_ITEMS = "BONUS! {ITEMS}",
        
        -- EMERGENCY MISSION
        emerg_mission_label = "Mission",
        emerg_default_name = "Plotzliche Horde",
        
        -- WAVE/DEFENSE NOTIFICATIONS
        defense_wave_spawn = "WELLE {WAVE}! VERTEIDIGE DICH!",
        WAVE_NOTIFICATION = "WELLE {WAVE}! +{MOBS} Mobs!",
        -- WINNERS/LEADERBOARD
        winners_sep_daily = "|cffFFD700======================================|r",
        winners_title_daily = "|cffFFD700[HUNTER SYSTEM]|r |cff00FFFF* GEWINNER DER TAGLICHEN GLORY-RANGLISTE *|r",
        winners_sep_kill = "|cffFF8800======================================|r",
        winners_title_kill = "|cffFF8800[HUNTER SYSTEM]|r |cffFF8800* GEWINNER DER TAGLICHEN KILL-RANGLISTE *|r",
        winners_sep_weekly = "|cffFF6600======================================|r",
        winners_title_weekly = "|cffFF6600[HUNTER SYSTEM]|r |cffFFD700** GEWINNER DER WOCHENRANGLISTE **|r",
        winners_glory = "Ruhm",
        winners_kills = "Kills",
        winners_glory_syschat = "[HUNTER SYSTEM] Glory-Gewinner",
        winners_kill_syschat = "[HUNTER SYSTEM] Kill-Gewinner",
        reset_daily = "|cffFFD700[HUNTER SYSTEM]|r Tagesrangliste zuruckgesetzt! Der Kampf um die Macht beginnt erneut.",
        reset_weekly = "|cffFF6600[HUNTER SYSTEM]|r Wochenrangliste zuruckgesetzt! Die Belohnungen wurden verteilt.",
        classic_gate_intro = "Dieses Portal strahlt instabile Energie aus.",
        classic_gate_worthy = "Dein Jaeger-Rang ist ausreichend.",
        classic_gate_ask = "Willst du das Siegel brechen und eintreten?",
        classic_gate_not_worthy = "Du hast nicht genug Ruhm.",
        welcome_E_border = "====================================================",
        welcome_E_title = "              [E-RANG] ERWACHT",
        welcome_E_line1 = "   Willkommen zurueck im System, Jaeger.",
        welcome_E_line2 = "   Der Weg ist lang, aber jede Reise",
        welcome_E_line3 = "   beginnt mit einem einzigen Schritt.",
        welcome_E_stats = "   >> Status: AKTIV | Bedrohungen: AUSSTEHEND <<",
        welcome_E_quote = "   'Der Schwache von heute... der Starke von morgen.'",
        welcome_D_border = "====================================================",
        welcome_D_title = "           [D-RANG] LEHRLING",
        welcome_D_line1 = "   Willkommen zurueck, Lehrling.",
        welcome_D_line2 = "   Dein Potenzial entfaltet sich.",
        welcome_D_line3 = "   Das System beobachtet deinen Fortschritt.",
        welcome_D_stats = "   >> Status: WACHSEND | Missionen: BASIS <<",
        welcome_D_quote = "   'Wer nicht wagt, der nicht gewinnt.'",
        welcome_C_border = "====================================================",
        welcome_C_title = "           * [C-RANG] JAEGER *",
        welcome_C_line1 = "   Willkommen, Experten-Jaeger.",
        welcome_C_line2 = "   Deine Taten hallen in den Aufzeichnungen.",
        welcome_C_line3 = "   Das System erkennt dich als Krieger.",
        welcome_C_stats = "   >> Status: EXPERTE | Missionen: VERFUEGBAR <<",
        welcome_C_quote = "   'Staerke ist nicht alles. Wille ist es.'",
        welcome_B_border = "====================================================",
        welcome_B_title = "          ** [B-RANG] VETERAN **",
        welcome_B_line1 = "   WARNUNG: B-Rang Veteran erkannt.",
        welcome_B_line2 = "   Wenige erreichen dieses Level.",
        welcome_B_line3 = "   Das System ehrt deinen Weg.",
        welcome_B_stats = "   >> Status: ELITE | Berechtigung: HOCH <<",
        welcome_B_quote = "   'Die Schwachen fuerchten die Dunkelheit. Die Starken beherrschen sie.'",
        welcome_A_border = "====================================================",
        welcome_A_title = "         *** [A-RANG] MEISTER ***",
        welcome_A_line1 = "   !! ALARM !! A-Rang Meister online !!",
        welcome_A_line2 = "   Das System verneigt sich vor deiner Macht.",
        welcome_A_line3 = "   Du bist unter den Staerksten dieser Welt.",
        welcome_A_stats = "   >> Status: MEISTER | Berechtigung: MAXIMAL <<",
        welcome_A_quote = "   'Wenn ein Meister geht, zittert die Welt.'",
        welcome_S_border = "====================================================",
        welcome_S_title = "       **** [S-RANG] LEGENDE ****",
        welcome_S_line1 = "   !!! KRITISCHER ALARM !!! Legende online !!!",
        welcome_S_line2 = "   Das System selbst erkennt deine Herrschaft.",
        welcome_S_line3 = "   Deine Feinde zittern bei deinem Namen.",
        welcome_S_stats = "   >> Status: LEGENDE | Macht: VERHEEREND <<",
        welcome_S_quote = "   'Ich kaempfe nicht. Ich vernichte.'",
        welcome_N_border = "====================================================",
        welcome_N_title = "     ***** [NATIONAL] MONARCH *****",
        welcome_N_line1 = "   !!! MAXIMALER ALARM !!! MONARCH ONLINE !!!",
        welcome_N_line2 = "   Das System selbst beugt sich vor dir.",
        welcome_N_line3 = "   Du bist jenseits jeder Klassifizierung.",
        welcome_N_stats = "   >> Status: MONARCH | Macht: ABSOLUT <<",
        welcome_N_quote = "   'Ich bin das System. Das System bin ich.'",
    },
    
    -- ESPANOL
    ["es"] = {
        SYSTEM = "SISTEMA",
        ERROR = "ERROR",
        WARNING = "ADVERTENCIA",
        GLORY = "Gloria",
        GLORY_EXTRA = "Gloria Extra",
        TOTAL = "TOTAL",
        COMPLETE = "completadas",
        EVENT = "EVENTO",
        GLORY_BASE = "Gloria Base",
        BASE_GLORY = "Gloria Base",
        GLORY_DETAIL = "DETALLE GLORIA",
        EVENT_LOTTERY_END = "Sorteo fin de evento: +{PTS} Gloria!",
        EVENT_IN_PROGRESS = "[EVENTO EN CURSO]",
        MISSION_COMPLETED = "MISION COMPLETADA",
        ITEM_NO_FRACTURES = "No hay fracturas disponibles en los registros.",
        ITEM_FRACTURE_SUMMONED = "Fractura {RANK} invocada!",
        ITEM_FOCUS_SYSCHAT = "Efecto Focus activo: tu percepcion de recompensas esta aumentada.",
        ITEM_DIMKEY_SYSCHAT = "El proximo cofre garantizara un bonus de Gloria extra!",
        ITEM_SEAL_SYSCHAT = "La energia del Sello te permitira saltar la fase de defensa.",
        ITEM_SIGNAL_SYSCHAT = "Una Mision de Emergencia se activara contra el proximo objetivo Elite.",
        ITEM_RESONATOR_NOPARTY = "Debes estar en un grupo para usar este objeto!",
        ITEM_RESONATOR_SYSCHAT = "Resonador activado! El grupo recibe +20% Gloria en la proxima kill elite!",
        ITEM_CALIBRATOR_SYSCHAT = "Calibrador activo: la proxima fractura aleatoria sera de Rango C o superior.",
        ITEM_STABILIZER_DESC1 = "El artefacto resuena, listo para doblar la realidad.",
        ITEM_STABILIZER_DESC2 = "Concentrate en la energia que deseas invocar.",
        CALIBRATOR = "CALIBRADOR",
        CALIBRATOR_ACTIVE_MSG = "Filtro activo: Rango C+ garantizado!",
        CONFLICT = "CONFLICTO",
        CONFLICT_EMERGENCY = "Completa primero la Quest de Emergencia en curso!",
        CONFLICT_DEFENSE = "Ya estas defendiendo otra fractura!",
        ERROR_IDENTIFY_FRACTURE = "Imposible identificar la fractura!",
        SEAL_OF_CONQUEST = "SELLO DE CONQUISTA",
        SEAL_INSTANT_OPEN = "La fractura se abre instantaneamente!",
        CHEST_OPENED = "Abriste {NAME} - +{PTS} Gloria",
        RESONANCE = "RESONANCIA",
        RESONANCE_BONUS = "+20% Gloria de Grupo! (+{BONUS})",
        -- ACHIEVEMENTS
        ACHIEVEMENT = "LOGRO",
        REWARD = "RECOMPENSA",
        COMPLETED = "completado",
        ACH_NOT_FOUND = "Logro no encontrado.",
        ACH_ALREADY_CLAIMED = "Ya reclamado!",
        ACH_NOT_HUNTER = "No eres un Cazador!",
        ACH_NOT_UNLOCKED = "Aun no desbloqueado! {PROG}/{REQ}",
        ACH_RECEIVED = "Recibido x{COUNT} objeto!",
        SMART_INV_FULL = "Inventario lleno! Reclamados {COUNT} logros.",
        SMART_CLAIMED = "Reclamados {COUNT} logros!",
        SMART_NONE = "Ningun logro para reclamar.",
        -- SHOP
        SHOP = "TIENDA",
        SHOP_INSUFFICIENT = "Gloria insuficiente! Tienes {HAVE}, necesitas {NEED}",
        SHOP_PURCHASED = "Comprado: {ITEM} x{COUNT}",
        SPENDABLE_GLORY = "Gloria Gastable",
        SHOP_INV_FULL = "Inventario lleno!",
        -- MISSIONS
        ALL_MISSIONS_COMPLETE = "TODAS LAS MISIONES COMPLETAS!",
        BONUS_50_COMPLETION = "BONUS 50% COMPLETACION",
        ACTIVATED = "ACTIVADO",
        FRACTURE_BONUS = "Bonus Fractura +50%",
        -- ELITE
        ELITE = "ELITE",
        BONUS = "BONUS",
        -- LANGUAGE
        LANG_CHANGED = "Idioma cambiado!",
        -- SECURITY/ADMIN
        SECURITY_ERROR = "Error de seguridad.",
        HUNTER_ERROR = "Error Hunter. Contacta un GM.",
        ITEM_NOT_FOUND = "Objeto no encontrado.",
        PLEASE_WAIT = "Por favor espera...",
        PRICE_ERROR = "Error: Precio de objeto invalido.",
        -- SHOP DIALOGS
        shop_title = "MERCADER CAZADOR",
        shop_ask = "Quieres comprar este objeto?",
        shop_opt_confirm = "Confirmar Compra",
        shop_opt_cancel = "Cancelar",
        shop_quantity = "Cantidad",
        shop_cost = "Costo",
        shop_error_funds = "ERROR: GLORIA INSUFICIENTE.",
        -- REWARD DIALOGS
        reward_type_daily = "Diario",
        reward_type_weekly = "Semanal",
        reward_claimed = "{PLAYER} reclamo la recompensa Top Ranking {TYPE}!",
        reward_title = "RECOMPENSAS CAZADOR",
        reward_none = "Sin premios pendientes.",
        reward_climb = "Sube en el ranking para ganar gloria!",
        rewards_available = "RECOMPENSAS DISPONIBLES",
        claim_daily = "Reclamar Premio Diario",
        claim_weekly = "Reclamar Premio Semanal",
        claim_all = "Reclamar TODO",
        -- ACHIEVEMENT DIALOGS
        ach_requirement = "Requisito",
        ach_kills = "Muertes",
        ach_reward = "Recompensa",
        ach_already_claimed = "|cffFF0000[!] RECOMPENSA YA RECLAMADA|r",
        ach_locked = "|cff888888[!] BLOQUEADO - Esfuerzate mas!|r",
        ach_claim = "Reclamar Premio",
        ach_close = "Cerrar",
        ach_item_received = "OBJETO RECIBIDO",
        -- DEFENSE SYSTEM
        DEFENSE = "DEFENSA",
        defense_start = "MATA TODOS LOS MOBS! Tienes {SECONDS} segundos!",
        defense_success_click = "FRACTURA CONQUISTADA! Tienes 5 minutos para abrirla!",
        TOUCH_PORTAL = "TOCA EL PORTAL!",
        WAVE = "OLEADA",
        WAVE_MSG = "OLEADA {WAVE}: Mata {COUNT} mobs!",
        DEFENSE_FAILED = "DEFENSA FALLIDA!",
        DEFENSE_SUCCESS = "DEFENSA COMPLETADA!",
        PENALTY_ABANDON = "Penalizacion abandono: -{PTS} Gloria",
        TIME_EXPIRED = "Tiempo expirado!",
        OUT_OF_RANGE = "Estas muy lejos de la fractura!",
        -- EMERGENCY QUEST
        EMERG_QUEST = "EMERGENCIA",
        EMERG_REWARD = "Recompensa Gloria: +{PTS}",
        EMERG_BONUS_ITEM = "BONUS OBJETO: {ITEM} x{COUNT}",
        EMERG_COMPLETED = "QUEST DE EMERGENCIA COMPLETADA!",
        EMERG_FAILED = "Quest de Emergencia Fallida!",
        -- BOSS/MOB
        BOSS_ALERT = "BOSS ACERCANDOSE!",
        MOB_KILLED = "Mob eliminado!",
        KILL_COUNT = "Asesinatos: {CURRENT}/{TOTAL}",
        -- MISSIONS
        DAILY_MISSIONS = "MISIONES DIARIAS",
        WEEKLY_MISSIONS = "MISIONES SEMANALES",
        MISSION_PROGRESS = "Progreso: {CURRENT}/{TOTAL}",
        MISSION_REWARD = "Recompensa: +{PTS} Gloria",
        -- RANKING
        POSITION = "Posicion",
        RANK_UP = "RANGO ARRIBA!",
        NEW_RANK = "Nuevo Rango: {RANK}",
        OVERTAKE = "HAS SUPERADO A {NAME}!",
        OVERTAKEN = "HAS SIDO SUPERADO POR {NAME}!",
        -- EVENT
        EVENT_REGISTRATION = "REGISTRO DE EVENTO",
        EVENT_BONUS_ACTIVE = "BONUS ACTIVO! Gloria aumentada durante evento!",
        EVENT_JOINED = "Unido al evento: {NAME}",
        RANK_INSUFFICIENT = "Rango insuficiente! Requerido: {RANK}-Rango",
        -- JACKPOT
        JACKPOT = "JACKPOT",
        JACKPOT_GLORY = "JACKPOT! +{PTS} Gloria Extra!",
        JACKPOT_ITEMS = "BONUS! {ITEMS}",
        
        -- EMERGENCY MISSION
        emerg_mission_label = "Mision",
        emerg_default_name = "Horda Repentina",
        
        -- FRACTURE MESSAGES (BRIDGE/GATE LOGIC)
        fracture_destroyed = "¡Esta fractura ha sido destruida!",
        fracture_failed_defense = "Otro Hunter fallo la defensa.",
        fracture_seek_other = "Busca otra fractura. ¡Buena caza!",
        fracture_ownership_expired = "El derecho de propiedad anterior ha caducado. ¡La fractura es libre!",
        fracture_conquered_other = "¡Fractura conquistada por otro Hunter!",
        fracture_available_in = "Volvera disponible en {SECONDS} segundos si no se abre.",
        fracture_reserved_other_party = "¡Fractura reservada por otro grupo!",
        fracture_reserved_self = "¡Fractura RESERVADA para tu grupo por 60 segundos!",
        fracture_reserved_msg = "¡Fractura reservada! ¡Todos deben tocarla en 60 segundos!",
        fracture_timeout_lost = "¡Tiempo agotado! El grupo perdio la reserva.",
        fracture_timeout_freed = "¡Tiempo agotado! La fractura es libre de nuevo.",
        fracture_party_ready = "¡{NAME} esta listo! ({CURRENT}/{TOTAL}) - {REMAINING}s restantes",
        fracture_all_ready = "¡Todos listos! ¡La fractura se esta abriendo!",
        defense_timeout_failed = "¡TIEMPO AGOTADO! Monstruos restantes: {COUNT}",
        event_time_remaining = "Tiempo restante: {MINUTES} minutos",
        
        -- WAVE/DEFENSE NOTIFICATIONS
        defense_wave_spawn = "OLEADA {WAVE}! DEFIENDETE!",
        WAVE_NOTIFICATION = "OLEADA {WAVE}! +{MOBS} mobs!",
        -- WINNERS/LEADERBOARD
        winners_sep_daily = "|cffFFD700======================================|r",
        winners_title_daily = "|cffFFD700[HUNTER SYSTEM]|r |cff00FFFF* GANADORES CLASIFICACION GLORIA DIARIA *|r",
        winners_sep_kill = "|cffFF8800======================================|r",
        winners_title_kill = "|cffFF8800[HUNTER SYSTEM]|r |cffFF8800* GANADORES CLASIFICACION KILLS DIARIA *|r",
        winners_sep_weekly = "|cffFF6600======================================|r",
        winners_title_weekly = "|cffFF6600[HUNTER SYSTEM]|r |cffFFD700** GANADORES CLASIFICACION SEMANAL **|r",
        winners_glory = "Gloria",
        winners_kills = "Muertes",
        winners_glory_syschat = "[HUNTER SYSTEM] Ganadores Gloria",
        winners_kill_syschat = "[HUNTER SYSTEM] Ganadores Kills",
        reset_daily = "|cffFFD700[HUNTER SYSTEM]|r Clasificacion Diaria Reiniciada! La carrera por el poder comienza de nuevo.",
        reset_weekly = "|cffFF6600[HUNTER SYSTEM]|r Clasificacion Semanal Reiniciada! Los premios han sido distribuidos.",
        classic_gate_intro = "Este portal emana energia inestable.",
        classic_gate_worthy = "Tu Rango de Cazador es suficiente.",
        classic_gate_ask = "Quieres romper el sello y entrar?",
        classic_gate_not_worthy = "No tienes suficiente Gloria.",
        welcome_E_border = "====================================================",
        welcome_E_title = "              [E-RANGO] DESPERTADO",
        welcome_E_line1 = "   Bienvenido al Sistema, Cazador.",
        welcome_E_line2 = "   El camino es largo, pero cada viaje",
        welcome_E_line3 = "   comienza con un solo paso.",
        welcome_E_stats = "   >> Estado: ACTIVO | Amenazas: PENDIENTES <<",
        welcome_E_quote = "   'El debil de hoy... el fuerte de manana.'",
        welcome_D_border = "====================================================",
        welcome_D_title = "           [D-RANGO] APRENDIZ",
        welcome_D_line1 = "   Bienvenido, Aprendiz.",
        welcome_D_line2 = "   Tu potencial esta emergiendo.",
        welcome_D_line3 = "   El Sistema observa tu progreso.",
        welcome_D_stats = "   >> Estado: EN CRECIMIENTO | Misiones: BASICAS <<",
        welcome_D_quote = "   'Quien no arriesga, no gana.'",
        welcome_C_border = "====================================================",
        welcome_C_title = "           * [C-RANGO] CAZADOR *",
        welcome_C_line1 = "   Bienvenido, Cazador Experto.",
        welcome_C_line2 = "   Tus hazanas resuenan en los registros.",
        welcome_C_line3 = "   El Sistema te reconoce como guerrero.",
        welcome_C_stats = "   >> Estado: EXPERTO | Misiones: DISPONIBLES <<",
        welcome_C_quote = "   'La fuerza no es todo. La voluntad lo es.'",
        welcome_B_border = "====================================================",
        welcome_B_title = "          ** [B-RANGO] VETERANO **",
        welcome_B_line1 = "   ATENCION: Veterano B-Rango detectado.",
        welcome_B_line2 = "   Pocos alcanzan este nivel.",
        welcome_B_line3 = "   El Sistema honra tu camino.",
        welcome_B_stats = "   >> Estado: ELITE | Autorizacion: ALTA <<",
        welcome_B_quote = "   'Los debiles temen la oscuridad. Los fuertes la dominan.'",
        welcome_A_border = "====================================================",
        welcome_A_title = "         *** [A-RANGO] MAESTRO ***",
        welcome_A_line1 = "   !! ALERTA !! Maestro A-Rango en linea !!",
        welcome_A_line2 = "   El Sistema se inclina ante tu poder.",
        welcome_A_line3 = "   Estas entre los mas fuertes de este mundo.",
        welcome_A_stats = "   >> Estado: MAESTRO | Autorizacion: MAXIMA <<",
        welcome_A_quote = "   'Cuando un Maestro camina, el mundo tiembla.'",
        welcome_S_border = "====================================================",
        welcome_S_title = "       **** [S-RANGO] LEYENDA ****",
        welcome_S_line1 = "   !!! ALERTA CRITICA !!! Leyenda en linea !!!",
        welcome_S_line2 = "   El Sistema mismo reconoce tu dominio.",
        welcome_S_line3 = "   Tus enemigos tiemblan con tu nombre.",
        welcome_S_stats = "   >> Estado: LEYENDA | Poder: DEVASTADOR <<",
        welcome_S_quote = "   'No lucho. Aniquilo.'",
        welcome_N_border = "====================================================",
        welcome_N_title = "     ***** [NACIONAL] MONARCA *****",
        welcome_N_line1 = "   !!! ALARMA MAXIMA !!! MONARCA EN LINEA !!!",
        welcome_N_line2 = "   El Sistema mismo se dobla ante ti.",
        welcome_N_line3 = "   Estas mas alla de toda clasificacion.",
        welcome_N_stats = "   >> Estado: MONARCA | Poder: ABSOLUTO <<",
        welcome_N_quote = "   'Yo soy el Sistema. El Sistema soy yo.'",
    },
    
    -- PORTUGUES
    ["pt"] = {
        SYSTEM = "SISTEMA",
        ERROR = "ERRO",
        WARNING = "AVISO",
        GLORY = "Gloria",
        GLORY_EXTRA = "Gloria Extra",
        TOTAL = "TOTAL",
        COMPLETE = "completas",
        EVENT = "EVENTO",
        GLORY_BASE = "Gloria Base",
        BASE_GLORY = "Gloria Base",
        GLORY_DETAIL = "DETALHE GLORIA",
        EVENT_LOTTERY_END = "Sorteio fim de evento: +{PTS} Gloria!",
        EVENT_IN_PROGRESS = "[EVENTO EM CURSO]",
        MISSION_COMPLETED = "MISSAO COMPLETADA",
        ITEM_NO_FRACTURES = "Nenhuma fratura disponivel nos registros.",
        ITEM_FRACTURE_SUMMONED = "Fratura {RANK} invocada!",
        CALIBRATOR = "CALIBRADOR",
        CALIBRATOR_ACTIVE_MSG = "Filtro ativo: Rank C+ garantido!",
        CONFLICT = "CONFLITO",
        CONFLICT_EMERGENCY = "Complete primeiro a Quest de Emergencia em andamento!",
        CONFLICT_DEFENSE = "Voce ja esta defendendo outra fratura!",
        ERROR_IDENTIFY_FRACTURE = "Impossivel identificar a fratura!",
        SEAL_OF_CONQUEST = "SELO DE CONQUISTA",
        SEAL_INSTANT_OPEN = "A fratura abre instantaneamente!",
        CHEST_OPENED = "Voce abriu {NAME} - +{PTS} Gloria",
        RESONANCE = "RESSONANCIA",
        RESONANCE_BONUS = "+20% Gloria de Grupo! (+{BONUS})",
        -- ACHIEVEMENTS
        ACHIEVEMENT = "CONQUISTA",
        REWARD = "RECOMPENSA",
        COMPLETED = "completo",
        ACH_NOT_FOUND = "Conquista nao encontrada.",
        ACH_ALREADY_CLAIMED = "Ja resgatado!",
        ACH_NOT_HUNTER = "Voce nao e um Cacador!",
        ACH_NOT_UNLOCKED = "Ainda nao desbloqueado! {PROG}/{REQ}",
        ACH_RECEIVED = "Recebido x{COUNT} item!",
        SMART_INV_FULL = "Inventario cheio! {COUNT} conquistas resgatadas.",
        SMART_CLAIMED = "{COUNT} conquistas resgatadas!",
        SMART_NONE = "Nenhuma conquista para resgatar.",
        -- SHOP
        SHOP = "LOJA",
        SHOP_INSUFFICIENT = "Gloria insuficiente! Tem {HAVE}, precisa {NEED}",
        SHOP_PURCHASED = "Comprado: {ITEM} x{COUNT}",
        SPENDABLE_GLORY = "Gloria Gastavel",
        SHOP_INV_FULL = "Inventario cheio!",
        -- MISSIONS
        ALL_MISSIONS_COMPLETE = "TODAS AS MISSOES COMPLETAS!",
        BONUS_50_COMPLETION = "BONUS 50% CONCLUSAO",
        ACTIVATED = "ATIVADO",
        FRACTURE_BONUS = "Bonus Fratura +50%",
        -- ELITE
        ELITE = "ELITE",
        BONUS = "BONUS",
        -- LANGUAGE
        LANG_CHANGED = "Idioma alterado!",
        -- SECURITY/ADMIN
        SECURITY_ERROR = "Erro de seguranca.",
        HUNTER_ERROR = "Erro Hunter. Contate um GM.",
        ITEM_NOT_FOUND = "Item nao encontrado.",
        PLEASE_WAIT = "Por favor aguarde...",
        PRICE_ERROR = "Erro: Preco de item invalido.",
        -- SHOP DIALOGS
        shop_title = "MERCADOR CACADOR",
        shop_ask = "Quer comprar este item?",
        shop_opt_confirm = "Confirmar Compra",
        shop_opt_cancel = "Cancelar",
        shop_quantity = "Quantidade",
        shop_cost = "Custo",
        shop_error_funds = "ERRO: GLORIA INSUFICIENTE.",
        -- REWARD DIALOGS
        reward_type_daily = "Diario",
        reward_type_weekly = "Semanal",
        reward_claimed = "{PLAYER} resgatou a recompensa Top Ranking {TYPE}!",
        reward_title = "RECOMPENSAS CACADOR",
        reward_none = "Sem premios pendentes.",
        reward_climb = "Suba no ranking para ganhar gloria!",
        rewards_available = "RECOMPENSAS DISPONIVEIS",
        claim_daily = "Resgatar Premio Diario",
        claim_weekly = "Resgatar Premio Semanal",
        claim_all = "Resgatar TUDO",
        -- ACHIEVEMENT DIALOGS
        ach_requirement = "Requisito",
        ach_kills = "Mortes",
        ach_reward = "Recompensa",
        ach_already_claimed = "|cffFF0000[!] RECOMPENSA JA RESGATADA|r",
        ach_locked = "|cff888888[!] BLOQUEADO - Se esforce mais!|r",
        ach_claim = "Resgatar Premio",
        ach_close = "Fechar",
        ach_item_received = "ITEM RECEBIDO",
        -- DEFENSE SYSTEM
        DEFENSE = "DEFESA",
        defense_start = "MATE TODOS OS MOBS! Voce tem {SECONDS} segundos!",
        defense_success_click = "FRATURA CONQUISTADA! Voce tem 5 minutos para abri-la!",
        TOUCH_PORTAL = "TOQUE NO PORTAL!",
        WAVE = "ONDA",
        WAVE_MSG = "ONDA {WAVE}: Mate {COUNT} mobs!",
        DEFENSE_FAILED = "DEFESA FALHOU!",
        DEFENSE_SUCCESS = "DEFESA COMPLETA!",
        PENALTY_ABANDON = "Penalidade abandono: -{PTS} Gloria",
        TIME_EXPIRED = "Tempo esgotado!",
        OUT_OF_RANGE = "Voce esta muito longe da fratura!",
        -- EMERGENCY QUEST
        EMERG_QUEST = "EMERGENCIA",
        EMERG_REWARD = "Recompensa Gloria: +{PTS}",
        EMERG_BONUS_ITEM = "BONUS ITEM: {ITEM} x{COUNT}",
        EMERG_COMPLETED = "QUEST DE EMERGENCIA COMPLETA!",
        EMERG_FAILED = "Quest de Emergencia Falhou!",
        -- BOSS/MOB
        BOSS_ALERT = "BOSS CHEGANDO!",
        MOB_KILLED = "Mob morto!",
        KILL_COUNT = "Mortes: {CURRENT}/{TOTAL}",
        -- MISSIONS
        DAILY_MISSIONS = "MISSOES DIARIAS",
        WEEKLY_MISSIONS = "MISSOES SEMANAIS",
        MISSION_PROGRESS = "Progresso: {CURRENT}/{TOTAL}",
        MISSION_REWARD = "Recompensa: +{PTS} Gloria",
        -- RANKING
        POSITION = "Posicao",
        RANK_UP = "RANK SUBIU!",
        NEW_RANK = "Novo Rank: {RANK}",
        OVERTAKE = "VOCE PASSOU {NAME}!",
        OVERTAKEN = "VOCE FOI PASSADO POR {NAME}!",
        -- EVENT
        EVENT_REGISTRATION = "REGISTRO DE EVENTO",
        EVENT_BONUS_ACTIVE = "BONUS ATIVO! Gloria aumentada durante evento!",
        EVENT_JOINED = "Entrou no evento: {NAME}",
        RANK_INSUFFICIENT = "Rank insuficiente! Necessario: {RANK}-Rank",
        -- JACKPOT
        JACKPOT = "JACKPOT",
        JACKPOT_GLORY = "JACKPOT! +{PTS} Gloria Extra!",
        JACKPOT_ITEMS = "BONUS! {ITEMS}",
        
        -- EMERGENCY MISSION
        emerg_mission_label = "Missao",
        emerg_default_name = "Horda Repentina",
        
        -- FRACTURE MESSAGES (BRIDGE/GATE LOGIC)
        fracture_destroyed = "Esta fenda foi destruida!",
        fracture_failed_defense = "Outro Hunter falhou na defesa.",
        fracture_seek_other = "Procure outra fenda. Boa caca!",
        fracture_ownership_expired = "O direito de propriedade anterior expirou. A fenda esta livre!",
        fracture_conquered_other = "Fenda conquistada por outro Hunter!",
        fracture_available_in = "Estara disponivel novamente em {SECONDS} segundos se nao for aberta.",
        fracture_reserved_other_party = "Fenda reservada por outro grupo!",
        fracture_reserved_self = "Fenda RESERVADA para seu grupo por 60 segundos!",
        fracture_reserved_msg = "Fenda reservada! Todos devem toca-la em 60 segundos!",
        fracture_timeout_lost = "Tempo expirado! O grupo perdeu a reserva.",
        fracture_timeout_freed = "Tempo expirado! A fenda esta livre novamente.",
        fracture_party_ready = "{NAME} esta pronto! ({CURRENT}/{TOTAL}) - {REMAINING}s restantes",
        fracture_all_ready = "Todos prontos! A fenda esta se abrindo!",
        defense_timeout_failed = "TEMPO EXPIRADO! Monstros restantes: {COUNT}",
        event_time_remaining = "Tempo restante: {MINUTES} minutos",
        
        -- WAVE/DEFENSE NOTIFICATIONS
        defense_wave_spawn = "ONDA {WAVE}! DEFENDA-SE!",
        WAVE_NOTIFICATION = "ONDA {WAVE}! +{MOBS} mobs!",
        -- WINNERS/LEADERBOARD
        winners_sep_daily = "|cffFFD700======================================|r",
        winners_title_daily = "|cffFFD700[HUNTER SYSTEM]|r |cff00FFFF* VENCEDORES DO RANKING DIARIO DE GLORIA *|r",
        winners_sep_kill = "|cffFF8800======================================|r",
        winners_title_kill = "|cffFF8800[HUNTER SYSTEM]|r |cffFF8800* VENCEDORES DO RANKING DIARIO DE KILLS *|r",
        winners_sep_weekly = "|cffFF6600======================================|r",
        winners_title_weekly = "|cffFF6600[HUNTER SYSTEM]|r |cffFFD700** VENCEDORES DO RANKING SEMANAL **|r",
        winners_glory = "Gloria",
        winners_kills = "Kills",
        winners_glory_syschat = "[HUNTER SYSTEM] Vencedores Gloria",
        winners_kill_syschat = "[HUNTER SYSTEM] Vencedores Kills",
        reset_daily = "|cffFFD700[HUNTER SYSTEM]|r Ranking Diario Reiniciado! A corrida pelo poder comeca novamente.",
        reset_weekly = "|cffFF6600[HUNTER SYSTEM]|r Ranking Semanal Reiniciado! As recompensas foram distribuidas.",
        classic_gate_intro = "Este portal emana energia instavel.",
        classic_gate_worthy = "Seu Rank de Cacador e suficiente.",
        classic_gate_ask = "Quer quebrar o selo e entrar?",
        classic_gate_not_worthy = "Voce nao tem Gloria suficiente.",
        welcome_E_border = "====================================================",
        welcome_E_title = "              [E-RANK] DESPERTADO",
        welcome_E_line1 = "   Bem-vindo ao Sistema, Cacador.",
        welcome_E_line2 = "   O caminho e longo, mas cada jornada",
        welcome_E_line3 = "   comeca com um unico passo.",
        welcome_E_stats = "   >> Status: ATIVO | Ameacas: PENDENTES <<",
        welcome_E_quote = "   'O fraco de hoje... o forte de amanha.'",
        welcome_D_border = "====================================================",
        welcome_D_title = "           [D-RANK] APRENDIZ",
        welcome_D_line1 = "   Bem-vindo de volta, Aprendiz.",
        welcome_D_line2 = "   Seu potencial esta emergindo.",
        welcome_D_line3 = "   O Sistema observa seu progresso.",
        welcome_D_stats = "   >> Status: CRESCENDO | Missoes: BASICAS <<",
        welcome_D_quote = "   'Quem nao arrisca, nao petisca.'",
        welcome_C_border = "====================================================",
        welcome_C_title = "           * [C-RANK] CACADOR *",
        welcome_C_line1 = "   Bem-vindo, Cacador Experiente.",
        welcome_C_line2 = "   Seus feitos ecoam nos registros.",
        welcome_C_line3 = "   O Sistema te reconhece como guerreiro.",
        welcome_C_stats = "   >> Status: EXPERIENTE | Missoes: DISPONIVEIS <<",
        welcome_C_quote = "   'A forca nao e tudo. A vontade e.'",
        welcome_B_border = "====================================================",
        welcome_B_title = "          ** [B-RANK] VETERANO **",
        welcome_B_line1 = "   ATENCAO: Veterano B-Rank detectado.",
        welcome_B_line2 = "   Poucos alcancam este nivel.",
        welcome_B_line3 = "   O Sistema honra seu caminho.",
        welcome_B_stats = "   >> Status: ELITE | Autorizacao: ALTA <<",
        welcome_B_quote = "   'Os fracos temem a escuridao. Os fortes a dominam.'",
        welcome_A_border = "====================================================",
        welcome_A_title = "         *** [A-RANK] MESTRE ***",
        welcome_A_line1 = "   !! ALERTA !! Mestre A-Rank online !!",
        welcome_A_line2 = "   O Sistema se curva ao seu poder.",
        welcome_A_line3 = "   Voce esta entre os mais fortes deste mundo.",
        welcome_A_stats = "   >> Status: MESTRE | Autorizacao: MAXIMA <<",
        welcome_A_quote = "   'Quando um Mestre caminha, o mundo treme.'",
        welcome_S_border = "====================================================",
        welcome_S_title = "       **** [S-RANK] LENDA ****",
        welcome_S_line1 = "   !!! ALERTA CRITICO !!! Lenda online !!!",
        welcome_S_line2 = "   O proprio Sistema reconhece seu dominio.",
        welcome_S_line3 = "   Seus inimigos tremem ao ouvir seu nome.",
        welcome_S_stats = "   >> Status: LENDA | Poder: DEVASTADOR <<",
        welcome_S_quote = "   'Eu nao luto. Eu aniquilo.'",
        welcome_N_border = "====================================================",
        welcome_N_title = "     ***** [NACIONAL] MONARCA *****",
        welcome_N_line1 = "   !!! ALARME MAXIMO !!! MONARCA ONLINE !!!",
        welcome_N_line2 = "   O Sistema se curva diante de voce.",
        welcome_N_line3 = "   Voce esta alem de qualquer classificacao.",
        welcome_N_stats = "   >> Status: MONARCA | Poder: ABSOLUTO <<",
        welcome_N_quote = "   'Eu sou o Sistema. O Sistema sou eu.'",
    },
    
    -- POLSKI
    ["pl"] = {
        SYSTEM = "SYSTEM",
        ERROR = "BLAD",
        WARNING = "OSTRZEZENIE",
        GLORY = "Chwala",
        GLORY_EXTRA = "Dodatkowa Chwala",
        TOTAL = "LACZNIE",
        COMPLETE = "ukonczone",
        EVENT = "WYDARZENIE",
        GLORY_BASE = "Bazowa Chwala",
        BASE_GLORY = "Bazowa Chwala",
        GLORY_DETAIL = "SZCZEGOLY CHWALY",
        EVENT_LOTTERY_END = "Losowanie na koniec wydarzenia: +{PTS} Chwaly!",
        EVENT_IN_PROGRESS = "[WYDARZENIE W TOKU]",
        MISSION_COMPLETED = "MISJA UKONCZONA",
        ITEM_NO_FRACTURES = "Brak dostepnych peknieci w rejestrach.",
        ITEM_FRACTURE_SUMMONED = "Pekniecie {RANK} przywolane!",
        CALIBRATOR = "KALIBRATOR",
        CALIBRATOR_ACTIVE_MSG = "Filtr aktywny: Ranga C+ gwarantowana!",
        CONFLICT = "KONFLIKT",
        CONFLICT_EMERGENCY = "Najpierw ukonczij trwajacy Quest Awaryjny!",
        CONFLICT_DEFENSE = "Juz bronisz innego pekniecia!",
        ERROR_IDENTIFY_FRACTURE = "Nie mozna zidentyfikowac pekniecia!",
        SEAL_OF_CONQUEST = "PIECZEC PODBOJU",
        SEAL_INSTANT_OPEN = "Pekniecie otwiera sie natychmiast!",
        CHEST_OPENED = "Otworzyles {NAME} - +{PTS} Chwaly",
        RESONANCE = "REZONANS",
        RESONANCE_BONUS = "+20% Chwaly Grupowej! (+{BONUS})",
        -- ACHIEVEMENTS
        ACHIEVEMENT = "OSIAGNIECIE",
        REWARD = "NAGRODA",
        COMPLETED = "ukonczone",
        ACH_NOT_FOUND = "Osiagniecie nie znalezione.",
        ACH_ALREADY_CLAIMED = "Juz odebrane!",
        ACH_NOT_HUNTER = "Nie jestes Lowca!",
        ACH_NOT_UNLOCKED = "Jeszcze nie odblokowane! {PROG}/{REQ}",
        ACH_RECEIVED = "Otrzymano x{COUNT} przedmiot!",
        SMART_INV_FULL = "Ekwipunek pelny! Odebrano {COUNT} osiagniec.",
        SMART_CLAIMED = "Odebrano {COUNT} osiagniec!",
        SMART_NONE = "Brak osiagniec do odebrania.",
        -- SHOP
        SHOP = "SKLEP",
        SHOP_INSUFFICIENT = "Niewystarczajaca Chwala! Masz {HAVE}, potrzebujesz {NEED}",
        SHOP_PURCHASED = "Kupiono: {ITEM} x{COUNT}",
        SPENDABLE_GLORY = "Wydawalna Chwala",
        SHOP_INV_FULL = "Ekwipunek pelny!",
        -- MISSIONS
        ALL_MISSIONS_COMPLETE = "WSZYSTKIE MISJE UKONCZONE!",
        BONUS_50_COMPLETION = "BONUS 50% UKONCZENIA",
        ACTIVATED = "AKTYWOWANY",
        FRACTURE_BONUS = "Bonus Pekniecie +50%",
        -- ELITE
        ELITE = "ELITA",
        BONUS = "BONUS",
        -- LANGUAGE
        LANG_CHANGED = "Jezyk zmieniony!",
        -- SECURITY/ADMIN
        SECURITY_ERROR = "Blad bezpieczenstwa.",
        HUNTER_ERROR = "Blad Lowcy. Skontaktuj sie z GM.",
        ITEM_NOT_FOUND = "Przedmiot nie znaleziony.",
        PLEASE_WAIT = "Prosze czekac...",
        PRICE_ERROR = "Blad: Nieprawidlowa cena przedmiotu.",
        -- SHOP DIALOGS
        shop_title = "HANDLARZ LOWCY",
        shop_ask = "Chcesz kupic ten przedmiot?",
        shop_opt_confirm = "Potwierdz Zakup",
        shop_opt_cancel = "Anuluj",
        shop_quantity = "Ilosc",
        shop_cost = "Koszt",
        shop_error_funds = "BLAD: NIEWYSTARCZAJACA CHWALA.",
        -- REWARD DIALOGS
        reward_type_daily = "Dzienna",
        reward_type_weekly = "Tygodniowa",
        reward_claimed = "{PLAYER} odebral nagrode Top Ranking {TYPE}!",
        reward_title = "NAGRODY LOWCY",
        reward_none = "Brak oczekujacych nagrod.",
        reward_climb = "Wspinaj sie w rankingu po chwale!",
        rewards_available = "DOSTEPNE NAGRODY",
        claim_daily = "Odbierz Nagrode Dzienna",
        claim_weekly = "Odbierz Nagrode Tygodniowa",
        claim_all = "Odbierz WSZYSTKO",
        -- ACHIEVEMENT DIALOGS
        ach_requirement = "Wymaganie",
        ach_kills = "Zabojstwa",
        ach_reward = "Nagroda",
        ach_already_claimed = "|cffFF0000[!] NAGRODA JUZ ODEBRANA|r",
        ach_locked = "|cff888888[!] ZABLOKOWANE - Postaraj sie bardziej!|r",
        ach_claim = "Odbierz Nagrode",
        ach_close = "Zamknij",
        ach_item_received = "PRZEDMIOT OTRZYMANY",
        -- DEFENSE SYSTEM
        DEFENSE = "OBRONA",
        defense_start = "ZABIJ WSZYSTKIE MOBY! Masz {SECONDS} sekund!",
        defense_success_click = "PEKNIECIE ZDOBYTE! Masz 5 minut zeby je otworzyc!",
        TOUCH_PORTAL = "DOTKNIJ PORTALU!",
        WAVE = "FALA",
        WAVE_MSG = "FALA {WAVE}: Zabij {COUNT} mobow!",
        DEFENSE_FAILED = "OBRONA NIEUDANA!",
        DEFENSE_SUCCESS = "OBRONA UKONCZONA!",
        PENALTY_ABANDON = "Kara za porzucenie: -{PTS} Chwaly",
        TIME_EXPIRED = "Czas minal!",
        OUT_OF_RANGE = "Jestes zbyt daleko od pekniecia!",
        -- EMERGENCY QUEST
        EMERG_QUEST = "AWARIA",
        EMERG_REWARD = "Nagroda Chwaly: +{PTS}",
        EMERG_BONUS_ITEM = "BONUS PRZEDMIOT: {ITEM} x{COUNT}",
        EMERG_COMPLETED = "QUEST AWARYJNA UKONCZONA!",
        EMERG_FAILED = "Quest Awaryjna Nieudana!",
        -- BOSS/MOB
        BOSS_ALERT = "BOSS NADCHODZI!",
        MOB_KILLED = "Mob zabity!",
        KILL_COUNT = "Zabicia: {CURRENT}/{TOTAL}",
        -- MISSIONS
        DAILY_MISSIONS = "MISJE DZIENNE",
        WEEKLY_MISSIONS = "MISJE TYGODNIOWE",
        MISSION_PROGRESS = "Postep: {CURRENT}/{TOTAL}",
        MISSION_REWARD = "Nagroda: +{PTS} Chwaly",
        -- RANKING
        POSITION = "Pozycja",
        RANK_UP = "AWANS RANGI!",
        NEW_RANK = "Nowa Ranga: {RANK}",
        OVERTAKE = "WYPRZEDZILES {NAME}!",
        OVERTAKEN = "ZOSTALES WYPRZEDZONY PRZEZ {NAME}!",
        -- EVENT
        EVENT_REGISTRATION = "REJESTRACJA WYDARZENIA",
        EVENT_BONUS_ACTIVE = "BONUS AKTYWNY! Zwiekszona Chwala podczas wydarzenia!",
        EVENT_JOINED = "Dolaczyles do wydarzenia: {NAME}",
        RANK_INSUFFICIENT = "Niewystarczajaca ranga! Wymagana: {RANK}-Ranga",
        -- JACKPOT
        JACKPOT = "JACKPOT",
        JACKPOT_GLORY = "JACKPOT! +{PTS} Dodatkowej Chwaly!",
        JACKPOT_ITEMS = "BONUS! {ITEMS}",
        
        -- EMERGENCY MISSION
        emerg_mission_label = "Misja",
        emerg_default_name = "Nagla Horda",
        
        -- FRACTURE MESSAGES (BRIDGE/GATE LOGIC)
        fracture_destroyed = "Ta szczelina zostala zniszczona!",
        fracture_failed_defense = "Inny Lowca nie zdal obrony.",
        fracture_seek_other = "Szukaj innej szczeliny. Udanej mysliwosci!",
        fracture_ownership_expired = "Poprzednie prawo wlasnosci wygaslo. Szczelina jest wolna!",
        fracture_conquered_other = "Szczelina zdobyta przez innego Lowce!",
        fracture_available_in = "Bedzie dostepna ponownie za {SECONDS} sekund, jesli nie zostanie otwarta.",
        fracture_reserved_other_party = "Szczelina zarezerwowana przez inny zespol!",
        fracture_reserved_self = "Szczelina ZAREZERWOWANA dla twojego zespolu na 60 sekund!",
        fracture_reserved_msg = "Szczelina zarezerwowana! Wszyscy musza ja dotknac w ciagu 60 sekund!",
        fracture_timeout_lost = "Czas sie skonczyl! Zespol stracil rezerwacje.",
        fracture_timeout_freed = "Czas sie skonczyl! Szczelina jest znowu wolna.",
        fracture_party_ready = "{NAME} jest gotowy! ({CURRENT}/{TOTAL}) - {REMAINING}s pozostalych",
        fracture_all_ready = "Wszyscy gotowi! Szczelina sie otwiera!",
        defense_timeout_failed = "CZAS SKONCZYL SIE! Pozostalych potworow: {COUNT}",
        event_time_remaining = "Pozostaly czas: {MINUTES} minut",
        
        -- WAVE/DEFENSE NOTIFICATIONS
        defense_wave_spawn = "FALA {WAVE}! BRON SIE!",
        WAVE_NOTIFICATION = "FALA {WAVE}! +{MOBS} mobow!",
        -- WINNERS/LEADERBOARD
        winners_sep_daily = "|cffFFD700======================================|r",
        winners_title_daily = "|cffFFD700[HUNTER SYSTEM]|r |cff00FFFF* ZWYCIEZCY DZIENNEGO RANKINGU CHWALY *|r",
        winners_sep_kill = "|cffFF8800======================================|r",
        winners_title_kill = "|cffFF8800[HUNTER SYSTEM]|r |cffFF8800* ZWYCIEZCY DZIENNEGO RANKINGU ZABOJSTW *|r",
        winners_sep_weekly = "|cffFF6600======================================|r",
        winners_title_weekly = "|cffFF6600[HUNTER SYSTEM]|r |cffFFD700** ZWYCIEZCY RANKINGU TYGODNIOWEGO **|r",
        winners_glory = "Chwala",
        winners_kills = "Zabojstwa",
        winners_glory_syschat = "[HUNTER SYSTEM] Zwyciezcy Chwaly",
        winners_kill_syschat = "[HUNTER SYSTEM] Zwyciezcy Zabojstw",
        reset_daily = "|cffFFD700[HUNTER SYSTEM]|r Dzienny Ranking Zresetowany! Wyscig o wladze zaczyna sie od nowa.",
        reset_weekly = "|cffFF6600[HUNTER SYSTEM]|r Tygodniowy Ranking Zresetowany! Nagrody zostaly rozdane.",
        classic_gate_intro = "Ten portal emanuje niestabilna energia.",
        classic_gate_worthy = "Twoja Ranga Lowcy jest wystarczajaca.",
        classic_gate_ask = "Chcesz zlamac pieczec i wejsc?",
        classic_gate_not_worthy = "Nie masz wystarczajacej Chwaly.",
        welcome_E_border = "====================================================",
        welcome_E_title = "              [E-RANGA] PRZEBUDZONY",
        welcome_E_line1 = "   Witaj w Systemie, Lowco.",
        welcome_E_line2 = "   Droga jest dluga, ale kazda podroz",
        welcome_E_line3 = "   zaczyna sie od jednego kroku.",
        welcome_E_stats = "   >> Status: AKTYWNY | Zagrozenia: OCZEKUJACE <<",
        welcome_E_quote = "   'Slaby dzisiaj... silny jutro.'",
        welcome_D_border = "====================================================",
        welcome_D_title = "           [D-RANGA] UCZEN",
        welcome_D_line1 = "   Witaj ponownie, Uczniu.",
        welcome_D_line2 = "   Twoj potencjal sie ujawnia.",
        welcome_D_line3 = "   System obserwuje twoje postepy.",
        welcome_D_stats = "   >> Status: ROSNIE | Misje: PODSTAWOWE <<",
        welcome_D_quote = "   'Kto nie ryzykuje, ten nie wygrywa.'",
        welcome_C_border = "====================================================",
        welcome_C_title = "           * [C-RANGA] LOWCA *",
        welcome_C_line1 = "   Witaj, Doswiadczony Lowco.",
        welcome_C_line2 = "   Twoje czyny odbijaja sie echem w rejestrach.",
        welcome_C_line3 = "   System uznaje cie za wojownika.",
        welcome_C_stats = "   >> Status: EKSPERT | Misje: DOSTEPNE <<",
        welcome_C_quote = "   'Sila to nie wszystko. Wola tak.'",
        welcome_B_border = "====================================================",
        welcome_B_title = "          ** [B-RANGA] WETERAN **",
        welcome_B_line1 = "   UWAGA: Wykryto Weterana B-Rangi.",
        welcome_B_line2 = "   Niewielu osiaga ten poziom.",
        welcome_B_line3 = "   System honoruje twoja droge.",
        welcome_B_stats = "   >> Status: ELITA | Autoryzacja: WYSOKA <<",
        welcome_B_quote = "   'Slabi boja sie ciemnosci. Silni nia wladaja.'",
        welcome_A_border = "====================================================",
        welcome_A_title = "         *** [A-RANGA] MISTRZ ***",
        welcome_A_line1 = "   !! ALARM !! Mistrz A-Rangi online !!",
        welcome_A_line2 = "   System sklania sie przed twoja moca.",
        welcome_A_line3 = "   Jestes wsrod najsilniejszych tego swiata.",
        welcome_A_stats = "   >> Status: MISTRZ | Autoryzacja: MAKSYMALNA <<",
        welcome_A_quote = "   'Gdy Mistrz idzie, swiat drzy.'",
        welcome_S_border = "====================================================",
        welcome_S_title = "       **** [S-RANGA] LEGENDA ****",
        welcome_S_line1 = "   !!! KRYTYCZNY ALARM !!! Legenda online !!!",
        welcome_S_line2 = "   Sam System uznaje twoje panowanie.",
        welcome_S_line3 = "   Twoi wrogowie trzesa sie na twoje imie.",
        welcome_S_stats = "   >> Status: LEGENDA | Moc: NISZCZYCIELSKA <<",
        welcome_S_quote = "   'Ja nie walcze. Ja unicestwiam.'",
        welcome_N_border = "====================================================",
        welcome_N_title = "     ***** [KRAJOWY] MONARCHA *****",
        welcome_N_line1 = "   !!! MAKSYMALNY ALARM !!! MONARCHA ONLINE !!!",
        welcome_N_line2 = "   Sam System klania sie przed toba.",
        welcome_N_line3 = "   Jestes ponad wszelka klasyfikacja.",
        welcome_N_stats = "   >> Status: MONARCHA | Moc: ABSOLUTNA <<",
        welcome_N_quote = "   'Ja jestem Systemem. System to ja.'",
    },
    
    -- RUSSIAN (transliterated)
    ["ru"] = {
        SYSTEM = "SISTEMA",
        ERROR = "OSHIBKA",
        WARNING = "VNIMANIE",
        GLORY = "Slava",
        GLORY_EXTRA = "Dop. Slava",
        TOTAL = "VSEGO",
        COMPLETE = "zaversheno",
        EVENT = "SOBYTIE",
        GLORY_BASE = "Bazovaya Slava",
        BASE_GLORY = "Bazovaya Slava",
        GLORY_DETAIL = "DETALI SLAVY",
        EVENT_LOTTERY_END = "Lotereya v kontse sobytiya: +{PTS} Slavy!",
        EVENT_IN_PROGRESS = "[SOBYTIE V PROCESSE]",
        MISSION_COMPLETED = "MISSIYA ZAVERSHENA",
        ITEM_NO_FRACTURES = "Net dostupnykh razlomov v registrakh.",
        ITEM_FRACTURE_SUMMONED = "Razlom {RANK} prizvan!",
        CALIBRATOR = "KALIBRATOR",
        CALIBRATOR_ACTIVE_MSG = "Filtr aktiven: Rang C+ garantirovan!",
        CONFLICT = "KONFLIKT",
        CONFLICT_EMERGENCY = "Snachala zavershi tekushchiy Avariynyy Kvest!",
        CONFLICT_DEFENSE = "Ty uzhe zashchishchaesh drugoy razlom!",
        ERROR_IDENTIFY_FRACTURE = "Nevozmozhno identificirovat razlom!",
        SEAL_OF_CONQUEST = "PECHAT ZAVOEVANYA",
        SEAL_INSTANT_OPEN = "Razlom otkryvaetsya mgnovenno!",
        CHEST_OPENED = "Ty otkryl {NAME} - +{PTS} Slavy",
        RESONANCE = "REZONANS",
        RESONANCE_BONUS = "+20% Gruppovoy Slavy! (+{BONUS})",
        -- ACHIEVEMENTS
        ACHIEVEMENT = "DOSTIZHENIYE",
        REWARD = "NAGRADA",
        COMPLETED = "zaversheno",
        ACH_NOT_FOUND = "Dostizheniye ne naydeno.",
        ACH_ALREADY_CLAIMED = "Uzhe polucheno!",
        ACH_NOT_HUNTER = "Ty ne Okhotnik!",
        ACH_NOT_UNLOCKED = "Esche ne razblokirovano! {PROG}/{REQ}",
        ACH_RECEIVED = "Polucheno x{COUNT} predmet!",
        SMART_INV_FULL = "Inventar polon! Polucheno {COUNT} dostizheniy.",
        SMART_CLAIMED = "Polucheno {COUNT} dostizheniy!",
        SMART_NONE = "Net dostizheniy dlya polucheniya.",
        -- SHOP
        SHOP = "MAGAZIN",
        SHOP_INSUFFICIENT = "Nedostatochno Slavy! U tebya {HAVE}, nuzhno {NEED}",
        SHOP_PURCHASED = "Kupleno: {ITEM} x{COUNT}",
        SPENDABLE_GLORY = "Tratimaya Slava",
        SHOP_INV_FULL = "Inventar polon!",
        -- MISSIONS
        ALL_MISSIONS_COMPLETE = "VSE MISSII ZAVERSHENY!",
        BONUS_50_COMPLETION = "BONUS 50% ZAVERSHENIYA",
        ACTIVATED = "AKTIVIROVAN",
        FRACTURE_BONUS = "Bonus Razlom +50%",
        -- ELITE
        ELITE = "ELITA",
        BONUS = "BONUS",
        -- LANGUAGE
        LANG_CHANGED = "Yazyk izmenen!",
        -- SECURITY/ADMIN
        SECURITY_ERROR = "Oshibka bezopasnosti.",
        HUNTER_ERROR = "Oshibka Okhotnika. Svyazhis s GM.",
        ITEM_NOT_FOUND = "Predmet ne nayden.",
        PLEASE_WAIT = "Pozhaluysta podozhdite...",
        PRICE_ERROR = "Oshibka: Nevernaya tsena predmeta.",
        -- SHOP DIALOGS
        shop_title = "TORGOVETS OKHOTNIKA",
        shop_ask = "Hochesh kupit etot predmet?",
        shop_opt_confirm = "Podtverdit Pokupku",
        shop_opt_cancel = "Otmena",
        shop_quantity = "Kolichestvo",
        shop_cost = "Stoimost",
        shop_error_funds = "OSHIBKA: NEDOSTATOCHNO SLAVY.",
        -- REWARD DIALOGS
        reward_type_daily = "Dnevnaya",
        reward_type_weekly = "Nedelnaya",
        reward_claimed = "{PLAYER} poluchil nagradu Top Reytinga {TYPE}!",
        reward_title = "NAGRADY OKHOTNIKA",
        reward_none = "Net ozhidayushchikh nagrad.",
        reward_climb = "Podnimaysya v reytinge za slavoy!",
        rewards_available = "DOSTUPNYE NAGRADY",
        claim_daily = "Poluchit Dnevnuyu Nagradu",
        claim_weekly = "Poluchit Nedelnuyu Nagradu",
        claim_all = "Poluchit VSE",
        -- ACHIEVEMENT DIALOGS
        ach_requirement = "Trebovanie",
        ach_kills = "Ubijstva",
        ach_reward = "Nagrada",
        ach_already_claimed = "|cffFF0000[!] NAGRADA UZE POLUCENA|r",
        ach_locked = "|cff888888[!] ZABLOKIROVANO - Starajsja bolse!|r",
        ach_claim = "Polucit Nagradu",
        ach_close = "Zakryt",
        ach_item_received = "PREDMET POLUCHEN",
        -- DEFENSE SYSTEM
        DEFENSE = "ZASHCHITA",
        defense_start = "UBEY VSEKH MOBOV! U tebya {SECONDS} sekund!",
        defense_success_click = "RAZLOM ZAVOEEVAN! U tebya 5 minut chtoby otkryt!",
        TOUCH_PORTAL = "KOSNIS PORTALA!",
        WAVE = "VOLNA",
        WAVE_MSG = "VOLNA {WAVE}: Ubey {COUNT} mobov!",
        DEFENSE_FAILED = "ZASHCHITA PROVALENA!",
        DEFENSE_SUCCESS = "ZASHCHITA ZAVERSHENA!",
        PENALTY_ABANDON = "Shtraf za otkaz: -{PTS} Slavy",
        TIME_EXPIRED = "Vremya vyshlo!",
        OUT_OF_RANGE = "Ty slishkom daleko ot razloma!",
        -- EMERGENCY QUEST
        EMERG_QUEST = "EKSTRENNIY",
        EMERG_REWARD = "Nagrada Slavy: +{PTS}",
        EMERG_BONUS_ITEM = "BONUS PREDMET: {ITEM} x{COUNT}",
        EMERG_COMPLETED = "EKSTRENNIY KVEST ZAVERSHEN!",
        EMERG_FAILED = "Ekstrenniy Kvest Provalen!",
        -- BOSS/MOB
        BOSS_ALERT = "BOSS PRIBLIZHAETSYA!",
        MOB_KILLED = "Mob ubit!",
        KILL_COUNT = "Ubiystva: {CURRENT}/{TOTAL}",
        -- MISSIONS
        DAILY_MISSIONS = "EZHEDNEVNYE MISSII",
        WEEKLY_MISSIONS = "EZHENEDELNYE MISSII",
        MISSION_PROGRESS = "Progress: {CURRENT}/{TOTAL}",
        MISSION_REWARD = "Nagrada: +{PTS} Slavy",
        -- RANKING
        POSITION = "Pozitsiya",
        RANK_UP = "POVYSHENIE RANGA!",
        NEW_RANK = "Novyy Rang: {RANK}",
        OVERTAKE = "TY OBOGNAL {NAME}!",
        OVERTAKEN = "TEBYA OBOGNAL {NAME}!",
        -- EVENT
        EVENT_REGISTRATION = "REGISTRATSIYA SOBYTIYA",
        EVENT_BONUS_ACTIVE = "BONUS AKTIVEN! Uvelichennaya Slava vo vremya sobytiya!",
        EVENT_JOINED = "Prisoedinilsya k sobytiyu: {NAME}",
        RANK_INSUFFICIENT = "Nedostatochnyy rang! Trebuetsya: {RANK}-Rang",
        -- JACKPOT
        JACKPOT = "DZHEKPOT",
        JACKPOT_GLORY = "DZHEKPOT! +{PTS} Dopolnitelnoy Slavy!",
        JACKPOT_ITEMS = "BONUS! {ITEMS}",
        
        -- EMERGENCY MISSION
        emerg_mission_label = "Missija",
        emerg_default_name = "Vnezapnaja Orda",
        
        -- FRACTURE MESSAGES (BRIDGE/GATE LOGIC)
        fracture_destroyed = "Eta trescina byla unichtozhena!",
        fracture_failed_defense = "Drugoj Okhotnik ne sdelal oboronu.",
        fracture_seek_other = "Ishite druguju trescinu. Udachnogo okhotnika!",
        fracture_ownership_expired = "Predydushchee pravo sobstvennosti isteklo. Trescina svobodna!",
        fracture_conquered_other = "Trescina zavoerana drugoj Okhotnik'yu!",
        fracture_available_in = "Ona budet dostupna cherez {SECONDS} sekund, esli ne budet otkryta.",
        fracture_reserved_other_party = "Trescina zarezervirana drugoj gruppoj!",
        fracture_reserved_self = "Trescina ZAREZERVIRANA dlya vashej gruppy na 60 sekund!",
        fracture_reserved_msg = "Trescina zarezervirana! Vse dolzhny ee dotronuys' za 60 sekund!",
        fracture_timeout_lost = "Vremya isteklo! Gruppa poteryala bron'.",
        fracture_timeout_freed = "Vremya isteklo! Trescina snova svobodna.",
        fracture_party_ready = "{NAME} gotov! ({CURRENT}/{TOTAL}) - {REMAINING}s ostalos'",
        fracture_all_ready = "Vse gotovy! Trescina otkryvaetsya!",
        defense_timeout_failed = "VREMYA ISTEKLO! Ostavshihsya monstrov: {COUNT}",
        event_time_remaining = "Ostalos' vremeni: {MINUTES} minut",
        
        -- WAVE/DEFENSE NOTIFICATIONS
        defense_wave_spawn = "VOLNA {WAVE}! ZASHCHISHCHAYSYA!",
        WAVE_NOTIFICATION = "VOLNA {WAVE}! +{MOBS} mobov!",
        -- WINNERS/LEADERBOARD
        winners_sep_daily = "|cffFFD700======================================|r",
        winners_title_daily = "|cffFFD700[HUNTER SYSTEM]|r |cff00FFFF* POBEDITELI DNEVNOGO REJTINGA SLAVY *|r",
        winners_sep_kill = "|cffFF8800======================================|r",
        winners_title_kill = "|cffFF8800[HUNTER SYSTEM]|r |cffFF8800* POBEDITELI DNEVNOGO REJTINGA UBIJSTV *|r",
        winners_sep_weekly = "|cffFF6600======================================|r",
        winners_title_weekly = "|cffFF6600[HUNTER SYSTEM]|r |cffFFD700** POBEDITELI NEDELNOGO REJTINGA **|r",
        winners_glory = "Slava",
        winners_kills = "Ubijstva",
        winners_glory_syschat = "[HUNTER SYSTEM] Pobediteli Slavy",
        winners_kill_syschat = "[HUNTER SYSTEM] Pobediteli Ubijstv",
        reset_daily = "|cffFFD700[HUNTER SYSTEM]|r Dnevnoj Rejting Sbrosen! Gonka za vlastju nacinaetsja snova.",
        reset_weekly = "|cffFF6600[HUNTER SYSTEM]|r Nedelnyj Rejting Sbrosen! Nagrady byli rozdany.",
        classic_gate_intro = "Etot portal izluchayet nestabilnuyu energiyu.",
        classic_gate_worthy = "Tvoy Rang Okhotnika dostatochnyy.",
        classic_gate_ask = "Hochesh slomat pechat i voyti?",
        classic_gate_not_worthy = "U tebya nedostatochno Slavy.",
        welcome_E_border = "====================================================",
        welcome_E_title = "              [E-RANG] PROBUZHDENNYY",
        welcome_E_line1 = "   Dobro pozhalovat v Sistemu, Okhotnik.",
        welcome_E_line2 = "   Put dolog, no kazhdoe puteshestvie",
        welcome_E_line3 = "   nachinaetsya s odnogo shaga.",
        welcome_E_stats = "   >> Status: AKTIVNYY | Ugrozy: OZHIDAYUT <<",
        welcome_E_quote = "   'Slabyy segodnya... silnyy zavtra.'",
        welcome_D_border = "====================================================",
        welcome_D_title = "           [D-RANG] UCHENIK",
        welcome_D_line1 = "   Dobro pozhalovat, Uchenik.",
        welcome_D_line2 = "   Tvoy potentsial proyavlyaetsya.",
        welcome_D_line3 = "   Sistema nablyudaet za tvoim progressom.",
        welcome_D_stats = "   >> Status: RASTET | Missii: BAZOVYE <<",
        welcome_D_quote = "   'Kto ne riskuet, tot ne pobezhdaet.'",
        welcome_C_border = "====================================================",
        welcome_C_title = "           * [C-RANG] OKHOTNIK *",
        welcome_C_line1 = "   Dobro pozhalovat, Opytnyy Okhotnik.",
        welcome_C_line2 = "   Tvoi podvigi otdayutsya ekhom v registrakh.",
        welcome_C_line3 = "   Sistema priznaet tebya voinom.",
        welcome_C_stats = "   >> Status: EKSPERT | Missii: DOSTUPNY <<",
        welcome_C_quote = "   'Sila ne vse. Volya - da.'",
        welcome_B_border = "====================================================",
        welcome_B_title = "          ** [B-RANG] VETERAN **",
        welcome_B_line1 = "   VNIMANIE: Obnaruzhen Veteran B-Ranga.",
        welcome_B_line2 = "   Nemnogiye dostigayut etogo urovnya.",
        welcome_B_line3 = "   Sistema chtit tvoy put.",
        welcome_B_stats = "   >> Status: ELITA | Avtorizatsiya: VYSOKAYA <<",
        welcome_B_quote = "   'Slabye boyatsya tmy. Silnye yey vladeyut.'",
        welcome_A_border = "====================================================",
        welcome_A_title = "         *** [A-RANG] MASTER ***",
        welcome_A_line1 = "   !! TREVOGA !! Master A-Ranga onlayn !!",
        welcome_A_line2 = "   Sistema sklonyaetsya pered tvoey moshchyu.",
        welcome_A_line3 = "   Ty sredi silneyshikh etogo mira.",
        welcome_A_stats = "   >> Status: MASTER | Avtorizatsiya: MAKSIMALNAYA <<",
        welcome_A_quote = "   'Kogda Master idet, mir drozhit.'",
        welcome_S_border = "====================================================",
        welcome_S_title = "       **** [S-RANG] LEGENDA ****",
        welcome_S_line1 = "   !!! KRITICHESKAYA TREVOGA !!! Legenda onlayn !!!",
        welcome_S_line2 = "   Sama Sistema priznaet tvoye gospodstvo.",
        welcome_S_line3 = "   Tvoi vragi trepeshchut ot tvoego imeni.",
        welcome_S_stats = "   >> Status: LEGENDA | Moshch: RAZRUSHITELNAYA <<",
        welcome_S_quote = "   'Ya ne srazhayus. Ya unichtozhayus.'",
        welcome_N_border = "====================================================",
        welcome_N_title = "     ***** [NACIONALNYY] MONARKH *****",
        welcome_N_line1 = "   !!! MAKSIMALNAYA TREVOGA !!! MONARKH ONLAYN !!!",
        welcome_N_line2 = "   Sama Sistema sklonyaetsya pered toboy.",
        welcome_N_line3 = "   Ty vne lyuboy klassifikacii.",
        welcome_N_stats = "   >> Status: MONARKH | Moshch: ABSOLYUTNAYA <<",
        welcome_N_quote = "   'Ya - Sistema. Sistema - eto ya.'",
    },
}

-- ============================================================
-- LANGUAGE HELPER FUNCTIONS (wrapper per le funzioni MySQL)
-- ============================================================

-- Funzione per ottenere la lingua del player (usa database MySQL)
function hg_lib.get_player_lang()
    local pid = pc.get_player_id()
    return hg_lib.get_player_language(pid)
end

-- Funzione per impostare la lingua del player (usa database MySQL)
function hg_lib.set_player_lang(lang)
    if lang and hg_lib.translations[lang] then
        local pid = pc.get_player_id()
        return hg_lib.set_player_language(pid, lang)
    end
    return false
end

-- GESTIONE DATI TEMPORANEI SESSIONE
function hg_lib.get_temp_gate_data(pid)
    if not _G.hunter_temp_gate_data then
        _G.hunter_temp_gate_data = {}
    end
    return _G.hunter_temp_gate_data[pid] or {}
end

function hg_lib.set_temp_gate_data(pid, data)
    if not _G.hunter_temp_gate_data then
        _G.hunter_temp_gate_data = {}
    end
    _G.hunter_temp_gate_data[pid] = data
end

-- UTILITY STRINGHE
function hg_lib.clean_str(str)
    if str == nil then return "" end
    -- Sostituisce spazi con + per compatibilit� cmdchat
    local result = string.gsub(tostring(str), " ", "+")
    return result
end

-- VALIDAZIONE RANK
function hg_lib.validate_rank(rank)
    if rank == nil then return "E" end
    
    -- PRENDE SOLO LA PRIMA LETTERA (es. "N-Rank" diventa "N")
    local clean_rank = string.upper(string.sub(rank, 1, 1))
    
    local valid_ranks = {E=true, D=true, C=true, B=true, A=true, S=true, N=true}
    
    if valid_ranks[clean_rank] then
        return clean_rank
    end
    
    -- Se fallisce, ritorna E come sicurezza
    return "E"
end

-- CACHE MOB ELITE (FIX CRASH: Non cancella pi� la tabella globale brutalmente)
function hg_lib.load_elite_cache()
    -- Se la cache esiste ed � recente (< 1 ora), non ricaricare
    local now = get_time()
    if _G.hunter_elite_cache and _G.hunter_cache_loaded and (now - _G.hunter_cache_loaded < 3600) then
        return 
    end

    -- Inizializza solo se necessario
    if not _G.hunter_elite_cache then
        _G.hunter_elite_cache = {}
        _G.hunter_elite_data = {}  
    end

    local c, d = mysql_direct_query("SELECT vnum, name, type_name, base_points, rank_color FROM srv1_hunabku.hunter_quest_spawns WHERE enabled=1")

    if c > 0 then
        -- Ricostruiamo le tabelle interne senza nil-lare l'oggetto principale
        local new_cache = {}
        local new_data = {}

        for i = 1, c do
            local vnum = tonumber(d[i].vnum)
            new_cache[vnum] = true  
            new_data[vnum] = {
                name = d[i].name,
                type_name = d[i].type_name,
                base_points = tonumber(d[i].base_points) or 100,
                rank_color = d[i].rank_color or "BLUE"
            }
        end

        -- Swap sicuro
        _G.hunter_elite_cache = new_cache
        _G.hunter_elite_data = new_data
        _G.hunter_cache_loaded = now
    end
end

-- CACHE ONDATE DIFESA
function hg_lib.load_defense_waves_cache(rank_grade)
    rank_grade = hg_lib.validate_rank(rank_grade)

    if not _G.hunter_defense_waves_cache then
        _G.hunter_defense_waves_cache = {}
    end
    if not _G.hunter_defense_total_mobs then
        _G.hunter_defense_total_mobs = {}
    end

    if _G.hunter_defense_waves_cache[rank_grade] then
        return 
    end

    local q = "SELECT wave_number, spawn_time, mob_vnum, mob_count, spawn_radius FROM srv1_hunabku.hunter_fracture_defense_waves "
    q = q .. "WHERE rank_grade='" .. rank_grade .. "' AND enabled=1 ORDER BY wave_number"
    local c, d = mysql_direct_query(q)

    if c > 0 then
        _G.hunter_defense_waves_cache[rank_grade] = {}
        local total_mobs = 0

        for i = 1, c do
            local wave_num = tonumber(d[i].wave_number)
            local spawn_time = tonumber(d[i].spawn_time)
            local mob_vnum = tonumber(d[i].mob_vnum)
            local mob_count = tonumber(d[i].mob_count)
            local spawn_radius = tonumber(d[i].spawn_radius) or 7

            -- Conta il totale mob per questo rank
            total_mobs = total_mobs + mob_count

            if not _G.hunter_defense_waves_cache[rank_grade][wave_num] then
                _G.hunter_defense_waves_cache[rank_grade][wave_num] = {
                    spawn_time = spawn_time,
                    mobs = {}
                }
            end

            table.insert(_G.hunter_defense_waves_cache[rank_grade][wave_num].mobs, {
                vnum = mob_vnum,
                count = mob_count,
                radius = spawn_radius
            })
        end
        
        -- Salva il totale mob richiesti per questo rank
        _G.hunter_defense_total_mobs[rank_grade] = total_mobs
    end
end

-- Funzione helper per ottenere il totale mob richiesti
function hg_lib.get_defense_total_mobs(rank_grade)
    rank_grade = hg_lib.validate_rank(rank_grade)
    if _G.hunter_defense_total_mobs and _G.hunter_defense_total_mobs[rank_grade] then
        return _G.hunter_defense_total_mobs[rank_grade]
    end
    return 0
end

-- SALVATAGGIO DATI SU DB (FLUSH)
function hg_lib.flush_ranking_updates()
    local pid = pc.get_player_id()

    local pending_total_pts = tonumber(pc.getqf("hq_pending_total_pts")) or 0
    local pending_spendable_pts = tonumber(pc.getqf("hq_pending_spendable_pts")) or 0
    local pending_daily_pts = tonumber(pc.getqf("hq_pending_daily_pts")) or 0
    local pending_weekly_pts = tonumber(pc.getqf("hq_pending_weekly_pts")) or 0
    local pending_total_kills = tonumber(pc.getqf("hq_pending_total_kills")) or 0
    local pending_daily_kills = tonumber(pc.getqf("hq_pending_daily_kills")) or 0
    local pending_weekly_kills = tonumber(pc.getqf("hq_pending_weekly_kills")) or 0
    local pending_metins = tonumber(pc.getqf("hq_pending_metins")) or 0
    local pending_chests = tonumber(pc.getqf("hq_pending_chests")) or 0
    local pending_fractures = tonumber(pc.getqf("hq_pending_fractures")) or 0

    -- Flush ranking solo se c'è qualcosa
    if pending_total_pts > 0 or pending_total_kills > 0 or pending_metins > 0 or pending_chests > 0 or pending_fractures > 0 then
        local q = "UPDATE srv1_hunabku.hunter_quest_ranking SET "
        q = q .. "total_points = total_points + " .. pending_total_pts .. ", "
        q = q .. "spendable_points = spendable_points + " .. pending_spendable_pts .. ", "
        q = q .. "daily_points = daily_points + " .. pending_daily_pts .. ", "
        q = q .. "weekly_points = weekly_points + " .. pending_weekly_pts .. ", "
        q = q .. "total_kills = total_kills + " .. pending_total_kills .. ", "
        q = q .. "daily_kills = daily_kills + " .. pending_daily_kills .. ", "
        q = q .. "weekly_kills = weekly_kills + " .. pending_weekly_kills .. ", "
        q = q .. "total_metins = total_metins + " .. pending_metins .. ", "
        q = q .. "total_chests = total_chests + " .. pending_chests .. ", "
        q = q .. "total_fractures = total_fractures + " .. pending_fractures .. " "
        q = q .. "WHERE player_id = " .. pid

        mysql_direct_query(q)

        -- Reset accumulatori
        pc.setqf("hq_pending_total_pts", 0)
        pc.setqf("hq_pending_spendable_pts", 0)
        pc.setqf("hq_pending_daily_pts", 0)
        pc.setqf("hq_pending_weekly_pts", 0)
        pc.setqf("hq_pending_total_kills", 0)
        pc.setqf("hq_pending_daily_kills", 0)
        pc.setqf("hq_pending_weekly_kills", 0)
        pc.setqf("hq_pending_metins", 0)
        pc.setqf("hq_pending_chests", 0)
        pc.setqf("hq_pending_fractures", 0)
    end
    
    -- SEMPRE flush Trial progress (una sola volta)
    hg_lib.flush_trial_progress()
    
    -- Security: Save session snapshot for anomaly detection
    hg_lib.save_session_snapshot()
end

-- ============================================================
-- BATCH TRIAL PROGRESS - Accumula e fluscia ogni 5 minuti
-- Invece di chiamare sp_update_trial_progress ad ogni kill
-- ============================================================
function hg_lib.add_trial_progress(progress_type, amount)
    amount = amount or 1
    local key = "hq_trial_" .. progress_type
    pc.setqf(key, (pc.getqf(key) or 0) + amount)
end

function hg_lib.flush_trial_progress()
    local pid = pc.get_player_id()
    
    -- Leggi accumulatori
    local boss_kills = pc.getqf("hq_trial_boss_kill") or 0
    local metin_kills = pc.getqf("hq_trial_metin_kill") or 0
    local chest_opens = pc.getqf("hq_trial_chest_open") or 0
    local fracture_seals = pc.getqf("hq_trial_fracture_seal") or 0
    
    -- Se nulla da flushare, esci
    if boss_kills == 0 and metin_kills == 0 and chest_opens == 0 and fracture_seals == 0 then
        return
    end
    
    -- UNA sola query batch invece di N chiamate SP
    -- Aggiorna direttamente la tabella hunter_player_trials
    local q = string.format([[
        UPDATE srv1_hunabku.hunter_player_trials 
        SET boss_kills = boss_kills + %d,
            metin_kills = metin_kills + %d,
            chest_opens = chest_opens + %d,
            fracture_seals = fracture_seals + %d
        WHERE player_id = %d AND status = 'in_progress'
    ]], boss_kills, metin_kills, chest_opens, fracture_seals, pid)
    
    mysql_direct_query(q)
    
    -- Reset accumulatori
    pc.setqf("hq_trial_boss_kill", 0)
    pc.setqf("hq_trial_metin_kill", 0)
    pc.setqf("hq_trial_chest_open", 0)
    pc.setqf("hq_trial_fracture_seal", 0)
    
    -- NOTA: Non chiamare check_trial_completion_status qui!
    -- Viene chiamata separatamente da on_fracture_seal e altri punti specifici
end

function hg_lib.add_pending_points(total_pts, daily_pts, weekly_pts)
    total_pts = tonumber(total_pts) or 0
    daily_pts = tonumber(daily_pts) or total_pts
    weekly_pts = tonumber(weekly_pts) or total_pts

    pc.setqf("hq_pending_total_pts", (pc.getqf("hq_pending_total_pts") or 0) + total_pts)
    pc.setqf("hq_pending_spendable_pts", (pc.getqf("hq_pending_spendable_pts") or 0) + total_pts)
    pc.setqf("hq_pending_daily_pts", (pc.getqf("hq_pending_daily_pts") or 0) + daily_pts)
    pc.setqf("hq_pending_weekly_pts", (pc.getqf("hq_pending_weekly_pts") or 0) + weekly_pts)
end

function hg_lib.add_pending_kill()
    pc.setqf("hq_pending_total_kills", (pc.getqf("hq_pending_total_kills") or 0) + 1)
    pc.setqf("hq_pending_daily_kills", (pc.getqf("hq_pending_daily_kills") or 0) + 1)
    pc.setqf("hq_pending_weekly_kills", (pc.getqf("hq_pending_weekly_kills") or 0) + 1)
    
    -- Security: Track kill rate
    hg_lib.track_kill()
end

-- UTILITY TEMPO
function hg_lib.format_time(h, m)
    local hh = tostring(h)
    local mm = tostring(m)
    if tonumber(h) < 10 then hh = "0" .. h end
    if tonumber(m) < 10 then mm = "0" .. m end
    return hh .. ":" .. mm
end

function hg_lib.modulo(a, b)
    return a - math.floor(a / b) * b
end

function hg_lib.get_hour_from_ts(ts)
    local t = os.date("*t", ts)
    return t.hour
end

function hg_lib.get_min_from_ts(ts)
    local t = os.date("*t", ts)
    return t.min
end

function hg_lib.get_sec_from_ts(ts)
    local t = os.date("*t", ts)
    return t.sec
end

function hg_lib.get_dow_from_ts(ts)
    local t = os.date("*t", ts)
    local wday = t.wday - 1 -- Lua wday: 1=Sun, Metin2 usually expects 0=Sun or 0=Mon depending on usage
    return wday
end

function hg_lib.get_day_db_from_ts(ts)
    local t = os.date("*t", ts)
    local wday = t.wday - 1
    if wday == 0 then return 7 end -- DB usa 1-7 (Lun-Dom)
    return wday
end

-- FIX: Utilizzo nativo di os.date per la data odierna
function hg_lib.get_today_date()
    return os.date("%Y-%m-%d")
end

-- ============================================================
-- DUNGEON/MAP UTILITY FUNCTIONS
-- ============================================================

-- Lista dei MAP_INDEX che sono dungeon (da dungeon_info.txt)
-- Queste mappe hanno restrizione rank frattura max C
_G.hunter_dungeon_maps = {
    [7] = true,   -- metin2_map_anglar_dungeon_01
    [12] = true,  -- plechito_easter2023_dungeon
    [13] = true,  -- plechito_wukong_dungeon
    [14] = true,  -- plechito_scorpion_dungeon
    [15] = true,  -- plechito_pirate_ship
    [16] = true,  -- metin2_map_whitedragoncave_boss
    [17] = true,  -- plechito_chamber_of_wisdom
    [18] = true,  -- plechito_demon_dungeon
    [19] = true,  -- plechito_ancient
    [20] = true,  -- plechito_lava_map_01
    [21] = true,  -- plechito_jiangshi_temple_1
    [24] = true,  -- plechito_pirate_ship2
    [25] = true,  -- metin2_map_whitedragoncave_boss2
    [26] = true,  -- map_hunter_elite
    [27] = true,  -- map_hunter_nozzera
    [28] = true,  -- hunter_map/plechito_andun_catacombs
    [29] = true,  -- hunter_map/plechito_skeletondragon_dungeon
    [30] = true,  -- hunter_map/plechito_shadow_deviltower
    [200] = true, -- hunter_map/elite/fear_dungeon
    [201] = true, -- hunter_map/elite/mushroom_dungeon
    [202] = true, -- hunter_map/elite/owl_dungeon
    [203] = true, -- hunter_map/elite/slime_cave
    [204] = true, -- hunter_map/elite/underwater_dungeon
    [205] = true, -- hunter_map/elite/crystal_dungeon
    [206] = true, -- hunter_map/elite/plechito_shadow_deviltower_e
}

-- Nomi mappe per il notice
_G.hunter_map_names = {
    [2] = "Capitale",
    [5] = "Zakatki",
    [6] = "Threeway",
    [7] = "Anglar Dungeon",
    [8] = "Mappa EXP",
    [9] = "Deserto",
    [10] = "Neve",
    [11] = "Natural Map",
    [12] = "Easter Dungeon",
    [13] = "Wukong Dungeon",
    [14] = "Scorpion Dungeon",
    [15] = "Nave Pirata",
    [16] = "Drago Bianco",
    [17] = "Camera Saggezza",
    [18] = "Demon Dungeon",
    [19] = "Ancient",
    [20] = "Lava Map",
    [21] = "Tempio Jiangshi",
    [22] = "Sohan",
    [23] = "Foresta",
    [24] = "Nave Pirata 2",
    [25] = "Drago Bianco 2",
    [26] = "Hunter Elite",
    [27] = "Nozzera",
    [28] = "Catacombe",
    [29] = "Skeleton Dragon",
    [30] = "Shadow Tower",
    [200] = "Fear Dungeon",
    [201] = "Mushroom Dungeon",
    [202] = "Owl Dungeon",
    [203] = "Slime Cave",
    [204] = "Underwater Dungeon",
    [205] = "Crystal Dungeon",
    [206] = "Shadow Tower E",
}

function hg_lib.is_dungeon_map(map_index)
    if not map_index then
        map_index = pc.get_map_index()
    end
    -- Normalizza map_index (rimuovi istanza dungeon: 17001 -> 17)
    local base_map = math.mod(map_index, 10000)
    return _G.hunter_dungeon_maps[base_map] == true
end

function hg_lib.get_map_name(map_index)
    if not map_index then
        map_index = pc.get_map_index()
    end
    local base_map = math.mod(map_index, 10000)
    return _G.hunter_map_names[base_map] or ("Mappa " .. base_map)
end

function hg_lib.get_channel()
    -- Il canale e' dato da: (map_index / 10000) + 1 per istanze
    -- Per mappe normali (map_index < 10000), il canale dipende dal server
    local map_index = pc.get_map_index()
    if map_index >= 10000 then
        -- Istanza dungeon, canale non rilevante
        return 0
    end
    -- Per mappe normali, usa get_server_id() o un altro metodo se disponibile
    -- Fallback: restituisce 1
    return pc.get_channel and pc.get_channel() or 1
end

-- Controlla se il rank e' ammesso nei dungeon (max C)
function hg_lib.is_rank_allowed_in_dungeon(rank_label)
    if not rank_label then return true end
    -- E, D, C sono ammessi nei dungeon
    -- B, A, S, N NON sono ammessi
    local first_char = string.sub(rank_label, 1, 1)
    if first_char == "B" or first_char == "A" or first_char == "S" or first_char == "N" then
        return false
    end
    return true
end

-- ============================================================
-- SECURITY LOG SYSTEM - Anti-Cheat/Exploit Detection
-- ============================================================

-- Severity levels: INFO, WARNING, ALERT, CRITICAL
-- Log types: SPAWN, DEFENSE, REWARD, KILL, FRACTURE, CHEST, GLORY, SUSPICIOUS

function hg_lib.security_log(log_type, severity, action, details)
    local pid = pc.get_player_id()
    local pname = pc.get_name()
    local map_idx = pc.get_map_index()
    local px, py = pc.get_x(), pc.get_y()
    
    -- Escape strings per SQL
    local safe_action = string.gsub(action or "", "'", "''")
    local safe_details = string.gsub(details or "", "'", "''")
    
    local q = string.format(
        "CALL srv1_hunabku.sp_hunter_log(%d, '%s', '%s', '%s', '%s', '%s', %d, %d, %d)",
        pid, pname, log_type, severity, safe_action, safe_details, map_idx, px, py
    )
    mysql_direct_query(q)
end

-- Shortcut functions per comodita
function hg_lib.log_info(log_type, action, details)
    hg_lib.security_log(log_type, "INFO", action, details)
end

function hg_lib.log_warning(log_type, action, details)
    hg_lib.security_log(log_type, "WARNING", action, details)
end

function hg_lib.log_alert(log_type, action, details)
    hg_lib.security_log(log_type, "ALERT", action, details)
end

function hg_lib.log_critical(log_type, action, details)
    hg_lib.security_log(log_type, "CRITICAL", action, details)
end

-- ============================================================
-- KILL RATE MONITORING - Rileva bot/speed hack
-- ============================================================

function hg_lib.init_kill_tracking()
    if not _G.hunter_kill_tracking then
        _G.hunter_kill_tracking = {}
    end
end

function hg_lib.track_kill()
    hg_lib.init_kill_tracking()
    local pid = pc.get_player_id()
    local now = get_time()
    
    if not _G.hunter_kill_tracking[pid] then
        _G.hunter_kill_tracking[pid] = {
            kills = {},
            last_check = now,
            warning_count = 0
        }
    end
    
    local tracker = _G.hunter_kill_tracking[pid]
    
    -- Aggiungi timestamp kill
    table.insert(tracker.kills, now)
    
    -- Mantieni solo ultimi 60 secondi di kill
    local cutoff = now - 60
    local new_kills = {}
    for i = 1, table.getn(tracker.kills) do
        if tracker.kills[i] >= cutoff then
            table.insert(new_kills, tracker.kills[i])
        end
    end
    tracker.kills = new_kills
    
    -- Controlla ogni 30 secondi
    if now - tracker.last_check >= 30 then
        tracker.last_check = now
        local kill_count = table.getn(tracker.kills)
        
        -- Soglie di allarme (kill per minuto)
        -- >80 kill/min = WARNING (possibile bot efficiente)
        -- >120 kill/min = ALERT (molto sospetto)
        -- >200 kill/min = CRITICAL (sicuramente cheat)
        
        if kill_count > 2000 then
            hg_lib.log_critical("SUSPICIOUS", "EXTREME_KILL_RATE", 
                string.format("kills_per_min=%d warning_count=%d", kill_count, tracker.warning_count))
            tracker.warning_count = tracker.warning_count + 1
        elseif kill_count > 1200 then
            hg_lib.log_alert("SUSPICIOUS", "HIGH_KILL_RATE", 
                string.format("kills_per_min=%d warning_count=%d", kill_count, tracker.warning_count))
            tracker.warning_count = tracker.warning_count + 1
        elseif kill_count > 800 then
            hg_lib.log_warning("SUSPICIOUS", "ELEVATED_KILL_RATE", 
                string.format("kills_per_min=%d", kill_count))
        end
        
        -- Se troppe warning consecutive, logga critico
        if tracker.warning_count >= 5 then
            hg_lib.log_critical("SUSPICIOUS", "REPEATED_HIGH_KILL_RATE", 
                string.format("consecutive_warnings=%d", tracker.warning_count))
            tracker.warning_count = 0  -- Reset dopo log critico
        end
    end
end

-- ============================================================
-- REWARD VALIDATION - Rileva exploit ricompense
-- ============================================================

function hg_lib.validate_glory_reward(glory_amount, source, mob_vnum)
    local pid = pc.get_player_id()
    mob_vnum = mob_vnum or 0
    
    -- Limite massimo gloria per singola azione
    local max_single_glory = 5000  -- Massimo ragionevole per singolo evento
    
    if glory_amount > max_single_glory then
        hg_lib.log_alert("REWARD", "EXCESSIVE_GLORY", 
            string.format("amount=%d source=%s mob_vnum=%d max_allowed=%d", 
                glory_amount, source, mob_vnum, max_single_glory))
        return false
    end
    
    -- Traccia gloria totale guadagnata nella sessione
    if not _G.hunter_session_glory then
        _G.hunter_session_glory = {}
    end
    if not _G.hunter_session_glory[pid] then
        _G.hunter_session_glory[pid] = {total = 0, start_time = get_time()}
    end
    
    local session = _G.hunter_session_glory[pid]
    session.total = session.total + glory_amount
    
    -- Se guadagna >50000 gloria in meno di 1 ora, sospetto
    local elapsed = get_time() - session.start_time
    if elapsed > 0 and elapsed < 3600 and session.total > 50000 then
        local glory_per_hour = (session.total / elapsed) * 3600
        hg_lib.log_alert("REWARD", "HIGH_GLORY_RATE", 
            string.format("session_glory=%d elapsed_sec=%d projected_hourly=%d", 
                session.total, elapsed, glory_per_hour))
    end
    
    return true
end

-- ============================================================
-- DEFENSE VALIDATION - Rileva exploit difesa fratture
-- ============================================================

function hg_lib.log_defense_start(fracture_id, rank)
    hg_lib.log_info("DEFENSE", "DEFENSE_STARTED", 
        string.format("fracture_id=%d rank=%s", fracture_id or 0, rank or "?"))
end

function hg_lib.log_defense_complete(fracture_id, rank, success, duration, mobs_killed)
    local severity = "INFO"
    local action = success and "DEFENSE_SUCCESS" or "DEFENSE_FAILED"
    
    -- Se difesa completata troppo velocemente, sospetto
    local expected_duration = hg_lib.get_defense_duration(rank)
    if success and duration < (expected_duration * 0.5) then
        severity = "ALERT"
        action = "DEFENSE_TOO_FAST"
    end
    
    hg_lib.security_log("DEFENSE", severity, action, 
        string.format("fracture_id=%d rank=%s duration=%d expected=%d mobs_killed=%d", 
            fracture_id or 0, rank or "?", duration or 0, expected_duration, mobs_killed or 0))
end

function hg_lib.get_defense_duration(rank)
    rank = hg_lib.validate_rank(rank)
    local durations = {E=60, D=60, C=60, B=90, A=120, S=150, N=180}
    return durations[rank] or 60
end

-- ============================================================
-- SPAWN VALIDATION - Rileva exploit spawn
-- ============================================================

function hg_lib.log_spawn_event(spawn_type, mob_vnum, mob_count, source)
    -- Traccia spawn per sessione
    local pid = pc.get_player_id()
    if not _G.hunter_spawn_tracking then
        _G.hunter_spawn_tracking = {}
    end
    if not _G.hunter_spawn_tracking[pid] then
        _G.hunter_spawn_tracking[pid] = {
            total_spawns = 0,
            start_time = get_time(),
            by_type = {}
        }
    end
    
    local tracker = _G.hunter_spawn_tracking[pid]
    tracker.total_spawns = tracker.total_spawns + 1
    tracker.by_type[spawn_type] = (tracker.by_type[spawn_type] or 0) + 1
    
    -- Log normale
    hg_lib.log_info("SPAWN", "MOB_SPAWNED", 
        string.format("type=%s vnum=%d count=%d source=%s", 
            spawn_type, mob_vnum or 0, mob_count or 1, source or "unknown"))
    
    -- Se troppi spawn in poco tempo, sospetto
    local elapsed = get_time() - tracker.start_time
    if elapsed > 60 and tracker.total_spawns > 50 then
        local spawn_rate = tracker.total_spawns / (elapsed / 60)
        if spawn_rate > 30 then  -- >30 spawn/min = sospetto
            hg_lib.log_warning("SPAWN", "HIGH_SPAWN_RATE", 
                string.format("spawns=%d elapsed=%d rate_per_min=%.1f", 
                    tracker.total_spawns, elapsed, spawn_rate))
        end
    end
end

-- ============================================================
-- CHEST VALIDATION - Rileva exploit chest
-- ============================================================

function hg_lib.log_chest_open(chest_type, reward_glory, reward_items)
    local pid = pc.get_player_id()
    
    -- Traccia aperture chest
    if not _G.hunter_chest_tracking then
        _G.hunter_chest_tracking = {}
    end
    if not _G.hunter_chest_tracking[pid] then
        _G.hunter_chest_tracking[pid] = {
            total = 0,
            start_time = get_time(),
            by_type = {}
        }
    end
    
    local tracker = _G.hunter_chest_tracking[pid]
    tracker.total = tracker.total + 1
    tracker.by_type[chest_type] = (tracker.by_type[chest_type] or 0) + 1
    
    hg_lib.log_info("CHEST", "CHEST_OPENED", 
        string.format("type=%s glory=%d items=%s total_session=%d", 
            chest_type, reward_glory or 0, reward_items or "none", tracker.total))
    
    -- Se apre troppi chest in poco tempo
    local elapsed = get_time() - tracker.start_time
    if elapsed > 0 and tracker.total > 20 then
        local rate = (tracker.total / elapsed) * 3600  -- chest/ora
        if rate > 100 then  -- >100 chest/ora = sospetto
            hg_lib.log_alert("CHEST", "HIGH_CHEST_RATE", 
                string.format("total=%d elapsed=%d rate_per_hour=%.1f", 
                    tracker.total, elapsed, rate))
        end
    end
end

-- ============================================================
-- FRACTURE VALIDATION - Rileva exploit fratture
-- ============================================================

function hg_lib.log_fracture_interaction(fracture_id, action_type, rank)
    hg_lib.log_info("FRACTURE", action_type, 
        string.format("fracture_id=%d rank=%s", fracture_id or 0, rank or "?"))
end

function hg_lib.log_fracture_seal(fracture_id, rank, glory_gained)
    local pid = pc.get_player_id()
    
    -- Traccia sigilli per sessione
    if not _G.hunter_fracture_tracking then
        _G.hunter_fracture_tracking = {}
    end
    if not _G.hunter_fracture_tracking[pid] then
        _G.hunter_fracture_tracking[pid] = {
            seals = 0,
            start_time = get_time(),
            glory_total = 0
        }
    end
    
    local tracker = _G.hunter_fracture_tracking[pid]
    tracker.seals = tracker.seals + 1
    tracker.glory_total = tracker.glory_total + (glory_gained or 0)
    
    hg_lib.log_info("FRACTURE", "FRACTURE_SEALED", 
        string.format("fracture_id=%d rank=%s glory=%d total_seals=%d", 
            fracture_id or 0, rank or "?", glory_gained or 0, tracker.seals))
    
    -- Se sigilla troppe fratture in poco tempo
    local elapsed = get_time() - tracker.start_time
    if elapsed > 0 and elapsed < 3600 and tracker.seals > 10 then
        local rate = (tracker.seals / elapsed) * 3600
        if rate > 20 then  -- >20 fratture/ora = molto sospetto
            hg_lib.log_alert("FRACTURE", "HIGH_SEAL_RATE", 
                string.format("seals=%d elapsed=%d rate_per_hour=%.1f glory_total=%d", 
                    tracker.seals, elapsed, rate, tracker.glory_total))
        end
    end
end

-- ============================================================
-- SESSION SNAPSHOT - Salva statistiche periodiche
-- ============================================================

function hg_lib.save_session_snapshot()
    local pid = pc.get_player_id()
    local pname = pc.get_name()
    
    -- Raccogli statistiche sessione
    local kills = 0
    local glory = 0
    local chests = 0
    local fractures = 0
    local avg_kill_interval = 0
    local min_kill_interval = 999999
    local anomaly_score = 0
    
    -- Kill tracking
    if _G.hunter_kill_tracking and _G.hunter_kill_tracking[pid] then
        local kt = _G.hunter_kill_tracking[pid]
        kills = table.getn(kt.kills)
        
        -- Calcola intervalli tra kill
        if kills > 1 then
            local intervals = {}
            for i = 2, kills do
                local interval = (kt.kills[i] - kt.kills[i-1]) * 1000  -- ms
                table.insert(intervals, interval)
                if interval < min_kill_interval then
                    min_kill_interval = interval
                end
            end
            
            -- Media
            local sum = 0
            for i = 1, table.getn(intervals) do
                sum = sum + intervals[i]
            end
            avg_kill_interval = sum / table.getn(intervals)
        end
        
        -- Anomaly: kill troppo veloci
        if min_kill_interval < 200 then  -- <200ms tra kill = impossibile umano
            anomaly_score = anomaly_score + 50
        elseif min_kill_interval < 500 then
            anomaly_score = anomaly_score + 20
        end
        
        -- Anomaly: warning count
        anomaly_score = anomaly_score + (kt.warning_count * 10)
    end
    
    -- Glory tracking
    if _G.hunter_session_glory and _G.hunter_session_glory[pid] then
        glory = _G.hunter_session_glory[pid].total
    end
    
    -- Chest tracking
    if _G.hunter_chest_tracking and _G.hunter_chest_tracking[pid] then
        chests = _G.hunter_chest_tracking[pid].total
    end
    
    -- Fracture tracking
    if _G.hunter_fracture_tracking and _G.hunter_fracture_tracking[pid] then
        fractures = _G.hunter_fracture_tracking[pid].seals
    end
    
    -- Salva snapshot
    if kills > 0 or glory > 0 or chests > 0 or fractures > 0 then
        local q = string.format(
            "INSERT INTO srv1_hunabku.hunter_player_stats_snapshot " ..
            "(player_id, player_name, snapshot_type, kills_count, glory_earned, chests_opened, " ..
            "fractures_completed, avg_kill_interval_ms, min_kill_interval_ms, anomaly_score) " ..
            "VALUES (%d, '%s', 'SESSION', %d, %d, %d, %d, %d, %d, %d)",
            pid, pname, kills, glory, chests, fractures, 
            avg_kill_interval, min_kill_interval == 999999 and 0 or min_kill_interval, anomaly_score
        )
        mysql_direct_query(q)
        
        -- Se anomaly score alto, logga
        if anomaly_score >= 50 then
            hg_lib.log_alert("SUSPICIOUS", "HIGH_ANOMALY_SCORE", 
                string.format("score=%d kills=%d glory=%d min_interval_ms=%d", 
                    anomaly_score, kills, glory, min_kill_interval))
        end
    end
end

-- LOGICA RANKING
function hg_lib.get_rank_letter(rank_num)
    local letters = {"E", "D", "C", "B", "A", "S", "N"}
    return letters[rank_num + 1] or "E"
end

function hg_lib.get_rank_index(points)
    local N = tonumber(hg_lib.get_config("rank_threshold_N")) or 1500000
    local S = tonumber(hg_lib.get_config("rank_threshold_S")) or 500000
    local A = tonumber(hg_lib.get_config("rank_threshold_A")) or 150000
    local B = tonumber(hg_lib.get_config("rank_threshold_B")) or 50000
    local C = tonumber(hg_lib.get_config("rank_threshold_C")) or 10000
    local D = tonumber(hg_lib.get_config("rank_threshold_D")) or 2000

    if points >= N then return 6
    elseif points >= S then return 5
    elseif points >= A then return 4
    elseif points >= B then return 3
    elseif points >= C then return 2
    elseif points >= D then return 1
    else return 0 end
end

function hg_lib.get_rank_index_by_letter(letter)
    -- Supporta sia "S" che "S-Rank"
    local ranks = {
        E = 0, D = 1, C = 2, B = 3, A = 4, S = 5, N = 6,
        ["E-Rank"] = 0, ["D-Rank"] = 1, ["C-Rank"] = 2, ["B-Rank"] = 3, 
        ["A-Rank"] = 4, ["S-Rank"] = 5, ["N-Rank"] = 6
    }
    return ranks[letter] or 0
end

-- COMUNICAZIONE CLIENT
function hg_lib.hunter_speak(msg)
    if msg == nil then return end
    local rank_num = pc.getqf("hq_rank_num")
    if not rank_num or rank_num == 0 then
        -- PERFORMANCE: Usa qf invece di query
        local pts = pc.getqf("hq_total_points") or 0
        rank_num = hg_lib.get_rank_index(pts)
        pc.setqf("hq_rank_num", rank_num)
    end
    local rank_key = hg_lib.get_rank_letter(rank_num)
    cmdchat("HunterSystemSpeak " .. rank_key .. "|" .. hg_lib.clean_str(msg))
end

function hg_lib.hunter_speak_color(msg, color_code)
    if msg == nil then return end
    cmdchat("HunterSystemSpeak " .. (color_code or "BLUE") .. "|" .. hg_lib.clean_str(msg))
end

-- Helper per syschat tradotto con colore
function hg_lib.syschat_t(key, fallback, replacements, color)
    local txt = hg_lib.get_text(key, replacements, fallback)
    if txt then
        if color then
            syschat("|cff" .. color .. txt .. "|r")
        else
            syschat(txt)
        end
    end
end

-- Helper per notice_all tradotto
function hg_lib.notice_t(key, fallback, replacements)
    local txt = hg_lib.get_text(key, replacements, fallback)
    if txt then
        notice_all(txt)
    end
end

-- SISTEMA EMERGENZE
function hg_lib.start_emergency(title, seconds, mob_vnum, count)
    local expire_time = get_time() + seconds
    
    -- Setta flag su TUTTI i membri del party (o solo player se solo)
    if party.is_party() then
        local pids = {party.get_member_pids()}
        for i, member_pid in ipairs(pids) do
            q.begin_other_pc_block(member_pid)
            pc.setqf("hq_emerg_active", 1)
            pc.setqf("hq_emerg_vnum", mob_vnum)
            pc.setqf("hq_emerg_req", count)
            pc.setqf("hq_emerg_cur", 0)
            pc.setqf("hq_emerg_expire", expire_time)
            q.end_other_pc_block()
        end
    else
        pc.setqf("hq_emerg_active", 1)
        pc.setqf("hq_emerg_vnum", mob_vnum)
        pc.setqf("hq_emerg_req", count)
        pc.setqf("hq_emerg_cur", 0)
        pc.setqf("hq_emerg_expire", expire_time)
    end
    
    -- Invia UI a TUTTI i membri del party
    hg_lib.party_cmdchat("HunterEmergency " .. hg_lib.clean_str(title) .. "|" .. seconds .. "|" .. mob_vnum .. "|" .. count)
    cleartimer("hunter_emerg_tmr")
    loop_timer("hunter_emerg_tmr", 1)
end

function hg_lib.update_emergency(current_count)
    hg_lib.party_cmdchat("HunterEmergencyUpdate " .. current_count)
end

function hg_lib.end_emergency(status)
    if pc.getqf("hq_emerg_active") == 0 then return end

    -- Pulisci flag su TUTTI i membri del party
    if party.is_party() then
        local pids = {party.get_member_pids()}
        for i, member_pid in ipairs(pids) do
            q.begin_other_pc_block(member_pid)
            pc.setqf("hq_emerg_active", 0)
            pc.setqf("hq_emerg_vnum", 0)
            pc.setqf("hq_emerg_req", 0)
            pc.setqf("hq_emerg_cur", 0)
            pc.setqf("hq_emerg_expire", 0)
            pc.setqf("hq_emerg_reward_pts", 0)
            pc.setqf("hq_emerg_reward_vnum", 0)
            pc.setqf("hq_emerg_reward_count", 0)
            pc.setqf("hq_speedkill_active", 0)
            pc.setqf("hq_speedkill_vnum", 0)
            q.end_other_pc_block()
        end
    else
        pc.setqf("hq_emerg_active", 0)
        pc.setqf("hq_speedkill_active", 0)
    end
    
    cleartimer("hunter_emerg_tmr")
    cleartimer("hq_speedkill_timer")

    local s_str = "FAIL"
    if status == "SUCCESS" then s_str = "SUCCESS" end
    
    -- Invia chiusura UI a TUTTI i membri del party
    hg_lib.party_cmdchat("HunterEmergencyClose " .. s_str)

    if status == "SUCCESS" then
        local bonus_pts = pc.getqf("hq_emerg_reward_pts") or 0
        local reward_vnum = pc.getqf("hq_emerg_reward_vnum") or 0
        local reward_count = pc.getqf("hq_emerg_reward_count") or 0

        if bonus_pts > 0 then
            mysql_direct_query("UPDATE srv1_hunabku.hunter_quest_ranking SET total_points=total_points+"..bonus_pts..", spendable_points=spendable_points+"..bonus_pts.." WHERE player_id="..pc.get_player_id())

            -- === SYSCHAT DETTAGLIATO EMERGENCY ===
            syschat("|cffFF6600========================================|r")
            hg_lib.syschat_t("EMERG_COMPLETED_TITLE", "[!!!] SFIDA EMERGENZA COMPLETATA [!!!]", nil, "FF6600")
            syschat("|cffFF6600========================================|r")
            syschat("")
            hg_lib.syschat_t("EMERG_REWARD", "Gloria Ricompensa: +{PTS}", {PTS = bonus_pts}, "FFD700")
            syschat("")
            hg_lib.syschat_t("EMERG_TOTAL", ">>> TOTALE: +{PTS} Gloria <<<", {PTS = bonus_pts}, "00FF00")
            syschat("|cffFF6600========================================|r")
            -- ======================================

            local msg = hg_lib.get_text("EMERG_VICTORY_MSG", {PTS = bonus_pts}, "[VITTORIA] SFIDA SUPERATA! +" .. bonus_pts .. " GLORIA EXTRA")
            hg_lib.hunter_speak_color(msg, "GOLD")
        else
            local msg = hg_lib.get_text("EMERG_COMPLETED", nil, "SFIDA COMPLETATA!")
            hg_lib.hunter_speak(msg)
        end

        if reward_vnum > 0 and reward_count > 0 then
            pc.give_item2(reward_vnum, reward_count)
            local msg = "BONUS OGGETTO: " .. hg_lib.item_name(reward_vnum) .. " x" .. reward_count
            hg_lib.hunter_speak(msg)
        end

        hg_lib.send_player_data()
    else
        local msg = "[!] TEMPO SCADUTO: Bonus Velocita' perso."
        hg_lib.hunter_speak_color(msg, "ORANGE")
    end

    pc.setqf("hq_emerg_reward_pts", 0)
    pc.setqf("hq_emerg_reward_vnum", 0)
    pc.setqf("hq_emerg_reward_count", 0)
    pc.setqf("hq_emerg_vnum", 0)
end

-- FIX: Cooldown per notifiche rival (evita spam ogni pochi secondi)
-- Cooldown di 5 minuti (300 secondi) tra una notifica e l'altra per lo stesso tipo
function hg_lib.notify_rival(name, points, label)
    local pid = pc.get_player_id()
    local cooldown_key = "hq_rival_cooldown_" .. label:gsub("%s+", "_")
    local last_notify = pc.getqf(cooldown_key) or 0
    local now = get_time()
    local cooldown_duration = 300  -- 5 minuti
    
    -- Se il cooldown non è scaduto, non inviare notifica
    if now - last_notify < cooldown_duration then
        return
    end
    
    -- Aggiorna timestamp ultimo notify
    pc.setqf(cooldown_key, now)
    
    -- Invia notifica
    cmdchat("HunterRivalAlert " .. hg_lib.clean_str(name) .. "|" .. points .. "|" .. hg_lib.clean_str(label))
end

function hg_lib.ask_choice_color(qid, text, opt1, opt2, opt3, color_code)
    local cmd = "HunterWhatIf " .. qid .. "|" .. hg_lib.clean_str(text) .. "|" .. hg_lib.clean_str(opt1) .. "|" .. hg_lib.clean_str(opt2)
    local o3_str = ""
    if opt3 and opt3 ~= "" then
        o3_str = hg_lib.clean_str(opt3)
    end
    cmd = cmd .. "|" .. o3_str
    cmd = cmd .. "|" .. color_code
    cmdchat(cmd)
end

-- ============================================================
-- CONFIG CACHE SYSTEM - Evita query ripetute per configurazioni statiche
-- Cache caricata una volta al login, valida per tutta la sessione
-- ============================================================
_G.hunter_config_cache = nil
_G.hunter_config_cache_time = 0
_G.hunter_rank_bonus_cache = nil

function hg_lib.load_config_cache()
    -- Ricarica solo se la cache è vuota o più vecchia di 10 minuti
    local now = get_time()
    if _G.hunter_config_cache and (now - _G.hunter_config_cache_time < 600) then
        return
    end
    
    _G.hunter_config_cache = {}
    _G.hunter_config_cache_time = now
    
    local c, d = mysql_direct_query("SELECT config_key, config_value FROM srv1_hunabku.hunter_quest_config")
    if c > 0 then
        for i = 1, c do
            local key = d[i].config_key
            local val = tonumber(d[i].config_value) or 0
            _G.hunter_config_cache[key] = val
        end
    end
    
    -- Carica anche i bonus rank in cache
    _G.hunter_rank_bonus_cache = {}
    local rc, rd = mysql_direct_query("SELECT min_points, bonus_gloria FROM srv1_hunabku.hunter_ranks ORDER BY min_points DESC")
    if rc > 0 then
        for i = 1, rc do
            table.insert(_G.hunter_rank_bonus_cache, {
                min_points = tonumber(rd[i].min_points) or 0,
                bonus = tonumber(rd[i].bonus_gloria) or 0
            })
        end
    end
end

-- CONFIG & DB HELPERS (OTTIMIZZATO CON CACHE)
function hg_lib.get_config(key)
    -- Prima controlla la cache
    if _G.hunter_config_cache and _G.hunter_config_cache[key] then
        return _G.hunter_config_cache[key]
    end
    
    -- Fallback a query diretta (solo se cache non disponibile)
    local q = "SELECT config_value FROM srv1_hunabku.hunter_quest_config WHERE config_key='" .. key .. "' LIMIT 1"
    local c, d = mysql_direct_query(q)
    if c > 0 and d[1] then 
        local val = tonumber(d[1].config_value) or 0
        -- Salva in cache per prossime chiamate
        if not _G.hunter_config_cache then _G.hunter_config_cache = {} end
        _G.hunter_config_cache[key] = val
        return val
    end
    return 0
end

function hg_lib.get_rank_bonus(points)
    -- Usa cache se disponibile
    if _G.hunter_rank_bonus_cache then
        for i, rank in ipairs(_G.hunter_rank_bonus_cache) do
            if points >= rank.min_points then
                return rank.bonus
            end
        end
        return 0
    end
    
    -- Fallback a query diretta
    local q = "SELECT bonus_gloria FROM srv1_hunabku.hunter_ranks WHERE min_points <= " .. points .. " ORDER BY min_points DESC LIMIT 1"
    local c, d = mysql_direct_query(q)
    if c > 0 and d[1] then
        return tonumber(d[1].bonus_gloria) or 0
    end
    return 0
end

function hg_lib.get_trial_gloria_multiplier()
    local pid = pc.get_player_id()
    local q = "SELECT COUNT(*) as cnt FROM srv1_hunabku.hunter_player_trials WHERE player_id=" .. pid .. " AND status='in_progress' LIMIT 1"
    local c, d = mysql_direct_query(q)
    if c > 0 and d[1] and tonumber(d[1].cnt) > 0 then
        return 0.5
    end
    return 1.0
end

function hg_lib.get_streak_message(day_number)
    local q = "SELECT message_text FROM srv1_hunabku.hunter_login_messages WHERE day_number = " .. day_number .. " LIMIT 1"
    local c, d = mysql_direct_query(q)
    if c > 0 and d[1] then
        local msg = d[1].message_text
        if msg then return string.gsub(msg, "_", " ") end
    end
    q = "SELECT message_text FROM srv1_hunabku.hunter_login_messages WHERE day_number <= " .. day_number .. " ORDER BY day_number DESC LIMIT 1"
    c, d = mysql_direct_query(q)
    if c > 0 and d[1] then
        local msg = d[1].message_text
        if msg then return string.gsub(msg, "_", " ") end
    end
    return nil
end

-- SISTEMA TRADUZIONI MULTILINGUA SERVER-SIDE
-- Cerca prima nella lingua del player, poi fallback italiano, poi fallback esplicito
function hg_lib.get_text(key, replacements, fallback)
    local lang = hg_lib.get_player_lang()
    local txt = nil
    
    -- 1. Cerca nella lingua del player
    if hg_lib.translations[lang] and hg_lib.translations[lang][key] then
        txt = hg_lib.translations[lang][key]
    -- 2. Fallback italiano
    elseif hg_lib.translations["it"] and hg_lib.translations["it"][key] then
        txt = hg_lib.translations["it"][key]
    -- 3. Fallback esplicito passato come parametro
    elseif fallback then
        txt = fallback
    end
    
    -- Applica replacements se presenti
    if txt and replacements then
        for k, v in pairs(replacements) do
            txt = string.gsub(txt, "{" .. k .. "}", tostring(v))
        end
    end
    
    return txt
end

-- Versione colorata di get_text
function hg_lib.get_text_colored(key, replacements, fallback, default_color)
    local txt = hg_lib.get_text(key, replacements, fallback)
    local color = default_color or "FFFFFF"
    
    if not txt then
        txt = fallback or key
    end

    -- Applica replacements se presenti e non ancora applicati
    if txt and replacements then
        for k, v in pairs(replacements) do
            txt = string.gsub(txt, "{" .. k .. "}", tostring(v))
        end
    end
    
    -- Applica colore
    if txt then
        return "|cff" .. color .. txt .. "|r"
    end
    return nil
end

function hg_lib.get_fracture_voice(color_code, has_points)
    local key = "fracture_voice_" .. (has_points and "ok_" or "no_") .. color_code
    local txt = hg_lib.get_text(key)
    if txt then return txt end
    if has_points then
        return "Il portale si apre davanti a te..."
    else
        return "Non sei ancora degno."
    end
end

-- ============================================================
-- POWER RANK SYSTEM - Sistema punti potere per fratture avanzate
-- ============================================================
-- Punti potere per grado Hunter
hg_lib.POWER_RANK_VALUES = {
    ["E"] = 1,   ["E-Rank"] = 1,
    ["D"] = 5,   ["D-Rank"] = 5,
    ["C"] = 15,  ["C-Rank"] = 15,
    ["B"] = 40,  ["B-Rank"] = 40,
    ["A"] = 80,  ["A-Rank"] = 80,
    ["S"] = 150, ["S-Rank"] = 150,
    ["N"] = 250, ["N-Rank"] = 250
}

-- Requisiti Power Rank letti dal database (colonna force_power_rank)
-- Se force_power_rank = 0 -> usa sistema classico Party 4+
-- Se force_power_rank > 0 -> usa sistema Power Rank

-- Ottiene i dati completi di una frattura dal DB
function hg_lib.get_fracture_data(fracture_vnum)
    local q = "SELECT req_points, force_power_rank FROM srv1_hunabku.hunter_quest_fractures WHERE vnum=" .. fracture_vnum
    local c, d = mysql_direct_query(q)
    if c > 0 and d[1] then
        return {
            req_points = tonumber(d[1].req_points) or 0,
            force_power_rank = tonumber(d[1].force_power_rank) or 0
        }
    end
    return { req_points = 0, force_power_rank = 0 }
end

-- Ottiene il requisito Power Rank per una frattura dal DB
function hg_lib.get_fracture_power_rank_req(fracture_vnum)
    local data = hg_lib.get_fracture_data(fracture_vnum)
    return data.force_power_rank
end

-- Ottiene il grado Hunter di un player dato il player_id
-- Legge direttamente dalla colonna hunter_rank della tabella hunter_quest_ranking
function hg_lib.get_player_rank_grade(player_id)
    local q = "SELECT hunter_rank FROM srv1_hunabku.hunter_quest_ranking WHERE player_id = " .. player_id
    local c, d = mysql_direct_query(q)
    if c > 0 and d[1] then
        local rank = d[1].hunter_rank or "E"
        -- Se il rank e' nel formato "X-Rank", estrai solo la lettera
        if string.len(rank) > 1 then
            local letter = string.match(rank, "^(%a)")
            return letter or "E"
        end
        return rank
    end
    return "E"
end

-- Calcola il Power Rank di un singolo player
function hg_lib.get_player_power_rank(player_id)
    local grade = hg_lib.get_player_rank_grade(player_id)
    return hg_lib.POWER_RANK_VALUES[grade] or 1
end

-- Calcola il Power Rank totale del party
-- NOTA: Semplificato - ritorna solo i dati del player corrente
-- perche' party.for_each_member non e' disponibile su tutti i server
function hg_lib.get_party_power_rank()
    local pid = pc.get_player_id()
    local my_power = hg_lib.get_player_power_rank(pid)
    local my_grade = hg_lib.get_player_rank_grade(pid)
    
    if not party.is_party() then
        return my_power, {{name = pc.get_name(), grade = my_grade, power = my_power}}
    end
    
    -- In party: moltiplica per numero membri (stima)
    local member_count = party.get_near_count()
    if member_count < 1 then member_count = 1 end
    
    -- Stima power totale basata sul player corrente
    local estimated_total = my_power * member_count
    
    return estimated_total, {{name = pc.get_name(), grade = my_grade, power = my_power}}
end

-- ============================================================
-- SISTEMA DISTRIBUZIONE GLORIA PER MERITOCRAZIA (PARTY)
-- NOTA: Semplificato per compatibilita' - ogni player riceve per se'
-- ============================================================

-- Calcola la percentuale di Gloria (semplificato: 100% al chiamante)
function hg_lib.calculate_party_glory_shares()
    local pid = pc.get_player_id()
    return {{
        pid = pid,
        name = pc.get_name(),
        grade = hg_lib.get_player_rank_grade(pid),
        power = hg_lib.get_player_power_rank(pid),
        share = 100
    }}
end

-- Distribuisce la Gloria a tutti i membri del party secondo la meritocrazia
-- Ogni membro riceve la sua % e applica i propri bonus/malus personali
function hg_lib.distribute_party_glory(base_glory, source_type)
    local shares = hg_lib.calculate_party_glory_shares()
    local distribution_log = {}
    
    for i = 1, table.getn(shares) do
        local member = shares[i]
        local pid = member.pid
        local share_percent = member.share
        
        -- Calcola la Gloria base per questo membro
        local member_base_glory = math.floor(base_glory * share_percent / 100)
        
        -- Minimo 1 punto se partecipa
        if member_base_glory < 1 and share_percent > 0 then
            member_base_glory = 1
        end
        
        -- Ora applica i bonus/malus PERSONALI di ogni membro
        local final_glory = hg_lib.apply_personal_glory_modifiers(pid, member_base_glory)
        
        -- Salva i punti per questo membro
        if final_glory > 0 then
            hg_lib.award_glory_to_player(pid, final_glory)
            
            table.insert(distribution_log, {
                name = member.name,
                grade = member.grade,
                share = share_percent,
                base = member_base_glory,
                final = final_glory
            })
        end
    end
    
    return distribution_log
end

-- ============================================================
-- FUNZIONE UNIFICATA CALCOLO MODIFICATORI GLORIA
-- Centralizza TUTTA la logica dei bonus/malus in un unico punto
-- Ritorna: final_glory, modifier_log (per syschat dettagliato)
-- ============================================================
function hg_lib.calculate_glory_with_modifiers(base_glory, options)
    options = options or {}
    local pid = options.player_id or pc.get_player_id()
    local consume_focus = (options.consume_focus ~= false)  -- Default: consuma
    local register_event = (options.register_event ~= false)  -- Default: registra

    local final_glory = base_glory
    local modifier_log = {}

    -- 1. STREAK BONUS (login consecutivi)
    local streak_bonus = pc.getqf("hq_streak_bonus") or 0
    if streak_bonus > 0 then
        local streak_add = math.floor(final_glory * streak_bonus / 100)
        final_glory = final_glory + streak_add
        table.insert(modifier_log, {name = "Streak Bonus", value = "+" .. streak_bonus .. "%", add = streak_add})
    end

    -- 2. RANK BONUS (rank alto = bonus extra)
    local player_pts = pc.getqf("hq_total_points") or 0
    local rank_bonus = hg_lib.get_rank_bonus(player_pts)
    if rank_bonus > 0 then
        local rank_add = math.floor(final_glory * rank_bonus / 100)
        final_glory = final_glory + rank_add
        table.insert(modifier_log, {name = "Rank Bonus", value = "+" .. rank_bonus .. "%", add = rank_add})
    end

    -- 3. FOCUS HUNTER (+20%)
    local has_focus = game.get_event_flag("hq_hunter_focus_"..pid) or 0
    if has_focus == 1 then
        local focus_add = math.floor(final_glory * 0.20)
        final_glory = final_glory + focus_add
        if consume_focus then
            game.set_event_flag("hq_hunter_focus_"..pid, 0)  -- Consuma il buff
        end
        table.insert(modifier_log, {name = "Focus Hunter", value = "+20%", add = focus_add})
    end

    -- 4. FRACTURE BONUS (+50% se missioni complete)
    if hg_lib.has_fracture_bonus() then
        local frac_add = math.floor(final_glory * 0.50)
        final_glory = final_glory + frac_add
        table.insert(modifier_log, {name = "Bonus Missioni", value = "+50%", add = frac_add})
    end

    -- 5. EVENTO ATTIVO (moltiplicatore evento)
    local evt_name, evt_mult, evt_type = hg_lib.get_active_event()
    if evt_type == "points" and evt_mult ~= 1.0 then
        local before_evt = final_glory
        final_glory = math.floor(final_glory * evt_mult)
        local evt_diff = final_glory - before_evt
        table.insert(modifier_log, {name = "Evento " .. (evt_name or ""), value = "x" .. evt_mult, add = evt_diff})
        -- Registra partecipazione all'evento
        if register_event then
            hg_lib.register_event_participant()
        end
    end

    -- 6. TRIAL MALUS (-50% se ha una prova attiva) - SEMPRE PER ULTIMO
    local trial_mult = hg_lib.get_trial_gloria_multiplier()
    if trial_mult < 1.0 then
        local before_trial = final_glory
        final_glory = math.floor(final_glory * trial_mult)
        local trial_sub = before_trial - final_glory
        table.insert(modifier_log, {name = "Prova Esame", value = "-50%", add = -trial_sub})
    end

    return final_glory, modifier_log
end

-- Mostra syschat dettagliato dei modificatori gloria
function hg_lib.show_glory_details(source_type, source_name, base_glory, final_glory, modifier_log)
    hg_lib.syschat_t("GLORY_DETAIL_HEADER", "========== DETTAGLIO GLORIA =========", nil, "888888")
    syschat("|cffFFFFFF" .. source_type .. ": |r|cffFFD700" .. source_name .. "|r")
    syschat("|cffAAAAAA" .. hg_lib.get_text("GLORY_BASE", nil, "Gloria Base") .. ": |r|cffFFFFFF" .. base_glory .. "|r")
    for i = 1, table.getn(modifier_log) do
        local m = modifier_log[i]
        local color = m.add >= 0 and "|cff00FF00" or "|cffFF4444"
        local sign = m.add >= 0 and "+" or ""
        syschat("|cffAAAAAA" .. m.name .. " (" .. m.value .. "): |r" .. color .. sign .. m.add .. "|r")
    end
    syschat("|cffFFD700>>> " .. hg_lib.get_text("TOTAL", nil, "TOTALE") .. ": +" .. final_glory .. " " .. hg_lib.get_text("GLORY", nil, "Gloria") .. " <<<|r")
    hg_lib.syschat_t("GLORY_DETAIL_FOOTER", "======================================", nil, "888888")
end

-- Applica i modificatori personali di Gloria (wrapper per compatibilita')
-- NOTA: Questa funzione viene chiamata nel contesto del player (pc.*)
function hg_lib.apply_personal_glory_modifiers(player_id, base_glory)
    local final_glory, _ = hg_lib.calculate_glory_with_modifiers(base_glory, {player_id = player_id})
    return final_glory
end

-- Assegna Gloria a un player specifico (senza bonus, solo accumulo)
function hg_lib.award_glory_to_player(player_id, glory_amount)
    if glory_amount <= 0 then return end
    
    -- Security: Validate glory amount
    if not hg_lib.validate_glory_reward(glory_amount, "award_glory", 0) then
        hg_lib.log_alert("REWARD", "GLORY_BLOCKED", 
            string.format("player_id=%d amount=%d blocked=true", player_id, glory_amount))
        return  -- Blocca reward sospetto
    end
    
    -- Aggiorna DB direttamente per il player
    mysql_direct_query(string.format(
        "UPDATE srv1_hunabku.hunter_quest_ranking SET total_points = total_points + %d, spendable_points = spendable_points + %d, daily_points = daily_points + %d, weekly_points = weekly_points + %d WHERE player_id = %d",
        glory_amount, glory_amount, glory_amount, glory_amount, player_id
    ))
end

-- Notifica tutti i membri del party della distribuzione Gloria
-- NOTA: Semplificato - notifica solo il player corrente
function hg_lib.notify_party_glory_distribution(distribution_log, total_glory, source_name)
    if table.getn(distribution_log) <= 1 then return end  -- Solo, no notifica
    
    local msg_parts = {}
    for i = 1, table.getn(distribution_log) do
        local m = distribution_log[i]
        table.insert(msg_parts, m.name .. "(" .. m.grade .. "):" .. m.final)
    end
    
    local msg = "[PARTY] " .. source_name .. " - Gloria divisa: " .. table.concat(msg_parts, ", ")
    
    -- Notifica al player corrente
    syschat("|cff00FFFF" .. msg .. "|r")
    
    -- Manda anche al client per effetti
    cmdchat("HunterPartyGloryDist " .. total_glory .. "|" .. table.getn(distribution_log))
end

-- ============================================================
-- DISTRIBUZIONE GLORIA ELITE CON MERITOCRAZIA
-- NOTA: Semplificato - tutta la gloria va al killer
-- OTTIMIZZATO: Usa calculate_glory_with_modifiers centralizzata
-- ============================================================
function hg_lib.distribute_party_glory_elite(base_glory, mob_info)
    local pid = pc.get_player_id()
    local pname = pc.get_name()
    local grade = hg_lib.get_player_rank_grade(pid)
    local power = hg_lib.POWER_RANK_VALUES[grade] or 1

    -- USA FUNZIONE CENTRALIZZATA per calcolo modificatori
    local final_glory, modifier_log = hg_lib.calculate_glory_with_modifiers(base_glory, {player_id = pid})

    -- Assegna gloria al killer
    if final_glory > 0 then
        hg_lib.award_glory_to_player(pid, final_glory)
    end

    -- Mostra syschat dettagliato
    local mob_name = (mob_info and mob_info.name) or "Elite"
    local type_name = (mob_info and mob_info.type_name) or "ELITE"
    hg_lib.show_glory_details(type_name, mob_name, base_glory, final_glory, modifier_log)
    
    -- Log per notifica
    local distribution_log = {{
        name = pname,
        grade = grade,
        power = power,
        share = 100,
        base = base_glory,
        final = final_glory
    }}
    
    -- Notifica
    syschat("|cffFFD700[ELITE]|r " .. mob_name .. " - |cffFFD700+" .. final_glory .. " " .. hg_lib.get_text("GLORY", nil, "Gloria") .. "|r")

    return distribution_log
end

-- Notifica speciale per distribuzione meritocratica
function hg_lib.notify_party_glory_meritocracy(distribution_log, total_glory, source_name)
    -- Costruisci messaggio dettagliato
    local killed_txt = hg_lib.get_text("KILLED", nil, "ucciso")
    local total_txt = hg_lib.get_text("TOTAL", nil, "Totale")
    local msg_header = "|cffFFD700[PARTY " .. hg_lib.get_text("GLORY", nil, "GLORIA") .. "]|r " .. source_name .. " " .. killed_txt .. "! " .. total_txt .. ": " .. total_glory

    syschat(msg_header)
    hg_lib.syschat_t("MERITOCRACY_DIST", "--- Distribuzione per Meritocrazia (Power Rank) ---", nil, "00FFFF")
    
    -- Per ogni membro, mostra la sua quota
    for i = 1, table.getn(distribution_log) do
        local m = distribution_log[i]
        local detail = string.format("|cff00FF00%s|r [%s] PR:%d (%d%%) = |cffFFD700+%d Gloria|r",
            m.name, m.grade, m.power, m.share, m.final)
        
        syschat(detail)
    end
    
    -- Effetto client
    cmdchat("HunterPartyMeritGlory " .. total_glory .. "|" .. table.getn(distribution_log))
end

-- ============================================================
-- FINE SISTEMA DISTRIBUZIONE GLORIA
-- ============================================================

-- Verifica se il party puo' forzare una frattura
function hg_lib.can_force_fracture(fracture_vnum)
    local required = hg_lib.get_fracture_power_rank_req(fracture_vnum)
    
    -- Se non definito o 0, usa sistema classico (party 4+)
    if not required or required == 0 then
        return party.is_party() and party.get_near_count() >= 4, "CLASSIC", 0, 0, nil
    end
    
    -- Sistema Power Rank
    local total_power, members = hg_lib.get_party_power_rank()
    return total_power >= required, "POWER_RANK", total_power, required, members
end

-- Ottiene la descrizione del requisito per una frattura
function hg_lib.get_fracture_requirement_text(fracture_vnum)
    local required = hg_lib.get_fracture_power_rank_req(fracture_vnum)
    
    if not required or required == 0 then
        return "Party di 4+ membri", "CLASSIC"
    end
    
    return "Power Rank: " .. required .. " punti", "POWER_RANK"
end

-- ============================================================
-- OTTIMIZZAZIONE item_name - Cache nomi item
-- ============================================================
_G.hunter_item_name_cache = {}

function hg_lib.item_name(vnum)
    if not vnum or vnum == 0 then
        return "Oggetto Sconosciuto"
    end
    
    -- PERFORMANCE: Check cache prima
    if _G.hunter_item_name_cache[vnum] then
        return _G.hunter_item_name_cache[vnum]
    end
    
    -- Prima prova dalla tabella hunter personalizzata (nomi italiani)
    local c, d = mysql_direct_query("SELECT name FROM srv1_hunabku.hunter_item_names WHERE vnum=" .. vnum)
    if c > 0 and d[1] and d[1].name then
        _G.hunter_item_name_cache[vnum] = d[1].name
        return d[1].name
    end
    
    -- Dizionario locale per item comuni Hunter
    local hunter_items = {
        [63000] = "Baule Rango E",
        [63001] = "Baule Rango D",
        [63002] = "Baule Rango C",
        [63003] = "Baule Rango B",
        [63004] = "Baule Rango A",
        [63005] = "Baule Rango S",
        [63006] = "Baule Rango ???",
        [63007] = "Baule Speciale",
        [63010] = "Scanner Frattura",
        [63011] = "Focus del Cacciatore",
        [63012] = "Chiave Dimensionale",
        [63013] = "Calibratore Fratture",
        [63014] = "Stabilizzatore Portale",
        [63015] = "Amuleto Risonanza",
        [63020] = "Buono Gloria",
        [63021] = "Buono Gloria x3",
        [63022] = "Buono Gloria x5",
        [63030] = "Frammento di Monarca",
        [63031] = "Essenza Ombra",
        [63032] = "Cristallo Dimensionale",
    }
    
    if hunter_items[vnum] then
        _G.hunter_item_name_cache[vnum] = hunter_items[vnum]  -- Cache anche i locali
        return hunter_items[vnum]
    end
    
    local name = "Item_" .. vnum
    _G.hunter_item_name_cache[vnum] = name  -- Cache anche i fallback
    return name
end

-- EVENTI PROGRAMMATI
function hg_lib.get_active_event()
    local event = hg_lib.get_current_scheduled_event()
        
    if event then
        local name = event.event_name or "Evento"
        local etype = event.event_type or "glory_rush"
        local glory = tonumber(event.reward_glory_base) or 50
        local desc = event.event_desc or ""
            
        local mult = 1.0
        local apply_to = "points"
            
        if etype == "glory_rush" then
            mult = 2.0
            apply_to = "points"
            desc = "Gloria x2"
        elseif etype == "first_rift" or etype == "rift_hunt" then
            mult = 1.5
            apply_to = "chance"
            desc = "Fratture +50"
        elseif etype == "double_spawn" then
            mult = 2.0
            apply_to = "chance"
            desc = "Spawn x2"
        elseif etype == "super_metin" or etype == "metin_frenzy" then
            mult = 1.5
            apply_to = "chance"
            desc = "Metin +50"
        elseif etype == "first_boss" or etype == "boss_massacre" then
            mult = 1.5
            apply_to = "points"
            desc = "Boss Glory +50"
        end
            
        return name, mult, apply_to, desc
    end
        
    return nil, 1.0, nil, nil
end

function hg_lib.get_current_scheduled_event()
    local t = os.date("*t")
    local wday = t.wday - 1
    local day_db = wday
    if wday == 0 then day_db = 7 end
        
    local current_hour = t.hour
    local current_minute = t.min
    local current_total = current_hour * 60 + current_minute
        
    local q = "SELECT id, event_name, event_type, event_desc, start_hour, start_minute, duration_minutes, min_rank, reward_glory_base, reward_glory_winner, color_scheme FROM srv1_hunabku.hunter_scheduled_events WHERE enabled=1 AND FIND_IN_SET(" .. day_db .. ", days_active) > 0 ORDER BY start_hour, start_minute"
        
    local c, d = mysql_direct_query(q)
        
    if c > 0 then
        for i = 1, c do
            local e = d[i]
            local start_hour = tonumber(e.start_hour) or 0
            local start_minute = tonumber(e.start_minute) or 0
            local duration = tonumber(e.duration_minutes) or 30
                
            local start_total = start_hour * 60 + start_minute
            local end_total = start_total + duration
                
            if current_total >= start_total and current_total < end_total then
                return e
            end
        end
    end
        
    return nil
end

-- SISTEMA SORTEGGIO EVENTO
function hg_lib.register_event_participant()
    local event = hg_lib.get_current_scheduled_event()
    if not event then return end
    
    local event_id = tonumber(event.id)
    local event_name = event.event_name or "Evento"
    local winner_prize = tonumber(event.reward_glory_winner) or 200
    local pid = pc.get_player_id()
    local pname = pc.get_name()
    local today = os.date("%Y-%m-%d")
    
    -- Controlla se gia registrato oggi per questo evento
    local check_q = string.format(
        "SELECT id FROM srv1_hunabku.hunter_event_participants WHERE event_id=%d AND player_id=%d AND DATE(joined_at)='%s'",
        event_id, pid, today
    )
    local c = mysql_direct_query(check_q)
    
    if c == 0 then
        -- Prima partecipazione oggi, registra
        local insert_q = string.format(
            "INSERT INTO srv1_hunabku.hunter_event_participants (event_id, player_id, player_name, joined_at) VALUES (%d, %d, '%s', NOW())",
            event_id, pid, mysql_escape_string(pname)
        )
        mysql_direct_query(insert_q)
        
        -- Notifica iscrizione con dettagli
        hg_lib.syschat_t("EVENT_REGISTERED", "Sei iscritto all'estrazione finale!", nil, "FFD700")
        syschat("|cff00FF00[" .. hg_lib.get_text("EVENT", nil, "EVENTO") .. "]|r " .. hg_lib.get_text("EVENT_LOTTERY_END", {PTS = winner_prize}, "Sorteggio a fine evento: +" .. winner_prize .. " Gloria!"))
        cmdchat("HunterEventJoined " .. event_id .. "|" .. hg_lib.clean_str(event_name) .. "|0")
    end
end

-- ============================================================
-- EVENTI "PRIMO VINCE" (first_rift, first_boss)
-- ============================================================
function hg_lib.check_first_rift_winner()
    local event = hg_lib.get_current_scheduled_event()
    if not event then return end
    
    local etype = event.event_type or ""
    if etype ~= "first_rift" then return end
    
    local event_id = tonumber(event.id)
    local today = os.date("%Y-%m-%d")
    
    -- Controlla se c'e' gia' un vincitore oggi per questo evento
    local check_q = string.format(
        "SELECT id FROM srv1_hunabku.hunter_event_winners WHERE event_id=%d AND DATE(won_at)='%s' AND winner_type='first_rift'",
        event_id, today
    )
    local c = mysql_direct_query(check_q)
    
    if c > 0 then
        -- Gia' c'e' un vincitore oggi, niente da fare
        return
    end
    
    -- QUESTO PLAYER E' IL PRIMO! Assegna il premio
    local pid = pc.get_player_id()
    local pname = pc.get_name()
    local glory_prize = tonumber(event.reward_glory_winner) or 500
    local event_name = event.event_name or "Frattura della Sera"
    
    -- Dai la gloria al vincitore
    mysql_direct_query(string.format(
        "UPDATE srv1_hunabku.hunter_quest_ranking SET total_points = total_points + %d, spendable_points = spendable_points + %d WHERE player_id=%d",
        glory_prize, glory_prize, pid
    ))
    
    -- Registra come vincitore "first_rift"
    mysql_direct_query(string.format(
        "INSERT INTO srv1_hunabku.hunter_event_winners (event_id, player_id, player_name, winner_type, winner_data, won_at) VALUES (%d, %d, '%s', 'first_rift', '%d', NOW())",
        event_id, pid, mysql_escape_string(pname), glory_prize
    ))
    
    -- Notifica il vincitore
    local msg = hg_lib.get_text("EVENT_FIRST_WIN", {PTS = glory_prize}, "SEI IL PRIMO! HAI VINTO +" .. glory_prize .. " GLORIA!")
    hg_lib.hunter_speak_color(msg, "GOLD")
    syschat("|cffFFD700========================================|r")
    hg_lib.syschat_t("EVENT_FIRST_RIFT_TITLE", "[!] PRIMO A CONQUISTARE LA FRATTURA [!]", nil, "00FF00")
    hg_lib.syschat_t("EVENT_PRIZE", "Premio: +{PTS} Gloria!", {PTS = glory_prize}, "FFD700")
    syschat("|cffFFD700========================================|r")

    -- Annuncia a tutti
    notice_all("|cffFFD700[" .. hg_lib.get_text("EVENT", nil, "EVENTO") .. " " .. string.upper(event_name) .. "]|r")
    local first_msg = hg_lib.get_text("EVENT_FIRST_RIFT_ANNOUNCE", {NAME = pname}, pname .. " e' il PRIMO a conquistare una frattura!")
    notice_all("|cff00FF00" .. first_msg .. "|r")
    notice_all("|cffFFD700" .. hg_lib.get_text("EVENT_PRIZE", {PTS = glory_prize}, "Premio: +" .. glory_prize .. " Gloria!") .. "|r")
    
    hg_lib.send_player_data()
end

function hg_lib.check_first_boss_winner(boss_vnum)
    local event = hg_lib.get_current_scheduled_event()
    if not event then return end
    
    local etype = event.event_type or ""
    if etype ~= "first_boss" then return end
    
    local event_id = tonumber(event.id)
    local today = os.date("%Y-%m-%d")
    
    -- Controlla se c'e' gia' un vincitore oggi per questo evento
    local check_q = string.format(
        "SELECT id FROM srv1_hunabku.hunter_event_winners WHERE event_id=%d AND DATE(won_at)='%s' AND winner_type='first_boss'",
        event_id, today
    )
    local c = mysql_direct_query(check_q)
    
    if c > 0 then return end
    
    -- QUESTO PLAYER E' IL PRIMO! Assegna il premio
    local pid = pc.get_player_id()
    local pname = pc.get_name()
    local glory_prize = tonumber(event.reward_glory_winner) or 500
    local event_name = event.event_name or "Caccia al Boss"
    
    -- Dai la gloria
    mysql_direct_query(string.format(
        "UPDATE srv1_hunabku.hunter_quest_ranking SET total_points = total_points + %d, spendable_points = spendable_points + %d WHERE player_id=%d",
        glory_prize, glory_prize, pid
    ))
    
    -- Registra vincitore
    mysql_direct_query(string.format(
        "INSERT INTO srv1_hunabku.hunter_event_winners (event_id, player_id, player_name, winner_type, winner_data, won_at) VALUES (%d, %d, '%s', 'first_boss', '%d', NOW())",
        event_id, pid, mysql_escape_string(pname), glory_prize
    ))
    
    -- === SYSCHAT DETTAGLIATO EVENTO VINCITORE ===
    syschat("|cffFFD700========================================|r")
    hg_lib.syschat_t("EVENT_FIRST_WINNER_TITLE", "[!!!] PRIMO CLASSIFICATO EVENTO [!!!]", nil, "FFD700")
    syschat("|cffFFD700========================================|r")
    syschat("")
    syschat("|cff00FFFF  " .. hg_lib.get_text("EVENT", nil, "Evento") .. ":|r |cffFFFFFF" .. event_name .. "|r")
    hg_lib.syschat_t("EVENT_YOU_WERE_FIRST", "Sei stato il PRIMO!", nil, "00FF00")
    syschat("")
    hg_lib.syschat_t("EVENT_GLORY_PRIZE", "Premio Gloria: +{PTS}", {PTS = glory_prize}, "FFD700")
    syschat("")
    hg_lib.syschat_t("EVENT_TOTAL", ">>> TOTALE: +{PTS} Gloria <<<", {PTS = glory_prize}, "00FF00")
    syschat("|cffFFD700========================================|r")
    -- =============================================
    
    -- Notifica
    local msg = hg_lib.get_text("EVENT_FIRST_WIN", {PTS = glory_prize}, "SEI IL PRIMO! HAI VINTO +" .. glory_prize .. " GLORIA!")
    hg_lib.hunter_speak_color(msg, "GOLD")
    local boss_msg = hg_lib.get_text("EVENT_FIRST_BOSS_ANNOUNCE", {NAME = pname, PTS = glory_prize}, pname .. " e' il PRIMO a uccidere un boss! +" .. glory_prize .. " Gloria!")
    notice_all("|cffFFD700[" .. hg_lib.get_text("EVENT", nil, "EVENTO") .. " " .. string.upper(event_name) .. "]|r " .. boss_msg)
    
    hg_lib.send_player_data()
end

function hg_lib.draw_event_winner(event_id)
    -- Prima controlla il tipo evento - se e' "primo vince" non fare sorteggio
    local type_q = string.format("SELECT event_type FROM srv1_hunabku.hunter_scheduled_events WHERE id=%d", event_id)
    local tc, td = mysql_direct_query(type_q)
    if tc > 0 then
        local etype = td[1].event_type or "glory_rush"
        if etype == "first_rift" or etype == "first_boss" then
            -- Per questi eventi il vincitore e' gia' stato assegnato durante l'azione
            -- Non fare sorteggio casuale
            return nil, 0
        end
    end
    
    -- Seleziona vincitore casuale tra i partecipanti di oggi
    local today = os.date("%Y-%m-%d")
    
    local q = string.format(
        "SELECT player_id, player_name FROM srv1_hunabku.hunter_event_participants WHERE event_id=%d AND DATE(joined_at)='%s' ORDER BY RAND() LIMIT 1",
        event_id, today
    )
    local c, d = mysql_direct_query(q)
    
    if c > 0 then
        local winner_id = tonumber(d[1].player_id)
        local winner_name = d[1].player_name
        
        -- Prendi la ricompensa dell'evento
        local eq = string.format("SELECT reward_glory_winner, event_name FROM srv1_hunabku.hunter_scheduled_events WHERE id=%d", event_id)
        local ec, ed = mysql_direct_query(eq)
        local glory_prize = 500
        local event_name = "Evento"
        if ec > 0 then
            glory_prize = tonumber(ed[1].reward_glory_winner) or 500
            event_name = ed[1].event_name or "Evento"
        end
        
        -- Dai la gloria al vincitore
        mysql_direct_query(string.format(
            "UPDATE srv1_hunabku.hunter_quest_ranking SET total_points = total_points + %d, spendable_points = spendable_points + %d WHERE player_id=%d",
            glory_prize, glory_prize, winner_id
        ))
        
        -- Registra nella tabella vincitori
        mysql_direct_query(string.format(
            "INSERT INTO srv1_hunabku.hunter_event_winners (event_id, player_id, player_name, winner_type, winner_data, won_at) VALUES (%d, %d, '%s', 'lottery', '%d', NOW())",
            event_id, winner_id, mysql_escape_string(winner_name), glory_prize
        ))
        
        -- Pulisci i partecipanti di oggi per questo evento
        mysql_direct_query(string.format(
            "DELETE FROM srv1_hunabku.hunter_event_participants WHERE event_id=%d AND DATE(joined_at)='%s'",
            event_id, today
        ))
        
        -- Annuncia il vincitore a tutti
        local lottery_msg = hg_lib.get_text("EVENT_LOTTERY_WIN", {NAME = winner_name, PTS = glory_prize}, winner_name .. " ha vinto +" .. glory_prize .. " Gloria!")
        notice_all("|cffFFD700[" .. hg_lib.get_text("HUNTER_LOTTERY", nil, "HUNTER ESTRAZIONE") .. "]|r " .. lottery_msg)
        local congrats_msg = hg_lib.get_text("EVENT_CONGRATS", {EVENT = event_name}, "Congratulazioni al vincitore dell'evento " .. event_name .. "!")
        notice_all("|cff00FF00" .. congrats_msg .. "|r")

        -- Se il vincitore è il player corrente, mostra syschat dettagliato
        local current_pid = pc.get_player_id()
        if current_pid == winner_id then
            syschat("|cffFFD700=============================================|r")
            hg_lib.syschat_t("EVENT_LOTTERY_TITLE", "[!!!] HAI VINTO L'ESTRAZIONE! [!!!]", nil, "FFD700")
            syschat("|cffFFD700=============================================|r")
            syschat("")
            syschat("|cff00FFFF  " .. hg_lib.get_text("EVENT", nil, "Evento") .. ":|r |cffFFFFFF" .. event_name .. "|r")
            hg_lib.syschat_t("EVENT_LOTTERY_EXTRACTED", "Sei stato estratto tra i partecipanti!", nil, "00FF00")
            syschat("")
            hg_lib.syschat_t("EVENT_GLORY_PRIZE", "Premio Gloria: +{PTS}", {PTS = glory_prize}, "FFD700")
            syschat("")
            hg_lib.syschat_t("EVENT_TOTAL", ">>> TOTALE: +{PTS} Gloria <<<", {PTS = glory_prize}, "00FF00")
            syschat("|cffFFD700=============================================|r")
            hg_lib.hunter_speak_color("CONGRATULAZIONI! HAI VINTO +" .. glory_prize .. " GLORIA!", "GOLD")
        end
        
        return winner_name, glory_prize
    end
    
    return nil, 0
end

function hg_lib.check_event_end_and_draw()
    -- Controlla se un evento e appena finito e fai l'estrazione
    local t = os.date("*t")
    local wday = t.wday - 1
    local day_db = wday
    if wday == 0 then day_db = 7 end
    
    local current_hour = t.hour
    local current_minute = t.min
    local current_total = current_hour * 60 + current_minute
    
    local q = "SELECT id, event_name, start_hour, start_minute, duration_minutes FROM srv1_hunabku.hunter_scheduled_events WHERE enabled=1 AND FIND_IN_SET(" .. day_db .. ", days_active) > 0"
    local c, d = mysql_direct_query(q)
    
    if c > 0 then
        for i = 1, c do
            local e = d[i]
            local event_id = tonumber(e.id)
            local start_hour = tonumber(e.start_hour) or 0
            local start_minute = tonumber(e.start_minute) or 0
            local duration = tonumber(e.duration_minutes) or 30
            
            local start_total = start_hour * 60 + start_minute
            local end_total = start_total + duration
            
            -- Se siamo esattamente al minuto di fine evento (finestra di 1 minuto)
            if current_total >= end_total and current_total < end_total + 1 then
                -- Controlla se non abbiamo gia estratto oggi
                local today = os.date("%Y-%m-%d")
                local check_q = string.format(
                    "SELECT id FROM srv1_hunabku.hunter_event_winners WHERE event_id=%d AND DATE(won_at)='%s'",
                    event_id, today
                )
                local wc = mysql_direct_query(check_q)
                
                if wc == 0 then
                    -- Non ancora estratto, procedi
                    notice_all("|cffFFD700[HUNTER " .. hg_lib.get_text("EVENT", nil, "EVENTO") .. "]|r " .. hg_lib.get_text("EVENT_ENDED", {EVENT = e.event_name}, "L'evento " .. e.event_name .. " e terminato!"))
                    notice_all("|cff00FF00[" .. hg_lib.get_text("LOTTERY", nil, "ESTRAZIONE") .. "]|r " .. hg_lib.get_text("LOTTERY_IN_PROGRESS", nil, "Sorteggio vincitore in corso..."))

                    local winner, prize = hg_lib.draw_event_winner(event_id)
                    if not winner then
                        notice_all("|cffFF6600[" .. hg_lib.get_text("EVENT", nil, "EVENTO") .. "]|r " .. hg_lib.get_text("NO_PARTICIPANTS", nil, "Nessun partecipante oggi. Nessun vincitore."))
                    end
                end
            end
        end
    end
end

-- LOGICA KILL & SPAWN
function hg_lib.is_elite_mob(vnum)
    if not _G.hunter_elite_cache or not next(_G.hunter_elite_cache) then
        hg_lib.load_elite_cache()
    end

    return _G.hunter_elite_cache[vnum] == true
end

function hg_lib.get_mob_info(vnum)
    if not _G.hunter_elite_data or not next(_G.hunter_elite_data) then
        hg_lib.load_elite_cache()
    end

    return _G.hunter_elite_data[vnum]
end

function hg_lib.show_awakening_sequence(name)
    cmdchat("HunterAwakening " .. hg_lib.clean_str(name))
    timer("hq_awaken_1", 1)
    timer("hq_awaken_2", 3)
    timer("hq_awaken_3", 5)
    timer("hq_awaken_4", 7)
    timer("hq_awaken_5", 9)
end

function hg_lib.show_rank_welcome(name, points)
    local rank_key = hg_lib.get_rank_key(points)
    local rank_data = hg_lib.get_rank_data(rank_key)
    cmdchat("HunterWelcome " .. rank_key .. "|" .. hg_lib.clean_str(name) .. "|" .. points)
    syschat("")
    syschat(rank_data.border)
    syschat(rank_data.title_line)
    syschat(rank_data.border)
    syschat("")
    syschat(rank_data.welcome_line1)
    syschat(rank_data.welcome_line2)
    syschat(rank_data.welcome_line3)
    syschat("")
    syschat(rank_data.stats_line)
    syschat("")
    syschat(rank_data.quote)
    syschat(rank_data.border)
end

function hg_lib.get_rank_key(points)
    local N = tonumber(hg_lib.get_config("rank_threshold_N")) or 1500000
    local S = tonumber(hg_lib.get_config("rank_threshold_S")) or 500000
    local A = tonumber(hg_lib.get_config("rank_threshold_A")) or 150000
    local B = tonumber(hg_lib.get_config("rank_threshold_B")) or 50000
    local C = tonumber(hg_lib.get_config("rank_threshold_C")) or 10000
    local D = tonumber(hg_lib.get_config("rank_threshold_D")) or 2000

    if points >= N then return "N"
    elseif points >= S then return "S"
    elseif points >= A then return "A"
    elseif points >= B then return "B"
    elseif points >= C then return "C"
    elseif points >= D then return "D"
    else return "E" end
end

function hg_lib.get_rank_data(rank_key)
    -- Colori per ogni rango
    local rank_colors = {
        ["E"] = {border = "808080", title = "808080", line = "AAAAAA", stats = "808080", quote = "808080"},
        ["D"] = {border = "00FF00", title = "00FF00", line = "44FF44", stats = "00FF00", quote = "00FF00"},
        ["C"] = {border = "00FFFF", title = "00FFFF", line = "44FFFF", stats = "00FFFF", quote = "00FFFF"},
        ["B"] = {border = "0066FF", title = "0066FF", line = "4488FF", stats = "0066FF", quote = "0066FF"},
        ["A"] = {border = "AA00FF", title = "AA00FF", line = "CC66FF", stats = "AA00FF", quote = "AA00FF"},
        ["S"] = {border = "FFD700", title = "FFD700", line = "FFE066", stats = "FFD700", quote = "FFD700"},
        ["N"] = {border = "FF0000", title = "FF0000", line = "FF4444", stats = "FF0000", quote = "FF0000"},
    }
    
    local colors = rank_colors[rank_key] or rank_colors["E"]
    
    -- Ottieni testi tradotti usando il sistema multilingua
    local border_txt = hg_lib.get_text("welcome_" .. rank_key .. "_border") or "===================================================="
    local title_txt = hg_lib.get_text("welcome_" .. rank_key .. "_title") or "[" .. rank_key .. "-RANK]"
    local line1_txt = hg_lib.get_text("welcome_" .. rank_key .. "_line1") or "Welcome back, Hunter."
    local line2_txt = hg_lib.get_text("welcome_" .. rank_key .. "_line2") or "The System awaits."
    local line3_txt = hg_lib.get_text("welcome_" .. rank_key .. "_line3") or "Your journey continues."
    local stats_txt = hg_lib.get_text("welcome_" .. rank_key .. "_stats") or ">> Status: ACTIVE <<"
    local quote_txt = hg_lib.get_text("welcome_" .. rank_key .. "_quote") or "'Stay strong.'"
    
    return {
        border = "|cff" .. colors.border .. border_txt .. "|r",
        title_line = "|cff" .. colors.title .. title_txt .. "|r",
        welcome_line1 = "|cff" .. colors.line .. line1_txt .. "|r",
        welcome_line2 = "|cff" .. colors.line .. line2_txt .. "|r",
        welcome_line3 = "|cff" .. colors.line .. line3_txt .. "|r",
        stats_line = "|cff" .. colors.stats .. stats_txt .. "|r",
        quote = "|cff" .. colors.quote .. quote_txt .. "|r"
    }
end

function hg_lib.check_login_streak()
    local today = math.floor(get_time() / 86400)
    local last_login = pc.getqf("hq_last_login_day") or 0
    local streak = pc.getqf("hq_login_streak") or 0
    if today > last_login + 1 then 
        streak = 1 
    elseif today == last_login + 1 then 
        streak = streak + 1 
    end
    pc.setqf("hq_login_streak", streak)
    pc.setqf("hq_last_login_day", today)
        
    local days_tier3 = tonumber(hg_lib.get_config("streak_days_tier3")) or 30
    local bonus_tier3 = tonumber(hg_lib.get_config("streak_bonus_30days")) or 20
    local days_tier2 = tonumber(hg_lib.get_config("streak_days_tier2")) or 7
    local bonus_tier2 = tonumber(hg_lib.get_config("streak_bonus_7days")) or 10
    local days_tier1 = tonumber(hg_lib.get_config("streak_days_tier1")) or 3
    local bonus_tier1 = tonumber(hg_lib.get_config("streak_bonus_3days")) or 5

    local bonus = 0
    if streak >= days_tier3 then
        bonus = bonus_tier3
    elseif streak >= days_tier2 then
        bonus = bonus_tier2
    elseif streak >= days_tier1 then
        bonus = bonus_tier1
    end
    pc.setqf("hq_streak_bonus", bonus)
    if streak > 1 then
        local db_msg = hg_lib.get_streak_message(streak)
        if db_msg then
            hg_lib.hunter_speak(db_msg)
        else
            hg_lib.hunter_speak("STREAK GIORNALIERA: " .. streak .. " GIORNI. BONUS: " .. bonus .. " pct")
        end
    end
end

function hg_lib.check_pending_rewards()
    local pid = pc.get_player_id()
    local c, d = mysql_direct_query("SELECT pending_daily_reward, pending_weekly_reward FROM srv1_hunabku.hunter_quest_ranking WHERE player_id=" .. pid)
    if c > 0 and d[1] then
        if (tonumber(d[1].pending_daily_reward) or 0) > 0 or (tonumber(d[1].pending_weekly_reward) or 0) > 0 then
            local msg = hg_lib.get_text("pending_rewards") or "RICOMPENSE IN ATTESA. CONTROLLA IL TERMINALE."
            hg_lib.hunter_speak(msg)
        end
    end
end

-- ============================================================
-- CHECK GATE SELECTION - Notifica se il player e' stato sorteggiato
-- Chiamato al login per mostrare effetto + aprire finestra Gate
-- ============================================================
function hg_lib.check_gate_selection()
    local pid = pc.get_player_id()

    -- Cerca se il player ha un accesso Gate pendente
    local q = string.format([[
        SELECT ga.access_id, ga.gate_id, gc.gate_name, ga.expires_at,
               TIMESTAMPDIFF(MINUTE, NOW(), ga.expires_at) as minutes_left
        FROM srv1_hunabku.hunter_gate_access ga
        JOIN srv1_hunabku.hunter_gate_config gc ON ga.gate_id = gc.gate_id
        WHERE ga.player_id = %d
          AND ga.status = 'pending'
          AND ga.expires_at > NOW()
        ORDER BY ga.granted_at DESC
        LIMIT 1
    ]], pid)

    local c, d = mysql_direct_query(q)

    if c > 0 and d[1] then
        local gate_name = d[1].gate_name or "Gate"
        local rank_req = "E" -- rank_required non esiste nella tabella, usa default
        local minutes_left = tonumber(d[1].minutes_left) or 0
        local hours_left = math.floor(minutes_left / 60)
        local mins_left = math.floor(minutes_left / 60)

        -- Invia comando al client per mostrare effetto e aprire finestra
        -- Formato: HunterGateSelected gateName|rank|hoursLeft|minsLeft
        cmdchat("HunterGateSelected " .. hg_lib.clean_str(gate_name) .. "|" .. rank_req .. "|" .. hours_left .. "|" .. mins_left)

        -- Messaggio syschat tradotto
        syschat("")
        syschat("|cffFFD700========================================|r")
        hg_lib.syschat_t("GATE_SELECTED_TITLE", "[!!!] SEI STATO SELEZIONATO! [!!!]", nil, "FFD700")
        syschat("|cffFFD700========================================|r")
        syschat("")
        hg_lib.syschat_t("GATE_SELECTED_MSG", "Hai accesso al Gate: {GATE}", {GATE = gate_name}, "00FF00")
        hg_lib.syschat_t("GATE_SELECTED_RANK", "Rango richiesto: {RANK}", {RANK = rank_req}, "00FFFF")
        hg_lib.syschat_t("GATE_SELECTED_TIME", "Tempo rimasto: {H}h {M}m", {H = hours_left, M = mins_left}, "FF6600")
        syschat("")
        hg_lib.syschat_t("GATE_SELECTED_HINT", "Apri il Terminale Hunter per entrare!", nil, "AAAAAA")
        syschat("|cffFFD700========================================|r")

        return true
    end

    return false
end

function hg_lib.check_if_overtaken()
    local pid = pc.get_player_id()
    local c, d = mysql_direct_query("SELECT overtaken_by, overtaken_diff, overtaken_label FROM srv1_hunabku.hunter_quest_ranking WHERE player_id=" .. pid .. " AND overtaken_by IS NOT NULL AND overtaken_by != ''")
    if c > 0 and d[1] and d[1].overtaken_by and d[1].overtaken_by ~= "" then
        local by_name = d[1].overtaken_by
        local diff = tonumber(d[1].overtaken_diff) or 0
        local label = d[1].overtaken_label or "Gloria"
        cmdchat("HunterRivalAlert " .. hg_lib.clean_str(by_name) .. "|" .. diff .. "|" .. hg_lib.clean_str(label) .. "|SUPERATO")
        mysql_direct_query("UPDATE srv1_hunabku.hunter_quest_ranking SET overtaken_by=NULL, overtaken_diff=0, overtaken_label=NULL WHERE player_id=" .. pid)
    end
end

function hg_lib.check_rank_up(old_points, new_points)
    local old_rank = hg_lib.get_rank_index(old_points)
    local new_rank = hg_lib.get_rank_index(new_points)
        
    if new_rank > old_rank then
        local new_letter = hg_lib.get_rank_letter(new_rank)
        local pid = pc.get_player_id()
            
        cmdchat("HunterRankUp " .. hg_lib.get_rank_letter(old_rank) .. "|" .. new_letter)
        pc.setqf("hq_rank_num", new_rank)

        hg_lib.flush_ranking_updates()

        mysql_direct_query("UPDATE srv1_hunabku.hunter_quest_ranking SET hunter_rank='" .. new_letter .. "', current_rank='" .. new_letter .. "' WHERE player_id=" .. pid)
            
        if new_rank >= 4 then
            notice_all("")
            local global_msg = hg_lib.get_text("rank_up_global", {NAME = pc.get_name(), RANK = new_letter}) or ("|cffFFD700[RANK UP]|r |cffFFFFFF" .. pc.get_name() .. "|r e' salito al rango [" .. new_letter .. "-RANK]!")
            notice_all(global_msg)
            notice_all("")
        end
            
        local msg = hg_lib.get_text("rank_up_msg", {RANK = new_letter}) or ("RANK UP! Sei ora un " .. new_letter .. "-RANK Hunter!")
        hg_lib.hunter_speak(msg)
    end
end

-- ============================================================
-- OTTIMIZZAZIONE check_overtake - Riduzione drastica query SQL
-- Con 300 giocatori e 300k kill/min, questa funzione era un bottleneck critico
-- NUOVA VERSIONE: Cooldown 60 secondi + batch queries + cache locale
-- ============================================================
_G.hunter_overtake_cooldown = {}  -- Cache cooldown per player

function hg_lib.check_overtake(pid, pname, col_name, added_val, label_nice)
    -- PERFORMANCE: Cooldown di 60 secondi per tipo di check per evitare spam query
    local now = get_time()
    local cooldown_key = pid .. "_" .. col_name
    local last_check = _G.hunter_overtake_cooldown[cooldown_key] or 0
    
    -- Se abbiamo già controllato negli ultimi 60 secondi, skip
    if now - last_check < 60 then
        return
    end
    _G.hunter_overtake_cooldown[cooldown_key] = now
    
    -- PERFORMANCE: Cache i limiti invece di fare query get_config ogni volta
    if not _G.hunter_rival_ranges then
        _G.hunter_rival_ranges = {
            ["daily_points"]    = hg_lib.get_config("rival_range_daily") or 500,
            ["weekly_points"]   = hg_lib.get_config("rival_range_weekly") or 2000,
            ["total_metins"]    = hg_lib.get_config("rival_range_metins") or 50,
            ["total_chests"]    = hg_lib.get_config("rival_range_chests") or 50,
            ["total_fractures"] = hg_lib.get_config("rival_range_fractures") or 20,
            ["total_points"]    = hg_lib.get_config("rival_range_total") or 50000,
        }
    end
    local limit = _G.hunter_rival_ranges[col_name] or 50000
    
    -- PERFORMANCE: Usa il valore in memoria invece di query al DB
    local my_score = pc.getqf("hq_" .. col_name) or 0
    local new_score = my_score + added_val
    
    -- UNA SOLA query ottimizzata invece di 4 separate
    local q = string.format([[
        SELECT 'above' as type, player_name, %s as score FROM srv1_hunabku.hunter_quest_ranking 
        WHERE %s > %d ORDER BY %s ASC LIMIT 1
        UNION ALL
        SELECT 'below' as type, player_name, %s as score FROM srv1_hunabku.hunter_quest_ranking 
        WHERE %s < %d AND %s >= %d AND player_id != %d ORDER BY %s DESC LIMIT 1
    ]], col_name, col_name, new_score, col_name, col_name, col_name, new_score, col_name, my_score, pid, col_name)
    
    local c, d = mysql_direct_query(q)
    
    if c > 0 then
        for i = 1, c do
            local row = d[i]
            local diff = math.abs(tonumber(row.score) - new_score)
            
            if diff > 0 and diff < limit then
                if row.type == "above" then
                    hg_lib.notify_rival(row.player_name, diff, label_nice)
                elseif row.type == "below" then
                    -- Segna che abbiamo superato qualcuno (senza query UPDATE immediata)
                    -- L'update verrà fatto nel flush periodico
                    if col_name == "daily_points" or col_name == "weekly_points" then
                        cmdchat("HunterOvertake " .. hg_lib.clean_str(row.player_name) .. "|0")
                    end
                end
            end
        end
    end
end

function hg_lib.on_emergency_kill(vnum)
    local emerg_active = pc.getqf("hq_emerg_active") or 0
    
    -- SE NON HA EMERGENCY LOCALE, CONTROLLA SE IL SUO PARTY HA UNA EMERGENCY ATTIVA
    if emerg_active ~= 1 then
        if party.is_party() then
            -- Controlla se qualche membro del party ha l'emergency attiva con questo vnum
            local pids = {party.get_member_pids()}
            for i, member_pid in ipairs(pids) do
                q.begin_other_pc_block(member_pid)
                local member_active = pc.getqf("hq_emerg_active") or 0
                local member_vnum = pc.getqf("hq_emerg_vnum") or 0
                q.end_other_pc_block()
                
                if member_active == 1 and (member_vnum == 0 or member_vnum == vnum) then
                    -- Un membro del party ha l'emergency attiva! Eredita i flag
                    q.begin_other_pc_block(member_pid)
                    local req = pc.getqf("hq_emerg_req") or 1
                    local expire = pc.getqf("hq_emerg_expire") or 0
                    local reward_pts = pc.getqf("hq_emerg_reward_pts") or 0
                    q.end_other_pc_block()
                    
                    pc.setqf("hq_emerg_active", 1)
                    pc.setqf("hq_emerg_vnum", member_vnum)
                    pc.setqf("hq_emerg_req", req)
                    pc.setqf("hq_emerg_cur", 0)
                    pc.setqf("hq_emerg_expire", expire)
                    pc.setqf("hq_emerg_reward_pts", reward_pts)
                    emerg_active = 1
                    break
                end
            end
        end
    end
    
    if emerg_active == 1 then
        local req_vnum = pc.getqf("hq_emerg_vnum")
        if req_vnum == 0 or req_vnum == vnum then
            local current = pc.getqf("hq_emerg_cur") + 1
            local required = pc.getqf("hq_emerg_req")
            pc.setqf("hq_emerg_cur", current)
            hg_lib.update_emergency(current)

            if current >= required then
                hg_lib.end_emergency("SUCCESS")
            end
        end
    end
end

function hg_lib.on_defense_mob_kill(killed_vnum)
    local pid = pc.get_player_id()
    
    -- Controlla se questo player ha una difesa attiva
    local defense_active = pc.getqf("hq_defense_active") or 0
    local fracture_vid = pc.getqf("hq_defense_fracture_vid") or 0
    
    -- SE NON HA DIFESA LOCALE, CONTROLLA SE IL SUO PARTY HA UNA DIFESA ATTIVA
    if defense_active ~= 1 or fracture_vid == 0 then
        if party.is_party() then
            local leader_pid = party.get_leader_pid()
            local party_vid = game.get_event_flag("hq_party_defense_vid_" .. leader_pid) or 0
            
            if party_vid > 0 then
                -- Il party ha una difesa attiva! Setta i flag locali
                fracture_vid = party_vid
                pc.setqf("hq_defense_active", 1)
                pc.setqf("hq_defense_fracture_vid", fracture_vid)
                defense_active = 1
            end
        end
    end
    
    -- Dopo il check party, verifica ancora
    if defense_active ~= 1 then
        return
    end
    
    if fracture_vid == 0 then
        return
    end
    
    -- Recupera il rank dalla flag globale
    local rank_idx = game.get_event_flag("hq_defense_rank_" .. fracture_vid) or 0
    local rank = hg_lib.get_rank_letter(rank_idx)
    
    -- Assicurati che la cache delle wave sia caricata
    if not _G.hunter_defense_waves_cache or not _G.hunter_defense_waves_cache[rank] then
        hg_lib.load_defense_waves_cache(rank)
    end
    
    -- Verifica se il mob e' valido per la difesa (silenzioso se non valido)
    local is_valid = hg_lib.is_valid_defense_mob(rank, killed_vnum)
    
    if not is_valid then
        return
    end
    
    -- Incrementa il contatore kill GLOBALE (basato sul VID della frattura)
    local current_killed = game.get_event_flag("hq_defense_killed_" .. fracture_vid) or 0
    current_killed = current_killed + 1
    game.set_event_flag("hq_defense_killed_" .. fracture_vid, current_killed)
end

-- NOTA: _internal_defense_kill rimossa (mai chiamata, logica legacy)

function hg_lib.process_elite_kill(vnum)
    local mob_info = hg_lib.get_mob_info(vnum)
    if not mob_info then return end
        
    local pid = pc.get_player_id()
    local pname = pc.get_name()
    local base_pts = mob_info.base_points
    
    -- === SEGNALE D'EMERGENZA: Forza Speed Kill su questo mob ===
    local force_speedkill = game.get_event_flag("hq_force_speedkill_"..pid) or 0
    if force_speedkill == 1 and pc.getqf("hq_speedkill_active") ~= 1 then
        -- Attiva speedkill forzato per questo mob
        pc.setqf("hq_speedkill_active", 1)
        pc.setqf("hq_speedkill_vnum", vnum)
        pc.setqf("hq_speedkill_start", get_time())
        pc.setqf("hq_speedkill_duration", 60)  -- 60 secondi per kill veloce
        game.set_event_flag("hq_force_speedkill_"..pid, 0)  -- Consuma il buff
        hg_lib.syschat_t("SPEEDKILL_ACTIVATED", "SPEED KILL ATTIVATO! Uccidi in 60s per x2 Gloria!", nil, "FF0000")
        cmdchat("HunterSpeedKillStart " .. vnum .. "|60|" .. hg_lib.clean_str(mob_info.name))
        cleartimer("hq_speedkill_timer")
        loop_timer("hq_speedkill_timer", 1)
    end
    -- ===========================================================
        
    local speedkill_active = pc.getqf("hq_speedkill_active") or 0
    local speedkill_vnum = pc.getqf("hq_speedkill_vnum") or 0

    if speedkill_active == 1 and speedkill_vnum == vnum then
        local start_time = pc.getqf("hq_speedkill_start") or 0
        local duration = pc.getqf("hq_speedkill_duration") or 300
        local elapsed = get_time() - start_time

        if elapsed <= duration then
            base_pts = base_pts * 2
            local msg = hg_lib.get_text("speedkill_success") or "SPEED KILL! GLORIA x2!"
            hg_lib.hunter_speak_color(msg, "GOLD")
        end
        
        pc.setqf("hq_speedkill_active", 0)
        cleartimer("hq_speedkill_timer")
        cmdchat("HunterSpeedKillEnd 1")
    end

    if pc.getqf("hq_emerg_active") == 1 then
        local emerg_vnum = pc.getqf("hq_emerg_vnum") or 0
        if emerg_vnum == vnum then
            cleartimer("hunter_emerg_tmr")
            hg_lib.end_emergency("SUCCESS")
        end
    end

    -- === RISONATORE DI GRUPPO (Party Focus +20% Gloria) ===
    -- Applica PRIMA della distribuzione, cosi' tutti ne beneficiano
    if party.is_party() then
        local leader_pid = party.get_leader_pid()
        local party_focus = game.get_event_flag("hq_party_focus_"..leader_pid) or 0
        if party_focus == 1 then
            local focus_bonus = math.floor(base_pts * 0.20)
            base_pts = base_pts + focus_bonus
            game.set_event_flag("hq_party_focus_"..leader_pid, 0)  -- Consuma il buff (una volta per party)
            syschat("|cff00FFFF[" .. hg_lib.get_text("RESONANCE", nil, "RISONANZA") .. "]|r " .. hg_lib.get_text("RESONANCE_BONUS", {BONUS = focus_bonus}, "+20% Gloria di Gruppo! (+" .. focus_bonus .. ")"))
        end
    end
    -- ======================================================
    
    -- ============================================================
    -- DISTRIBUZIONE GLORIA PER MERITOCRAZIA (PARTY)
    -- ============================================================
    if party.is_party() and party.get_near_count() >= 2 then
        -- Siamo in party! Distribuisci Gloria per meritocrazia
        local distribution = hg_lib.distribute_party_glory_elite(base_pts, mob_info)
        
        -- Aggiorna le statistiche solo per il killer (kill count)
        if mob_info.type_name == "SUPER_METIN" then
            pc.setqf("hq_pending_metins", (pc.getqf("hq_pending_metins") or 0) + 1)
            hg_lib.on_metin_kill(vnum)
        elseif mob_info.type_name == "BAULE" then
            pc.setqf("hq_pending_chests", (pc.getqf("hq_pending_chests") or 0) + 1)
            hg_lib.give_chest_reward()
        elseif mob_info.type_name == "BOSS" then
            hg_lib.on_boss_kill(vnum)
        end
        
        local pending = pc.getqf("hq_pending_elite") or 0
        if pending > 0 then pc.setqf("hq_pending_elite", pending - 1) end
        
        hg_lib.check_achievements()
        hg_lib.send_player_data()
        return  -- Esce perche' la distribuzione party e' gia' stata fatta
    end
    -- ============================================================
    
    -- MODALITA' SOLO (senza party) - mantiene la logica originale
    local original_base = base_pts  -- Salva il valore base per il log
    local modifier_log = {}  -- Log dei modificatori
    
    local streak_bonus = pc.getqf("hq_streak_bonus") or 0
    if streak_bonus > 0 then
        local streak_add = math.floor(base_pts * streak_bonus / 100)
        base_pts = base_pts + streak_add
        table.insert(modifier_log, {name = "Streak Bonus", value = "+" .. streak_bonus .. "%", add = streak_add})
    end
    
    -- === FOCUS DEL CACCIATORE (+20% Gloria) ===
    local has_focus = game.get_event_flag("hq_hunter_focus_"..pid) or 0
    if has_focus == 1 then
        local focus_bonus = math.floor(base_pts * 0.20)
        base_pts = base_pts + focus_bonus
        game.set_event_flag("hq_hunter_focus_"..pid, 0)  -- Consuma il buff
        table.insert(modifier_log, {name = "Focus Hunter", value = "+20%", add = focus_bonus})
    end
    -- ==========================================
        
    local player_pts = pc.getqf("hq_total_points") or 0
    local rank_bonus = hg_lib.get_rank_bonus(player_pts)
    if rank_bonus > 0 then
        local rank_add = math.floor(base_pts * rank_bonus / 100)
        base_pts = base_pts + rank_add
        table.insert(modifier_log, {name = "Rank Bonus", value = "+" .. rank_bonus .. "%", add = rank_add})
    end
    
    -- FRACTURE BONUS (+50% se missioni complete)
    if hg_lib.has_fracture_bonus() then
        local frac_add = math.floor(base_pts * 0.50)
        base_pts = base_pts + frac_add
        table.insert(modifier_log, {name = "Bonus Missioni", value = "+50%", add = frac_add})
    end
        
    local evt_name, evt_mult, evt_type = hg_lib.get_active_event()
    if evt_type == "points" and evt_mult ~= 1.0 then
        local before_evt = base_pts
        base_pts = math.floor(base_pts * evt_mult)
        local evt_diff = base_pts - before_evt
        table.insert(modifier_log, {name = "Evento " .. (evt_name or ""), value = "x" .. evt_mult, add = evt_diff})
        -- Registra partecipazione all'evento (se non già registrato)
        hg_lib.register_event_participant()
    end

    local trial_mult = hg_lib.get_trial_gloria_multiplier()
    if trial_mult < 1.0 then
        local before_trial = base_pts
        base_pts = math.floor(base_pts * trial_mult)
        local trial_sub = before_trial - base_pts
        table.insert(modifier_log, {name = "Prova Esame", value = "-50%", add = -trial_sub})
    end
    
    -- SYSCHAT DETTAGLIATO DEI MODIFICATORI
    local glory_label = hg_lib.get_text("GLORY", nil, "Gloria")
    syschat("|cff888888========== " .. hg_lib.get_text("GLORY_DETAIL", nil, "DETTAGLIO GLORIA") .. " =========|r")
    syschat("|cffFFFFFF" .. mob_info.type_name .. ": |r|cffFFD700" .. mob_info.name .. "|r")
    syschat("|cffAAAAAA" .. hg_lib.get_text("BASE_GLORY", nil, "Gloria Base") .. ": |r|cffFFFFFF" .. original_base .. "|r")
    for i = 1, table.getn(modifier_log) do
        local m = modifier_log[i]
        local color = m.add >= 0 and "|cff00FF00" or "|cffFF4444"
        local sign = m.add >= 0 and "+" or ""
        syschat("|cffAAAAAA" .. m.name .. " (" .. m.value .. "): |r" .. color .. sign .. m.add .. "|r")
    end
    syschat("|cffFFD700>>> " .. hg_lib.get_text("TOTAL", nil, "TOTALE") .. ": +" .. base_pts .. " " .. glory_label .. " <<<|r")
    syschat("|cff888888======================================|r")

    hg_lib.check_overtake(pid, pname, "daily_points", base_pts, "GIORNALIERA")
    hg_lib.check_overtake(pid, pname, "weekly_points", base_pts, "SETTIMANALE")

    hg_lib.add_pending_points(base_pts, base_pts, base_pts)
    hg_lib.add_pending_kill()

    pc.setqf("hq_total_kills", (pc.getqf("hq_total_kills") or 0) + 1)
    local new_total_pts = (pc.getqf("hq_total_points") or 0) + base_pts
    pc.setqf("hq_total_points", new_total_pts)

    hg_lib.check_rank_up(player_pts, new_total_pts)

    if mob_info.type_name == "SUPER_METIN" then
        hg_lib.check_overtake(pid, pname, "total_metins", 1, "METIN")
        pc.setqf("hq_pending_metins", (pc.getqf("hq_pending_metins") or 0) + 1)
        hg_lib.on_metin_kill(vnum)
    elseif mob_info.type_name == "BAULE" then
        hg_lib.check_overtake(pid, pname, "total_chests", 1, "BAULI")
        pc.setqf("hq_pending_chests", (pc.getqf("hq_pending_chests") or 0) + 1)
        hg_lib.give_chest_reward()
    elseif mob_info.type_name == "BOSS" then
        hg_lib.on_boss_kill(vnum)
    end
        
    local pending = pc.getqf("hq_pending_elite") or 0
    if pending > 0 then pc.setqf("hq_pending_elite", pending - 1) end
        
    local msg = hg_lib.get_text("target_eliminated", {NAME = mob_info.name, POINTS = base_pts}) or ("BERSAGLIO ELIMINATO: " .. mob_info.name .. " | +" .. base_pts .. " GLORIA")
    hg_lib.hunter_speak_color(msg, mob_info.rank_color or "BLUE")
        
    hg_lib.check_achievements()
    hg_lib.send_player_data()
end

function hg_lib.process_normal_kill()
    -- NON contare kill durante Emergency Quest
    if pc.getqf("hq_emerg_active") == 1 then
        if get_time() > (pc.getqf("hq_emerg_expire") or 0) then
            pc.setqf("hq_emerg_active", 0) 
        else
            return 
        end
    end
    
    -- NON contare kill durante Difesa Frattura (i mob della difesa non fanno spawnare fratture)
    -- Check per player SOLO
    if pc.getqf("hq_defense_active") == 1 then
        return
    end
    -- Check per player in PARTY (il membro non ha hq_defense_active ma il party ha il flag)
    if party.is_party() then
        local defense_active = party.getf("hunter_level_bridge", "defense_active") or 0
        if defense_active == 1 then
            return
        end
    end

    local base_threshold = hg_lib.get_config("spawn_threshold_normal")
    if base_threshold <= 0 then base_threshold = 500 end 

    local daily_f = pc.getqf("hq_daily_fracture_count") or 0
    
    local last_day = pc.getqf("hq_last_fracture_day") or 0
    local today = tonumber(os.date("%j"))
    if last_day ~= today then
        daily_f = 0
        pc.setqf("hq_daily_fracture_count", 0)
        pc.setqf("hq_last_fracture_day", today)
    end

    local penalty = 0
    if daily_f >= 5 and daily_f < 15 then
        penalty = (daily_f - 5) * 150
    elseif daily_f >= 15 then
        penalty = (10 * 150) + ((daily_f - 15) * 500)
    end

    local final_threshold = base_threshold + penalty

    local evt_name, evt_mult, evt_type = hg_lib.get_active_event()
    if evt_type == "threshold" then 
        final_threshold = math.floor(final_threshold * evt_mult)
    elseif evt_type == "chance" then
        final_threshold = math.floor(final_threshold * 0.7)
    end
        
    local streak = pc.getqf("hq_login_streak") or 0
    final_threshold = math.max(50, final_threshold - (streak * 5))
        
    local kills = (pc.getqf("hq_normal_kills") or 0) + 1
    pc.setqf("hq_normal_kills", kills)
        
    if kills >= final_threshold then 
        pc.setqf("hq_normal_kills", 0)
        
        pc.setqf("hq_daily_fracture_count", daily_f + 1)
            
        local emerg_chance = hg_lib.get_config("emergency_chance_percent")
        if emerg_chance <= 0 then emerg_chance = 35 end 
            
        local roll = number(1, 100)
            
        if roll <= emerg_chance then
            hg_lib.trigger_random_emergency()
        else
            hg_lib.spawn_fracture() 
        end
    end
end

function hg_lib.trigger_random_emergency()
    if pc.getqf("hq_defense_active") == 1 then return end
    if pc.getqf("hq_emerg_active") == 1 then return end
    if pc.getqf("hq_speedkill_active") == 1 then return end

    local lv = pc.get_level()
    local q = "SELECT id, name, duration_seconds, target_count, target_vnum, reward_points, reward_item_vnum, reward_item_count, difficulty FROM srv1_hunabku.hunter_quest_emergencies WHERE enabled = 1 AND min_level <= " .. lv .. " AND max_level >= " .. lv .. " ORDER BY RAND() LIMIT 1"
        
    local c, d = mysql_direct_query(q)
        
    if c > 0 and d[1] then
        local mission = d[1]
            
        pc.setqf("hq_emerg_id", tonumber(mission.id))
        pc.setqf("hq_emerg_reward_pts", tonumber(mission.reward_points) or 0)
        pc.setqf("hq_emerg_reward_vnum", tonumber(mission.reward_item_vnum) or 0)
        pc.setqf("hq_emerg_reward_count", tonumber(mission.reward_item_count) or 0)
            
        hg_lib.start_emergency(mission.name, tonumber(mission.duration_seconds), tonumber(mission.target_vnum), tonumber(mission.target_count))
            
        local diff_color = {EASY = "|cff00FF00", NORMAL = "|cff00CCFF", HARD = "|cffFF8800", EXTREME = "|cffFF0000", GOD_MODE = "|cffFF00FF"}
        local dc = diff_color[mission.difficulty] or "|cffFFFFFF"
        local mission_label = hg_lib.get_text("emerg_mission_label", nil, "Missione")
        syschat(dc .. "[" .. mission.difficulty .. "]|r " .. mission_label .. ": " .. mission.name)
    else
        local default_name = hg_lib.get_text("emerg_default_name", nil, "Orda Improvvisa")
        hg_lib.start_emergency(default_name, 60, 0, 20)
    end
end

-- ============================================================
-- SISTEMA BAULI CLICCABILI
-- Quando un player clicca un baule spawnnato, riceve Gloria + Item
-- Se in party, la Gloria viene divisa per meritocrazia
-- ============================================================

function hg_lib.open_chest(chest_vnum)
    local pid = pc.get_player_id()
    local pname = pc.get_name()
    
    -- Recupera dati baule dal DB
    local c, d = mysql_direct_query("SELECT name, rank_tier, glory_min, glory_max, item_vnum, item_quantity, item_chance, color_code FROM srv1_hunabku.hunter_chest_rewards WHERE vnum=" .. chest_vnum .. " AND enabled=1")
    
    if c == 0 or not d[1] then
        -- Fallback: usa vecchio sistema se il baule non e' configurato
        hg_lib.give_chest_reward()
        return
    end
    
    local chest = d[1]
    local chest_name = chest.name or "Baule"
    local rank_tier = tonumber(chest.rank_tier) or 1
    local glory_min = tonumber(chest.glory_min) or 20
    local glory_max = tonumber(chest.glory_max) or 50
    local item_vnum = tonumber(chest.item_vnum) or 0
    local item_qty = tonumber(chest.item_quantity) or 1
    local item_chance = tonumber(chest.item_chance) or 0
    local color_code = chest.color_code or "GREEN"
    
    -- Calcola Gloria base (random tra min e max)
    local base_glory = math.random(glory_min, glory_max)
    
    -- === CHIAVE DIMENSIONALE: Bonus se attivo ===
    local has_key = false
    local force_bonus = game.get_event_flag("hq_force_chest_"..pid) or 0
    if force_bonus == 1 then
        base_glory = math.floor(base_glory * 1.5)  -- +50% Gloria
        item_chance = item_chance + 30  -- +30% chance item
        game.set_event_flag("hq_force_chest_"..pid, 0)  -- Consuma
        has_key = true
    end
    -- ============================================
    
    -- ============================================================
    -- ITEM BASE (item garantito dalla tabella hunter_chest_rewards)
    -- ============================================================
    local got_item = false
    local item_name_str = ""
    if item_vnum > 0 and item_chance > 0 then
        local roll = math.random(1, 100)
        if roll <= item_chance then
            pc.give_item2(item_vnum, item_qty)
            got_item = true
            item_name_str = hg_lib.item_name(item_vnum) or "Oggetto Raro"
            if item_qty > 1 then
                item_name_str = item_name_str .. " x" .. item_qty
            end
        end
    end
    
    -- ============================================================
    -- SISTEMA JACKPOT (hunter_chest_loot)
    -- Possibilita' di ottenere Gloria extra o Item rari
    -- ============================================================
    local jackpot_glory = 0
    local jackpot_items = ""
    local jackpot_items_list = {}
    
    -- Query per possibili jackpot (filtrati per rank_tier del baule)
    local jq = "SELECT id, loot_type, item_vnum, item_quantity, glory_min, glory_max, drop_chance, name, is_jackpot "
    jq = jq .. "FROM srv1_hunabku.hunter_chest_loot "
    jq = jq .. "WHERE enabled=1 AND min_rank_tier <= " .. rank_tier .. " "
    jq = jq .. "AND (chest_vnum = 0 OR chest_vnum = " .. chest_vnum .. ") "
    jq = jq .. "ORDER BY drop_chance ASC"  -- Prima i piu' rari
    
    local jc, jd = mysql_direct_query(jq)
    
    if jc > 0 and jd then
        for i = 1, jc do
            local loot = jd[i]
            local drop_roll = math.random(1, 100)
            local drop_chance = tonumber(loot.drop_chance) or 0
            
            -- Chiave dimensionale aumenta chance jackpot
            if has_key then
                drop_chance = drop_chance + 15
            end
            
            if drop_roll <= drop_chance then
                local loot_type = loot.loot_type
                local is_jackpot = tonumber(loot.is_jackpot) or 0
                
                if loot_type == "GLORY" then
                    -- JACKPOT GLORIA
                    local g_min = tonumber(loot.glory_min) or 100
                    local g_max = tonumber(loot.glory_max) or 500
                    local bonus_glory = math.random(g_min, g_max)
                    jackpot_glory = jackpot_glory + bonus_glory
                    
                    -- Assegna subito la gloria bonus
                    hg_lib.award_glory_to_player(pid, bonus_glory)
                    
                elseif loot_type == "ITEM" then
                    -- JACKPOT ITEM
                    local j_vnum = tonumber(loot.item_vnum) or 0
                    local j_qty = tonumber(loot.item_quantity) or 1
                    local j_name = loot.name or "Item Raro"
                    
                    if j_vnum > 0 then
                        pc.give_item2(j_vnum, j_qty)
                        table.insert(jackpot_items_list, j_name)
                    end
                end
            end
        end
    end
    
    -- Prepara stringa item jackpot per client
    if table.getn(jackpot_items_list) > 0 then
        jackpot_items = table.concat(jackpot_items_list, ", ")
    end
    
    -- ============================================================
    -- DISTRIBUZIONE GLORIA
    -- In party: solo chi apre riceve (semplificato per compatibilita')
    -- ============================================================
    local final_glory = hg_lib.apply_solo_chest_modifiers(pid, base_glory)
    
    -- Assegna Gloria base a chi ha aperto
    hg_lib.award_glory_to_player(pid, final_glory)
    
    -- Security Log: Chest opened
    hg_lib.log_chest_open(chest_name, final_glory, got_item and item_name_str or "none")
    
    -- Statistiche
    pc.setqf("hq_pending_chests", (pc.getqf("hq_pending_chests") or 0) + 1)
    
    -- PERFORMANCE: Accumula Trial progress invece di query immediata
    hg_lib.add_trial_progress("chest_open", 1)
    
    -- EFFETTO EPICO CLIENT 
    -- Formato: vnum|glory|name|color|itemName|jackpotGlory|jackpotItems
    local effect_data = chest_vnum .. "|" .. final_glory .. "|" .. hg_lib.clean_str(chest_name) .. "|" .. color_code
    effect_data = effect_data .. "|" .. (got_item and hg_lib.clean_str(item_name_str) or "")
    effect_data = effect_data .. "|" .. jackpot_glory
    effect_data = effect_data .. "|" .. (jackpot_items ~= "" and hg_lib.clean_str(jackpot_items) or "")
    
    -- Invia effetto a TUTTI i membri del party
    hg_lib.party_cmdchat("HunterChestOpened " .. effect_data)
    
    -- Messaggio chiave dimensionale (solo se usata)
    if has_key then
        hg_lib.syschat_t("DIMKEY_TREASURE", "Tesoro nascosto rivelato!", nil, "FFD700")
    end

    -- Notifica party (semplice)
    if party.is_party() then
        syschat("|cff00A8FF[" .. hg_lib.get_text("SYSTEM", nil, "SISTEMA") .. "]|r " .. hg_lib.get_text("CHEST_OPENED", {NAME = chest_name, PTS = final_glory}, "Hai aperto " .. chest_name .. " - +" .. final_glory .. " Gloria"))
        if jackpot_glory > 0 then
            syschat("|cffFF00FF*** JACKPOT! +|r|cffFFD700" .. jackpot_glory .. " " .. hg_lib.get_text("GLORY_EXTRA", nil, "Gloria Extra") .. "!|r")
        end
        if jackpot_items ~= "" then
            syschat("|cffFF00FF*** BONUS! |r|cff00FF00" .. jackpot_items .. "|r")
        end
    end
    
    -- Verifica completamento trial
    hg_lib.check_trial_completion_status()
    
    -- Aggiorna dati client
    hg_lib.send_player_data()
end

-- Applica modificatori solo player per bauli
-- OTTIMIZZATO: Usa calculate_glory_with_modifiers centralizzata
function hg_lib.apply_solo_chest_modifiers(player_id, base_glory)
    -- USA FUNZIONE CENTRALIZZATA per calcolo modificatori
    local final_glory, modifier_log = hg_lib.calculate_glory_with_modifiers(base_glory, {player_id = player_id})

    -- Mostra syschat dettagliato
    hg_lib.show_glory_details("BAULE", "Tesoro", base_glory, final_glory, modifier_log)

    return final_glory
end

-- Distribuisce Gloria baule al party per meritocrazia
-- NOTA: Semplificata - gloria va solo a chi apre (party.for_each_member non disponibile)
function hg_lib.distribute_chest_glory(base_glory, chest_name, color_code, got_item, item_name_str, opener_jackpot_glory, opener_jackpot_items)
    local opener_pid = pc.get_player_id()
    color_code = color_code or "GOLD"
    opener_jackpot_glory = opener_jackpot_glory or 0
    opener_jackpot_items = opener_jackpot_items or ""
    
    -- Solo chi apre riceve la gloria
    local grade = hg_lib.get_player_rank_grade(opener_pid)
    local final_glory = hg_lib.apply_solo_chest_modifiers(opener_pid, base_glory)
    
    -- Assegna
    hg_lib.award_glory_to_player(opener_pid, final_glory)
    
    local distribution_log = {{
        pid = opener_pid,
        name = pc.get_name(),
        grade = grade,
        power = hg_lib.POWER_RANK_VALUES[grade] or 1,
        share = 100,
        final = final_glory
    }}
    
    -- Effetto client
    local effect_data = "0|" .. final_glory .. "|" .. hg_lib.clean_str(chest_name) .. "|" .. color_code
    effect_data = effect_data .. "|" .. (got_item and hg_lib.clean_str(item_name_str) or "")
    effect_data = effect_data .. "|" .. opener_jackpot_glory
    effect_data = effect_data .. "|" .. (opener_jackpot_items ~= "" and hg_lib.clean_str(opener_jackpot_items) or "")
    cmdchat("HunterChestOpened " .. effect_data)
    
    -- Notifica
    syschat("|cff00A8FF[" .. hg_lib.get_text("SYSTEM", nil, "SISTEMA") .. "]|r " .. chest_name .. " - |cffFFD700+" .. final_glory .. " " .. hg_lib.get_text("GLORY", nil, "Gloria") .. "|r")
    if opener_jackpot_glory > 0 then
        syschat("|cffFF00FF*** JACKPOT! +|r|cffFFD700" .. opener_jackpot_glory .. " " .. hg_lib.get_text("GLORY_EXTRA", nil, "Gloria Extra") .. "!|r")
    end
    if opener_jackpot_items ~= "" then
        syschat("|cffFF00FF*** BONUS! |r|cff00FF00" .. opener_jackpot_items .. "|r")
    end

    return distribution_log
end
-- ============================================================
-- FINE SISTEMA BAULI
-- ============================================================

function hg_lib.give_chest_reward()
    local pid = pc.get_player_id()
    local c, d = mysql_direct_query("SELECT item_vnum, item_quantity, bonus_points FROM srv1_hunabku.hunter_quest_jackpot_rewards WHERE type_name='BAULE' ORDER BY RAND() LIMIT 1")

    if c > 0 and d[1] then
        local v, q, b = tonumber(d[1].item_vnum), tonumber(d[1].item_quantity), tonumber(d[1].bonus_points) or 0
        pc.give_item2(v, q)

        local msg = hg_lib.get_text("CHEST_OPENED_ITEM", {ITEM = hg_lib.item_name(v)}, "BAULE APERTO: OTTENUTO " .. hg_lib.item_name(v))
        hg_lib.hunter_speak(msg)

        -- === CHIAVE DIMENSIONALE: Forza bonus se flag attivo ===
        local force_bonus = game.get_event_flag("hq_force_chest_"..pid) or 0
        if force_bonus == 1 then
            if b == 0 or b == nil then
                b = math.random(500, 2000)  -- Garantisce bonus se non c'era
            else
                b = math.floor(b * 1.5)  -- Aumenta bonus esistente del 50%
            end
            game.set_event_flag("hq_force_chest_"..pid, 0)  -- Consuma il buff
            hg_lib.syschat_t("DIMKEY_TREASURE", "Tesoro nascosto rivelato!", nil, "FFD700")
        end
        -- === FINE CHIAVE DIMENSIONALE ===
        
        if b > 0 then
            mysql_direct_query("UPDATE srv1_hunabku.hunter_quest_ranking SET total_points=total_points+"..b..", spendable_points=spendable_points+"..b.." WHERE player_id="..pid)
            local bonus_msg = hg_lib.get_text("chest_bonus", {POINTS = b}) or ("Incredibile! Il baule conteneva anche " .. b .. " Gloria!")
            syschat("|cffFFD700[BONUS]|r " .. bonus_msg)
        end

        -- PERFORMANCE: Accumula Trial progress invece di query immediata
        hg_lib.add_trial_progress("chest_open", 1)
        -- ==========================
    end
end

-- ============================================================
-- CACHE ACHIEVEMENTS - Carica una volta, check locale
-- ============================================================
_G.hunter_achievements_cache = nil
_G.hunter_achievements_cache_time = 0

function hg_lib.check_achievements()
    local k, p = pc.getqf("hq_total_kills") or 0, pc.getqf("hq_total_points") or 0
    
    -- PERFORMANCE: Cache achievements config per 10 minuti
    local now = get_time()
    if not _G.hunter_achievements_cache or (now - _G.hunter_achievements_cache_time) > 600 then
        local c, d = mysql_direct_query("SELECT id, type, requirement FROM srv1_hunabku.hunter_quest_achievements_config WHERE enabled=1")
        if c > 0 then
            _G.hunter_achievements_cache = d
            _G.hunter_achievements_cache_time = now
        else
            return
        end
    end
    
    local u = 0
    local d = _G.hunter_achievements_cache
    if d then
        for i=1,table.getn(d) do
            local aid, at, req = tonumber(d[i].id), tonumber(d[i].type), tonumber(d[i].requirement)
            local prg = p
            if at == 1 then prg = k end
            if prg >= req and pc.getqf("hq_ach_clm_" .. aid) ~= 1 then 
                u = u + 1 
            end
        end
    end
    if u > 0 then 
        local msg = hg_lib.get_text("achievements_unlocked", {COUNT = u}) or ("TRAGUARDI SBLOCCATI: " .. u)
        hg_lib.hunter_speak(msg)
    end
end

-- ============================================================
-- CACHE FRACTURES - Carica lista fratture una volta
-- ============================================================
_G.hunter_fractures_cache = nil
_G.hunter_fractures_cache_time = 0

function hg_lib.get_fractures_cached()
    local now = get_time()
    if not _G.hunter_fractures_cache or (now - _G.hunter_fractures_cache_time) > 300 then
        local c, d = mysql_direct_query("SELECT vnum, name, rank_label, spawn_chance, req_points, color_code FROM srv1_hunabku.hunter_quest_fractures WHERE enabled=1 ORDER BY spawn_chance DESC")
        if c > 0 then
            _G.hunter_fractures_cache = {count = c, data = d}
            _G.hunter_fractures_cache_time = now
        end
    end
    return _G.hunter_fractures_cache
end

function hg_lib.spawn_fracture()
    local pid = pc.get_player_id()
    local map_index = pc.get_map_index()
    local is_in_dungeon = hg_lib.is_dungeon_map(map_index)
    
    -- === CALIBRATORE: Controlla se c'e' un rank minimo forzato ===
    local calibrator_active = game.get_event_flag("hq_fracture_rank_"..pid) or 0
    local use_calibrator = false
    if calibrator_active == 1 then
        use_calibrator = true
        game.set_event_flag("hq_fracture_rank_"..pid, 0)  -- Consuma il buff
        syschat("|cffFF6600[" .. hg_lib.get_text("CALIBRATOR", nil, "CALIBRATORE") .. "]|r " .. hg_lib.get_text("CALIBRATOR_ACTIVE_MSG", nil, "Filtro attivo: Rango C+ garantito!"))
    end
    -- ==============================================================
    
    -- PERFORMANCE: Usa cache invece di query diretta
    local cached = hg_lib.get_fractures_cached()
    if not cached then return end
    local c, d = cached.count, cached.data
    if c == 0 then return end
        
    local roll = number(1, 100)
    local evt_name = hg_lib.get_active_event()
    if evt_name == "RED+MOON" then 
        roll = number(50, 100) 
    end
    local sel_vnum, sel_rank, sel_color, cumul = 16060, "E-Rank", "GREEN", 0
    local found = false
    
    for i = 1, c do 
        local rank_label = d[i].rank_label or ""
        local skip_this = false
        
        -- Se calibratore attivo, salta fratture sotto rank C
        if use_calibrator then
            if not (string.find(rank_label, "C") or string.find(rank_label, "B") or string.find(rank_label, "A") or string.find(rank_label, "S")) then
                skip_this = true
            end
        end
        
        -- DUNGEON RESTRICTION: In dungeon, max rank C (skip B, A, S, N)
        if is_in_dungeon and not hg_lib.is_rank_allowed_in_dungeon(rank_label) then
            skip_this = true
        end
        
        if not skip_this then
            cumul = cumul + tonumber(d[i].spawn_chance)
            if roll <= cumul then 
                sel_vnum = tonumber(d[i].vnum)
                sel_rank = rank_label
                sel_color = d[i].color_code or "PURPLE"
                found = true
                break 
            end
        end
    end
        
    local x, y = pc.get_local_x(), pc.get_local_y()
    mob.spawn(sel_vnum, x + 3, y + 3, 1)
    local msg = hg_lib.get_text("fracture_detected", {RANK = sel_rank}) or ("ATTENZIONE: FRATTURA " .. sel_rank .. " RILEVATA.")
    hg_lib.hunter_speak_color(msg, sel_color)
end

-- Aggiunge un ping visivo alla posizione di una frattura evocata
-- Usato dagli items per indicare dove e' apparsa la frattura
function hg_lib.add_fracture_ping(x, y)
    -- Notifica visiva al client (il client mostrera' un effetto sulla minimappa o un marcatore)
    cmdchat("HunterFracturePing " .. x .. " " .. y)
end

function hg_lib.open_gate(fname, frank, fcolor, pid)
    if pc.getqf("hq_emerg_active") == 1 then
        syschat("|cffFF0000[" .. hg_lib.get_text("CONFLICT", nil, "CONFLITTO") .. "]|r " .. hg_lib.get_text("CONFLICT_EMERGENCY", nil, "Completa prima l'Emergency Quest in corso!"))
        return
    end
    if pc.getqf("hq_defense_active") == 1 then
        syschat("|cffFF0000[" .. hg_lib.get_text("CONFLICT", nil, "CONFLITTO") .. "]|r " .. hg_lib.get_text("CONFLICT_DEFENSE", nil, "Stai gia' difendendo un'altra frattura!"))
        return
    end

    -- Prova npc.get_vid(), se fallisce usa il VID salvato dal click
    local fracture_vid = npc.get_vid()
    if fracture_vid == nil or fracture_vid == 0 then
        fracture_vid = pc.getqf("hq_temp_gate_vid") or 0
    end

    if fracture_vid == 0 then
        syschat("|cffFF0000[" .. hg_lib.get_text("ERROR", nil, "ERRORE") .. "]|r " .. hg_lib.get_text("ERROR_IDENTIFY_FRACTURE", nil, "Impossibile identificare la frattura!"))
        return
    end

    -- === SIGILLO DI CONQUISTA: Salta la difesa e apre direttamente ===
    local force_conquest = game.get_event_flag("hq_force_conquest_"..pid) or 0
    if force_conquest == 1 then
        game.set_event_flag("hq_force_conquest_"..pid, 0)  -- Consuma il buff
        syschat("|cffFFD700[" .. hg_lib.get_text("SEAL_OF_CONQUEST", nil, "SIGILLO DI CONQUISTA") .. "]|r " .. hg_lib.get_text("SEAL_INSTANT_OPEN", nil, "La frattura si apre istantaneamente!"))
        
        -- Salva i dati per finalize
        if not hunter_defense_data then hunter_defense_data = {} end
        hunter_defense_data[pid] = { rank = frank, fname = fname, color = fcolor }
        
        -- Completa direttamente senza difesa
        hg_lib.finalize_gate_opening(fracture_vid)
        return
    end
    -- === FINE SIGILLO DI CONQUISTA ===
    
    game.set_event_flag("hq_gate_lock_"..fracture_vid, pid)
    game.set_event_flag("hq_gate_time_"..fracture_vid, get_time() + 90)

    hg_lib.load_defense_waves_cache(frank)

    local fx, fy = pc.get_local_x(), pc.get_local_y()
    
    -- Security Log: Defense started
    hg_lib.log_defense_start(fracture_vid, frank)

    pc.setqf("hq_defense_x", fx)
    pc.setqf("hq_defense_y", fy)
    pc.setqf("hq_defense_active", 1)
    pc.setqf("hq_defense_start", get_time())
    pc.setqf("hq_defense_wave", 0)
    pc.setqf("hq_defense_last_check", get_time())
    pc.setqf("hq_defense_fracture_vid", fracture_vid)

    if not hunter_defense_data then hunter_defense_data = {} end
    hunter_defense_data[pid] = { rank = frank, fname = fname, color = fcolor }

    -- Calcola il totale mob richiesti per questo rank
    local total_mobs_req = hg_lib.get_defense_total_mobs(frank)
    
    -- Se total_mobs_req = 0, ricarica la cache
    if total_mobs_req == 0 then
        hg_lib.load_defense_waves_cache(frank)
        total_mobs_req = hg_lib.get_defense_total_mobs(frank)
    end
    
    -- NOTA: total_mobs_req iniziale = 0, poi viene incrementato da ogni wave
    -- Settiamo a 0 e lasciamo che le wave aggiornino il totale
    pc.setqf("hq_defense_mob_req", 0)   
    pc.setqf("hq_defense_mob_killed", 0) 

    -- Durata difesa in base al rank (E/D/C = 60s, B+ aumenta)
    local duration = hg_lib.get_defense_duration_by_rank(frank)
    pc.setqf("hq_defense_duration", duration)

    -- SEMPRE: Setta flag globali basate sul VID (funziona sia SOLO che PARTY)
    -- NOTA: hq_defense_req inizia a 0, viene incrementato da ogni wave spawn
    local rank_idx = hg_lib.get_rank_index_by_letter(frank)
    game.set_event_flag("hq_defense_rank_" .. fracture_vid, rank_idx)
    game.set_event_flag("hq_defense_killed_" .. fracture_vid, 0)
    game.set_event_flag("hq_defense_req_" .. fracture_vid, 0)  -- INIZIA A 0, le wave incrementeranno
    
    -- PARTY: Attiva difesa su TUTTI i membri con TUTTI i flag necessari
    if party.is_party() then
        -- USA LEADER_PID per la flag party (cosi' tutti i membri possono trovarla!)
        local leader_pid = party.get_leader_pid()
        game.set_event_flag("hq_party_defense_vid_" .. leader_pid, fracture_vid)
        
        local pids = {party.get_member_pids()}
        for i, member_pid in ipairs(pids) do
            -- Setta su TUTTI i membri (incluso chi ha cliccato per ultimo)
            q.begin_other_pc_block(member_pid)
            
            -- Flag difesa attiva
            pc.setqf("hq_defense_active", 1)
            pc.setqf("hq_defense_start", get_time())
            pc.setqf("hq_defense_fracture_vid", fracture_vid)
            
            -- Flag posizione (centro difesa)
            pc.setqf("hq_defense_x", fx)
            pc.setqf("hq_defense_y", fy)
            
            -- Flag wave e kill (ogni membro tiene traccia locale)
            pc.setqf("hq_defense_wave", 0)
            pc.setqf("hq_defense_last_check", get_time())
            pc.setqf("hq_defense_mob_req", 0)
            pc.setqf("hq_defense_mob_killed", 0)
            pc.setqf("hq_defense_duration", duration)
            
            q.end_other_pc_block()
        end
        
        -- Salva anche i dati defense per tutti
        if not hunter_defense_data then hunter_defense_data = {} end
        for i, member_pid in ipairs(pids) do
            hunter_defense_data[member_pid] = { rank = frank, fname = fname, color = fcolor }
        end
    end

    local defense_label = hg_lib.get_text("DEFENSE", nil, "DIFESA")
    local defense_title = defense_label .. " " .. fname
    -- Invia popup a TUTTI i membri del party
    hg_lib.party_cmdchat("HunterEmergency " .. hg_lib.clean_str(defense_title) .. "|" .. duration .. "|" .. total_mobs_req .. "|0")

    local msg = hg_lib.get_text("defense_start", {SECONDS = duration}, "UCCIDI TUTTI I MOB! Hai " .. duration .. " secondi!")
    hg_lib.hunter_speak_color(msg, fcolor)

    -- Notifica party
    if party.is_party() then
        local party_msg = "[HUNTER] " .. hg_lib.get_text("defense_start", {SECONDS = duration}, "UCCIDI TUTTI I MOB! Hai " .. duration .. " secondi!")
        party.syschat(party_msg)
    end

    cleartimer("hq_defense_timer")
    loop_timer("hq_defense_timer", 1)
end

-- Invia cmdchat a tutti i membri del party (o solo al player se solo)
function hg_lib.party_cmdchat(cmd)
    if party.is_party() then
        -- Invia a tutti i membri del party
        local pids = {party.get_member_pids()}
        for i, pid in ipairs(pids) do
            q.begin_other_pc_block(pid)
            cmdchat(cmd)
            q.end_other_pc_block()
        end
    else
        -- Solo player
        cmdchat(cmd)
    end
end

-- Invia hunter_speak_color a tutti i membri del party (o solo al player se solo)
function hg_lib.party_hunter_speak_color(msg, color)
    if party.is_party() then
        -- Invia a tutti i membri del party
        local pids = {party.get_member_pids()}
        for i, pid in ipairs(pids) do
            q.begin_other_pc_block(pid)
            cmdchat("HunterSystemSpeak " .. (color or "WHITE") .. "|" .. hg_lib.clean_str(msg))
            q.end_other_pc_block()
        end
    else
        -- Solo player
        hg_lib.hunter_speak_color(msg, color)
    end
end

-- Durata difesa in base al rank della frattura
function hg_lib.get_defense_duration_by_rank(rank_grade)
    rank_grade = hg_lib.validate_rank(rank_grade)
    
    -- Prova a leggere dal DB (defense_duration_X)
    local key = "defense_duration_" .. rank_grade
    local q = "SELECT config_value FROM srv1_hunabku.hunter_fracture_defense_config WHERE config_key='" .. key .. "'"
    local c, d = mysql_direct_query(q)
    if c > 0 and d[1] then
        return tonumber(d[1].config_value) or 60
    end
    
    -- Fallback: valori hardcoded
    local durations = {
        E = 60,   -- Base
        D = 60,   -- Base
        C = 60,   -- Base
        B = 90,   -- +30 sec
        A = 120,  -- +60 sec (2 min)
        S = 150,  -- +90 sec (2.5 min)
        N = 180   -- +120 sec (3 min)
    }
    return durations[rank_grade] or 60
end

function hg_lib.get_defense_config(key, default_val)
    local q = "SELECT config_value FROM srv1_hunabku.hunter_fracture_defense_config WHERE config_key='" .. key .. "'"
    local c, d = mysql_direct_query(q)
    if c > 0 and d[1] then
        return tonumber(d[1].config_value) or default_val
    end
    return default_val
end

function hg_lib.check_defense_distance()
    local fx = pc.getqf("hq_defense_x") or 0
    local fy = pc.getqf("hq_defense_y") or 0
    if fx == 0 and fy == 0 then return false end
    local px, py = pc.get_local_x(), pc.get_local_y()
    local dx = px - fx
    local dy = py - fy
    local dist = math.sqrt(dx * dx + dy * dy)
    local max_dist = hg_lib.get_defense_config("check_distance", 10)
    return dist <= max_dist
end

-- Controlla distanza di TUTTI i membri del party dalla frattura
-- Ritorna: ok (bool), nome_lontano (string o nil)
function hg_lib.check_party_defense_distance()
    local fracture_vid = pc.getqf("hq_defense_fracture_vid") or 0
    if fracture_vid == 0 then return false, nil end
    
    local fx = pc.getqf("hq_defense_x") or 0
    local fy = pc.getqf("hq_defense_y") or 0
    if fx == 0 and fy == 0 then return false, nil end
    
    local max_dist = hg_lib.get_defense_config("check_distance", 10)
    
    -- Se NON in party, controlla solo il player corrente
    if not party.is_party() then
        local px, py = pc.get_local_x(), pc.get_local_y()
        local dx = px - fx
        local dy = py - fy
        local dist = math.sqrt(dx * dx + dy * dy)
        if dist > max_dist then
            return false, pc.get_name()
        end
        return true, nil
    end
    
    -- IN PARTY: Controlla TUTTI i membri
    local pids = {party.get_member_pids()}
    for i, member_pid in ipairs(pids) do
        q.begin_other_pc_block(member_pid)
        
        -- Verifica che il membro sia nella stessa mappa
        local member_map = pc.get_map_index()
        local leader_map = 0
        q.end_other_pc_block()
        
        -- Riprendi il contesto del leader per la mappa
        leader_map = pc.get_map_index()
        
        q.begin_other_pc_block(member_pid)
        member_map = pc.get_map_index()
        
        -- Se il membro e' in una mappa diversa, e' considerato lontano
        if member_map ~= leader_map then
            local member_name = pc.get_name()
            q.end_other_pc_block()
            return false, member_name
        end
        
        -- Controlla distanza del membro
        local mx, my = pc.get_local_x(), pc.get_local_y()
        local member_name = pc.get_name()
        q.end_other_pc_block()
        
        local dx = mx - fx
        local dy = my - fy
        local dist = math.sqrt(dx * dx + dy * dy)
        
        if dist > max_dist then
            return false, member_name
        end
    end
    
    return true, nil
end

function hg_lib.spawn_defense_wave(wave_num, rank_grade)
    local ok, err = pcall(function()
        rank_grade = hg_lib.validate_rank(rank_grade)

        if not _G.hunter_defense_waves_cache or not _G.hunter_defense_waves_cache[rank_grade] then
            return
        end

        local wave_data = _G.hunter_defense_waves_cache[rank_grade][wave_num]
        if not wave_data or not wave_data.mobs then return end

        local fx = pc.getqf("hq_defense_x") or 0
        local fy = pc.getqf("hq_defense_y") or 0
        
        local current_req = pc.getqf("hq_defense_mob_req") or 0
        local added_req = 0

        for i, mob_info in ipairs(wave_data.mobs) do
            local vnum = mob_info.vnum or 0
            local count = mob_info.count or 1
            local radius = mob_info.radius or 7

            if count > 0 and vnum > 0 then
                local buffer = 2 
                local actual_spawn = count + buffer
                
                added_req = added_req + count
                
                for j = 1, actual_spawn do
                    local angle = (360 / actual_spawn) * j
                    local rad = math.rad(angle)
                    local sx = fx + math.floor(math.cos(rad) * radius)
                    local sy = fy + math.floor(math.sin(rad) * radius)
                    mob.spawn(vnum, sx, sy, 1)
                end
            end
        end
        
        pc.setqf("hq_defense_mob_req", current_req + added_req)
        
        -- CRITICO: Aggiorna ANCHE la flag globale (usata dal timer e kill counter)
        local fracture_vid = pc.getqf("hq_defense_fracture_vid") or 0
        if fracture_vid > 0 then
            local global_req = game.get_event_flag("hq_defense_req_" .. fracture_vid) or 0
            game.set_event_flag("hq_defense_req_" .. fracture_vid, global_req + added_req)
        end
        
        local msg = hg_lib.get_text("defense_wave_spawn", {WAVE = wave_num}) or ("ONDATA " .. wave_num .. "! DIFENDITI!")
        local fcolor = "RED"
        if hunter_defense_data and hunter_defense_data[pc.get_player_id()] then
            fcolor = hunter_defense_data[pc.get_player_id()].color
        end
        hg_lib.hunter_speak_color(msg, fcolor)
        
        -- Notifica party dell'ondata
        if party.is_party() then
            local wave_msg = hg_lib.get_text("WAVE_NOTIFICATION", {WAVE = wave_num, MOBS = added_req}, "ONDATA " .. wave_num .. "! +" .. added_req .. " mob!")
            party.syschat("[HUNTER] " .. wave_msg)
        end
    end)
end

function hg_lib.is_valid_defense_mob(rank_grade, vnum)
    local clean_rank = string.sub(rank_grade, 1, 1)
    clean_rank = hg_lib.validate_rank(clean_rank)

    if not _G.hunter_defense_waves_cache or not _G.hunter_defense_waves_cache[clean_rank] then
        hg_lib.load_defense_waves_cache(clean_rank)
    end
    
    local waves = _G.hunter_defense_waves_cache[clean_rank]
    if not waves then 
        return false 
    end
    
    for w_num, w_data in pairs(waves) do
        if w_data.mobs then
            for _, m_info in ipairs(w_data.mobs) do
                if tonumber(m_info.vnum) == tonumber(vnum) then
                    return true
                end
            end
        end
    end
    
    return false
end

-- FIX: Aggiunto salvataggio timestamp vittoria per logica 5 minuti
function hg_lib.complete_defense_success()
    local pid = pc.get_player_id()
    local fracture_vid = pc.getqf("hq_defense_fracture_vid") or 0

    local fname = "Frattura"
    local fcolor = "PURPLE"
    local frank = "E"
    if hunter_defense_data and hunter_defense_data[pid] then
        fname = hunter_defense_data[pid].fname
        fcolor = hunter_defense_data[pid].color
        frank = hunter_defense_data[pid].rank or "E"
    end
    
    -- Security Log: Defense completed
    hg_lib.log_info("DEFENSE", "DEFENSE_SUCCESS", 
        string.format("fracture_vid=%d rank=%s", fracture_vid, frank))

    pc.setqf("hq_defense_active", 0)
    cleartimer("hq_defense_timer")
    
    -- Invia chiusura popup a tutto il party
    hg_lib.party_cmdchat("HunterEmergencyClose success")
    
    -- Reset flag su TUTTI i membri del party
    if party.is_party() then
        local success_msg = hg_lib.get_text("DEFENSE_SUCCESS", nil, "[HUNTER] DIFESA COMPLETATA CON SUCCESSO!")
        party.syschat(success_msg)
        
        local pids = {party.get_member_pids()}
        for i, member_pid in ipairs(pids) do
            q.begin_other_pc_block(member_pid)
            pc.setqf("hq_defense_active", 0)
            pc.setqf("hq_defense_fracture_vid", 0)
            pc.setqf("hq_defense_x", 0)
            pc.setqf("hq_defense_y", 0)
            pc.setqf("hq_defense_wave", 0)
            pc.setqf("hq_defense_mob_req", 0)
            pc.setqf("hq_defense_mob_killed", 0)
            q.end_other_pc_block()
            
            -- Pulisci hunter_defense_data per questo membro
            if hunter_defense_data and hunter_defense_data[member_pid] then
                hunter_defense_data[member_pid] = nil
            end
        end
    end

    if fracture_vid > 0 then
        game.set_event_flag("hq_gate_lock_"..fracture_vid, 0)   
        game.set_event_flag("hq_gate_conq_"..fracture_vid, pid) 
        -- FIX: Salva timestamp vittoria per scadenza 5 minuti
        game.set_event_flag("hq_gate_conq_time_"..fracture_vid, get_time())
        
        -- FIX: Salva rank e color per finalize_gate_opening (che viene chiamata DOPO la pulizia)
        local rank_idx_map = {E=0, D=1, C=2, B=3, A=4, S=5, N=6}
        game.set_event_flag("hq_gate_data_rank_"..fracture_vid, rank_idx_map[frank] or 0)
        -- Color index: PURPLE=0, BLUE=1, GREEN=2, YELLOW=3, ORANGE=4, RED=5, BLACK=6
        local color_idx_map = {PURPLE=0, BLUE=1, GREEN=2, YELLOW=3, ORANGE=4, RED=5, BLACK=6}
        game.set_event_flag("hq_gate_data_color_"..fracture_vid, color_idx_map[fcolor] or 0)
        
        -- CLEANUP: Pulisci flag globali della difesa
        game.set_event_flag("hq_defense_rank_"..fracture_vid, 0)
        game.set_event_flag("hq_defense_killed_"..fracture_vid, 0)
        game.set_event_flag("hq_defense_req_"..fracture_vid, 0)
        -- Pulisci flag party (usa leader_pid se in party)
        if party.is_party() then
            local leader_pid = party.get_leader_pid()
            game.set_event_flag("hq_party_defense_vid_"..leader_pid, 0)
        end
    end

    hg_lib.check_overtake(pid, pc.get_name(), "total_fractures", 1, "ESPLORATORI")
    pc.setqf("hq_pending_fractures", (pc.getqf("hq_pending_fractures") or 0) + 1)
    pc.setqf("hq_elite_spawn_time", get_time())
    pc.setqf("hq_pending_elite", (pc.getqf("hq_pending_elite") or 0) + 1)

    local msg = hg_lib.get_text("defense_success_click", nil, "FRATTURA CONQUISTATA! Hai 5 minuti per aprirla!")
    hg_lib.party_hunter_speak_color(msg, fcolor)
    local touch_msg = hg_lib.get_text("TOUCH_PORTAL", nil, "TOCCA IL PORTALE!")
    hg_lib.party_cmdchat("HunterSystemSpeak " .. fcolor .. "|" .. hg_lib.clean_str(touch_msg))
    
    -- Registra partecipazione automatica all'evento (se attivo)
    hg_lib.register_event_participant()
    
    -- CHECK: Se evento "first_rift" attivo, il PRIMO a conquistare vince!
    hg_lib.check_first_rift_winner()
end

function hg_lib.fail_defense(reason)
    local pid = pc.get_player_id()
    local fracture_vid = pc.getqf("hq_defense_fracture_vid") or 0
    
    -- Security Log: Defense failed
    hg_lib.log_info("DEFENSE", "DEFENSE_FAILED", 
        string.format("fracture_vid=%d reason=%s", fracture_vid, reason or "unknown"))
        
    local fcolor = "RED"
    local frank = "E"  -- Default rank
    
    -- PRIMA leggi il rank dalla event_flag (piu' affidabile)
    -- NOTA: rank_idx usa 0=E, 1=D, 2=C, 3=B, 4=A, 5=S, 6=N
    if fracture_vid > 0 then
        local rank_idx = game.get_event_flag("hq_defense_rank_"..fracture_vid) or 0
        local rank_letters = {[0]="E", [1]="D", [2]="C", [3]="B", [4]="A", [5]="S", [6]="N"}
        frank = rank_letters[rank_idx] or "E"
    end
    
    -- Fallback su hunter_defense_data se frank e' ancora E (potrebbe essere corretto o no)
    if hunter_defense_data and hunter_defense_data[pid] and hunter_defense_data[pid].rank then
        fcolor = hunter_defense_data[pid].color or "RED"
        local stored_rank = hunter_defense_data[pid].rank
        -- Usa hunter_defense_data solo se ha un rank diverso da E
        if stored_rank ~= "E" and stored_rank ~= "E-Rank" then
            frank = stored_rank
        end
    end
    
    -- Determina se la frattura deve essere distrutta o puo' essere riprovata
    -- E, D, C = puoi riprovare (frattura rimane)
    -- B, A, S, N = frattura distrutta (supporta sia "S" che "S-Rank")
    local destroy_on_fail = (
        frank == "B" or frank == "B-Rank" or 
        frank == "A" or frank == "A-Rank" or 
        frank == "S" or frank == "S-Rank" or 
        frank == "N" or frank == "N-Rank"
    )

    pc.setqf("hq_defense_active", 0)
    cleartimer("hq_defense_timer")
    
    -- Invia chiusura popup a tutto il party
    hg_lib.party_cmdchat("HunterEmergencyClose failed")
    
    -- Reset flag su TUTTI i membri del party
    if party.is_party() then
        if destroy_on_fail then
            local msg = hg_lib.get_text("DEFENSE_FAILED_DESTROYED", {REASON = reason, RANK = frank}, "[HUNTER] DIFESA FALLITA! " .. reason .. " - La Frattura Rank " .. frank .. " e' stata DISTRUTTA!")
            party.syschat(msg)
        else
            local msg = hg_lib.get_text("DEFENSE_FAILED_RETRY", {REASON = reason, RANK = frank}, "[HUNTER] DIFESA FALLITA! " .. reason .. " - La Frattura Rank " .. frank .. " e' ancora li, puoi riprovare!")
            party.syschat(msg)
        end
        
        local pids = {party.get_member_pids()}
        for i, member_pid in ipairs(pids) do
            q.begin_other_pc_block(member_pid)
            pc.setqf("hq_defense_active", 0)
            pc.setqf("hq_defense_fracture_vid", 0)
            pc.setqf("hq_defense_x", 0)
            pc.setqf("hq_defense_y", 0)
            pc.setqf("hq_defense_wave", 0)
            pc.setqf("hq_defense_mob_req", 0)
            pc.setqf("hq_defense_mob_killed", 0)
            q.end_other_pc_block()
            
            -- Pulisci hunter_defense_data per questo membro
            if hunter_defense_data and hunter_defense_data[member_pid] then
                hunter_defense_data[member_pid] = nil
            end
        end
    end

    if fracture_vid > 0 then
        game.set_event_flag("hq_gate_lock_"..fracture_vid, 0)
        game.set_event_flag("hq_gate_conq_"..fracture_vid, 0)
        -- CLEANUP: Pulisci flag globali della difesa
        game.set_event_flag("hq_defense_rank_"..fracture_vid, 0)
        game.set_event_flag("hq_defense_killed_"..fracture_vid, 0)
        game.set_event_flag("hq_defense_req_"..fracture_vid, 0)
        -- Pulisci flag party (usa leader_pid se in party)
        if party.is_party() then
            local leader_pid = party.get_leader_pid()
            game.set_event_flag("hq_party_defense_vid_"..leader_pid, 0)
        end
        pc.setqf("hq_defense_fracture_vid", 0)
        
        -- RANK-BASED DESTRUCTION:
        -- Solo rank B, A, S, N perdono la frattura al fallimento
        -- Rank E, D, C possono riprovare (frattura rimane)
        if destroy_on_fail then
            -- Marca la frattura come "da rimuovere"
            game.set_event_flag("hq_gate_destroy_"..fracture_vid, 1)
            
            -- Metodo 1: mob.kill (se disponibile)
            if mob and mob.kill then
                mob.kill(fracture_vid)
            end
            
            -- Metodo 2: purge_vid (alternativo)
            if purge_vid then
                purge_vid(fracture_vid)
            end
            
            -- Metodo 3: kill_mob_vid (alternativo)
            if kill_mob_vid then
                kill_mob_vid(fracture_vid)
            end
            
            -- Messaggio chiaro al player
            syschat("|cffFF0000============================================|r")
            hg_lib.syschat_t("DEFENSE_FAILED", "DIFESA FALLITA!", nil, "FF0000")
            hg_lib.syschat_t("DEFENSE_DESTROYED", "La Frattura {RANK} e' stata DISTRUTTA!", {RANK = frank}, "FF0000")
            hg_lib.syschat_t("DEFENSE_HIGH_RANK_WARNING1", "Le fratture di Rank B e superiori", nil, "FF6600")
            hg_lib.syschat_t("DEFENSE_HIGH_RANK_WARNING2", "vengono distrutte se fallisci la difesa.", nil, "FF6600")
            hg_lib.syschat_t("DEFENSE_SORRY", "Mi dispiace, Hunter. Buona caccia!", nil, "FFFF00")
            syschat("|cffFF0000============================================|r")
        else
            syschat("|cffFFFF00============================================|r")
            hg_lib.syschat_t("DEFENSE_FAILED", "DIFESA FALLITA!", nil, "FFFF00")
            hg_lib.syschat_t("DEFENSE_STILL_AVAILABLE", "La Frattura {RANK} e' ancora disponibile.", {RANK = frank}, "00FF00")
            hg_lib.syschat_t("DEFENSE_CAN_RETRY", "Puoi riprovare la difesa!", nil, "00FF00")
            syschat("|cffFFFF00============================================|r")
        end
    end

    if hunter_defense_data and hunter_defense_data[pid] then
        hunter_defense_data[pid] = nil
    end

    -- Messaggio finale differenziato per rank (NPC speak)
    local msg
    if destroy_on_fail then
        msg = hg_lib.get_text("defense_failed_destroyed") or ("DIFESA FALLITA! " .. reason .. " - Le fratture Rank " .. frank .. " e superiori vengono DISTRUTTE se fallisci!")
    else
        msg = hg_lib.get_text("defense_failed_retry") or ("DIFESA FALLITA! " .. reason .. " - La frattura Rank " .. frank .. " e' ancora li, puoi riprovare!")
    end
    hg_lib.hunter_speak_color(msg, "RED")
end

function hg_lib.spawn_gate_mob_and_alert(rank_label, fcolor)
    -- Converti rank_label in rank_tier numerico (1=E, 2=D, 3=C, 4=B, 5=A, 6=S, 7=N)
    local rank_tier_map = {
        ["E-Rank"] = 1, ["E"] = 1,
        ["D-Rank"] = 2, ["D"] = 2,
        ["C-Rank"] = 3, ["C"] = 3,
        ["B-Rank"] = 4, ["B"] = 4,
        ["A-Rank"] = 5, ["A"] = 5,
        ["S-Rank"] = 6, ["S"] = 6,
        ["N-Rank"] = 7, ["N"] = 7
    }
    local max_tier = rank_tier_map[rank_label] or 1
    
    -- PERFORMANCE: Cache spawn types per 5 minuti
    if not _G.hunter_spawn_types_cache or (get_time() - (_G.hunter_spawn_types_cache_time or 0)) > 300 then
        local tc, td = mysql_direct_query("SELECT type_name, probability FROM srv1_hunabku.hunter_quest_spawn_types WHERE enabled=1")
        if tc > 0 then
            local total = 0
            for i = 1, tc do total = total + tonumber(td[i].probability) end
            _G.hunter_spawn_types_cache = {count = tc, data = td, total = total}
            _G.hunter_spawn_types_cache_time = get_time()
        end
    end
    
    local cached_types = _G.hunter_spawn_types_cache
    if not cached_types then return end
    local c, d = cached_types.count, cached_types.data
    local total_prob = cached_types.total
    
    -- Se total_prob e 0, evita crash
    if total_prob <= 0 then total_prob = 1 end

    local roll = number(1, total_prob) -- Usa la somma reale, non 1000 fisso
    local cumul = 0
    local sel_type = d[1].type_name -- Default al primo disponibile
    
    for i = 1, c do 
        cumul = cumul + tonumber(d[i].probability)
        if roll <= cumul then 
            sel_type = d[i].type_name
            break 
        end 
    end
        
    local lv = pc.get_level()
    -- FILTRO PER RANK: spawna solo mob con rank_tier <= rango della frattura
    local q = "SELECT vnum, name, rank_color FROM srv1_hunabku.hunter_quest_spawns WHERE type_name='" .. sel_type .. "' AND enabled=1 AND rank_tier<=" .. max_tier .. " AND min_level<=" .. lv .. " AND max_level>=" .. lv .. " ORDER BY RAND() LIMIT 1"
    local mc, md = mysql_direct_query(q)
    
    -- Fallback: cerca qualsiasi livello ma sempre rispettando il rank
    if mc == 0 then 
        q = "SELECT vnum, name, rank_color FROM srv1_hunabku.hunter_quest_spawns WHERE type_name='" .. sel_type .. "' AND enabled=1 AND rank_tier<=" .. max_tier .. " ORDER BY RAND() LIMIT 1"
        mc, md = mysql_direct_query(q) 
    end
    
    -- Fallback estremo: se ancora nulla, prendi il mob piu basso di quel tipo
    if mc == 0 then 
        q = "SELECT vnum, name, rank_color FROM srv1_hunabku.hunter_quest_spawns WHERE type_name='" .. sel_type .. "' AND enabled=1 ORDER BY rank_tier ASC LIMIT 1"
        mc, md = mysql_direct_query(q) 
    end
        
    if mc > 0 and md[1] then
        local mob_name = md[1].name
        if not mob_name or mob_name == "" then mob_name = "Bersaglio Misterioso" end

        local x, y = pc.get_local_x(), pc.get_local_y()
        local spawned_vnum = tonumber(md[1].vnum)
        mob.spawn(spawned_vnum, x + 5, y + 5, 1)

        local mob_color = md[1].rank_color or "PURPLE"

        if sel_type == "BAULE" then
            local msg = hg_lib.get_text("spawn_chest_detected") or "BAULE DEL TESORO RILEVATO!"
            -- Notifica tutto il party
            hg_lib.party_hunter_speak_color(msg, fcolor or "GOLD")
        else
            -- Gestione Boss/Metin
            local msg = "*** MINACCIA RILEVATA: " .. mob_name .. " [" .. rank_label .. "] ***"
            -- Notifica tutto il party
            hg_lib.party_hunter_speak_color(msg, mob_color)

            if sel_type == "BOSS" or sel_type == "SUPER_METIN" then
                -- Invia alert a TUTTI i membri del party
                hg_lib.party_cmdchat("HunterBossAlert " .. string.gsub(mob_name, " ", "+"))
            end
            
            -- Logica Speed Kill
            local emergency_title = ""
            local emergency_seconds = 0
            local bonus_points = 0
            
            if sel_type == "BOSS" then
                emergency_title = "UCCIDI: "..mob_name
                emergency_seconds = 60
                local db_val = hg_lib.get_config("speedkill_boss_bonus_pts")
                if db_val <= 0 then db_val = 300 end
                bonus_points = db_val
            elseif sel_type == "SUPER_METIN" then
                emergency_title = "DISTRUGGI: "..mob_name
                emergency_seconds = 300
                local db_val = hg_lib.get_config("speedkill_metin_bonus_pts")
                if db_val <= 0 then db_val = 150 end
                bonus_points = db_val
            end

            if emergency_seconds > 0 then
                -- Setta reward su TUTTI i membri del party
                if party.is_party() then
                    local pids = {party.get_member_pids()}
                    for i, member_pid in ipairs(pids) do
                        q.begin_other_pc_block(member_pid)
                        pc.setqf("hq_emerg_reward_pts", bonus_points)
                        pc.setqf("hq_emerg_reward_vnum", 0)
                        pc.setqf("hq_emerg_reward_count", 0)
                        pc.setqf("hq_speedkill_active", 1)
                        pc.setqf("hq_speedkill_vnum", spawned_vnum)
                        pc.setqf("hq_speedkill_start", get_time())
                        pc.setqf("hq_speedkill_duration", emergency_seconds)
                        q.end_other_pc_block()
                    end
                else
                    pc.setqf("hq_emerg_reward_pts", bonus_points)
                    pc.setqf("hq_emerg_reward_vnum", 0)
                    pc.setqf("hq_emerg_reward_count", 0)
                    pc.setqf("hq_speedkill_active", 1)
                    pc.setqf("hq_speedkill_vnum", spawned_vnum)
                    pc.setqf("hq_speedkill_start", get_time())
                    pc.setqf("hq_speedkill_duration", emergency_seconds)
                end
                
                hg_lib.start_emergency(emergency_title, emergency_seconds, spawned_vnum, 1)

                cleartimer("hq_speedkill_timer")
                loop_timer("hq_speedkill_timer", 1)

                local sk_msg = ">> SFIDA VELOCITA': Abbattilo in " .. emergency_seconds .. "s per DOPPIA GLORIA! <<"
                -- Notifica tutto il party
                hg_lib.party_hunter_speak_color(sk_msg, "GOLD")
            end
            
            local pname = pc.get_name()
            local map_name = hg_lib.get_map_name()
            local channel = hg_lib.get_channel()
            local location_str = ""
            if channel > 0 then
                location_str = " | " .. map_name .. " CH" .. channel .. " (" .. x .. ", " .. y .. ")"
            else
                location_str = " | " .. map_name .. " (" .. x .. ", " .. y .. ")"
            end
            local awakening_msg = hg_lib.get_text("AWAKENING_NOTICE", {PLAYER = pname, MOB = mob_name, RANK = rank_label, LOCATION = location_str}, pname .. " ha risvegliato: " .. mob_name .. " (" .. rank_label .. ")" .. location_str)
            notice_all("|cffFF4444[HUNTER]|r " .. awakening_msg)
        end
    end
end

-- FIX: Aggiunta pulizia flag timestamp vittoria
function hg_lib.finalize_gate_opening(vid)
    local pid = pc.get_player_id()
    
    -- FIX: Recupera rank e color dalle event_flags (salvate in complete_defense_success)
    -- Questi dati sono stati salvati PRIMA della pulizia di hunter_defense_data
    local rank_idx = game.get_event_flag("hq_gate_data_rank_"..vid) or 0
    local color_idx = game.get_event_flag("hq_gate_data_color_"..vid) or 0
    
    local rank_letters = {[0]="E", [1]="D", [2]="C", [3]="B", [4]="A", [5]="S", [6]="N"}
    local color_names = {[0]="PURPLE", [1]="BLUE", [2]="GREEN", [3]="YELLOW", [4]="ORANGE", [5]="RED", [6]="BLACK"}
    
    local frank = rank_letters[rank_idx] or "E"
    local fcolor = color_names[color_idx] or "PURPLE"
    
    -- Fallback su hunter_defense_data se event_flag non aveva dati
    if hunter_defense_data and hunter_defense_data[pid] then
        if rank_idx == 0 and hunter_defense_data[pid].rank then
            frank = hunter_defense_data[pid].rank
        end
        if color_idx == 0 and hunter_defense_data[pid].color then
            fcolor = hunter_defense_data[pid].color
        end
        hunter_defense_data[pid] = nil
    end
    
    -- Pulisci le event_flags dei dati gate
    game.set_event_flag("hq_gate_data_rank_"..vid, 0)
    game.set_event_flag("hq_gate_data_color_"..vid, 0)
    
    -- Pulisci flag su TUTTI i membri del party
    if party.is_party() then
        local pids = {party.get_member_pids()}
        for i, member_pid in ipairs(pids) do
            q.begin_other_pc_block(member_pid)
            pc.setqf("hq_defense_fracture_vid", 0)
            pc.setqf("hq_defense_active", 0)
            q.end_other_pc_block()
            
            -- Pulisci hunter_defense_data per questo membro
            if hunter_defense_data and hunter_defense_data[member_pid] then
                hunter_defense_data[member_pid] = nil
            end
        end
        
        -- Pulisci flag party defense
        local leader_pid = party.get_leader_pid()
        game.set_event_flag("hq_party_defense_vid_" .. leader_pid, 0)
    else
        pc.setqf("hq_defense_fracture_vid", 0)
    end
        
    game.set_event_flag("hq_gate_lock_"..vid, 0)
    game.set_event_flag("hq_gate_conq_"..vid, 0)
    game.set_event_flag("hq_gate_conq_time_"..vid, 0)
    
    -- === NUOVO: ASSEGNA IL PUNTO QUI ===
    -- Ora il punto viene dato solo quando la frattura si apre effettivamente
    hg_lib.on_fracture_seal()
    -- ===================================
        
    hg_lib.spawn_gate_mob_and_alert(frank, fcolor)
    npc.purge() -- L'NPC sparisce, quindi non puo' essere riusata
        
    pc.setqf("hq_elite_spawn_time", get_time())
end

function hg_lib.send_all_data()
    hg_lib.send_player_data()
    hg_lib.send_ranking("daily")
    hg_lib.send_ranking("weekly")
    hg_lib.send_ranking("total")
    hg_lib.send_ranking_kills("daily")
    hg_lib.send_ranking_kills("weekly")
    hg_lib.send_ranking_kills("total")
    hg_lib.send_ranking_special("fractures")
    hg_lib.send_ranking_special("chests")
    hg_lib.send_ranking_special("metins")
    hg_lib.send_shop()
    hg_lib.send_achievements()
    hg_lib.send_calendar()
    hg_lib.send_timers()
    hg_lib.send_event()
    hg_lib.send_fractures()
end

-- ============================================================
-- OTTIMIZZAZIONE send_player_data - Throttling per ridurre carico
-- Con 300K kill/min, questa funzione era chiamata troppo spesso
-- NUOVA VERSIONE: Throttle 3 secondi + UNA query invece di 3
-- ============================================================
_G.hunter_player_data_cache = {}  -- Cache per throttling

function hg_lib.send_player_data(force)
    local pid = pc.get_player_id()
    local now = get_time()
    
    -- PERFORMANCE: Throttle a max 1 call ogni 3 secondi (a meno che force=true)
    local last_send = _G.hunter_player_data_cache[pid] or 0
    if not force and (now - last_send < 3) then
        return  -- Skip, troppo presto
    end
    _G.hunter_player_data_cache[pid] = now
    
    -- PERFORMANCE: UNA SOLA query con subquery invece di 3 separate
    local q = string.format([[
        SELECT 
            r.total_points, r.spendable_points, r.daily_points, r.weekly_points,
            r.total_kills, r.daily_kills, r.weekly_kills,
            r.total_fractures, r.total_chests, r.total_metins,
            r.pending_daily_reward, r.pending_weekly_reward,
            (SELECT COUNT(*) FROM srv1_hunabku.hunter_quest_ranking WHERE daily_points > r.daily_points) + 1 as pos_d,
            (SELECT COUNT(*) FROM srv1_hunabku.hunter_quest_ranking WHERE weekly_points > r.weekly_points) + 1 as pos_w
        FROM srv1_hunabku.hunter_quest_ranking r
        WHERE r.player_id = %d
    ]], pid)
    
    local c, d = mysql_direct_query(q)
    if c > 0 and d[1] then
        local total_pts = tonumber(d[1].total_points) or 0
        local dp = tonumber(d[1].daily_points) or 0
        local wp = tonumber(d[1].weekly_points) or 0
        
        local new_rank_num = hg_lib.get_rank_index(total_pts)
        pc.setqf("hq_rank_num", new_rank_num)
        
        local pos_d = dp > 0 and (tonumber(d[1].pos_d) or 0) or 0
        local pos_w = wp > 0 and (tonumber(d[1].pos_w) or 0) or 0
            
        local pkt = hg_lib.clean_str(pc.get_name()) .. "|" .. 
            total_pts .. "|" .. 
            (tonumber(d[1].spendable_points) or 0) .. "|" ..
            dp .. "|" .. wp .. "|" .. 
            (tonumber(d[1].total_kills) or 0) .. "|" ..
            (tonumber(d[1].daily_kills) or 0) .. "|" .. 
            (tonumber(d[1].weekly_kills) or 0) .. "|" .. 
            (pc.getqf("hq_login_streak") or 0) .. "|" ..
            (pc.getqf("hq_streak_bonus") or 0) .. "|" .. 
            (tonumber(d[1].total_fractures) or 0) .. "|" .. 
            (tonumber(d[1].total_chests) or 0) .. "|" ..
            (tonumber(d[1].total_metins) or 0) .. "|" .. 
            (tonumber(d[1].pending_daily_reward) or 0) .. "|" .. 
            (tonumber(d[1].pending_weekly_reward) or 0) .. "|" ..
            pos_d .. "|" .. pos_w
        cmdchat("HunterPlayerData " .. pkt)
    end
end

function hg_lib.send_ranking(rtype)
    local col, kcol, cmd = "total_points", "total_kills", "HunterRankingTotal"
    if rtype == "daily" then 
        col, kcol, cmd = "daily_points", "daily_kills", "HunterRankingDaily"
    elseif rtype == "weekly" then 
        col, kcol, cmd = "weekly_points", "weekly_kills", "HunterRankingWeekly" 
    end
    local q = "SELECT player_name, " .. col .. " as pts, " .. kcol .. " as kills FROM srv1_hunabku.hunter_quest_ranking WHERE " .. col .. " > 0 ORDER BY " .. col .. " DESC LIMIT 10"
    local c, d = mysql_direct_query(q)
    local str = ""
    if c > 0 then 
        for i=1,c do 
            str = str .. hg_lib.clean_str(d[i].player_name) .. "," .. d[i].pts .. "," .. d[i].kills .. ";" 
        end 
    end
    local result = "EMPTY"
    if str ~= "" then result = str end
    cmdchat(cmd .. " " .. result)
end

function hg_lib.send_ranking_kills(rtype)
    local col, cmd = "total_kills", "HunterRankingTotalKills"
    if rtype == "daily" then 
        col, cmd = "daily_kills", "HunterRankingDailyKills"
    elseif rtype == "weekly" then 
        col, cmd = "weekly_kills", "HunterRankingWeeklyKills" 
    end
    local q = "SELECT player_name, " .. col .. " as val, total_points FROM srv1_hunabku.hunter_quest_ranking WHERE " .. col .. " > 0 ORDER BY " .. col .. " DESC LIMIT 10"
    local c, d = mysql_direct_query(q)
    local str = ""
    if c > 0 then 
        for i=1,c do 
            str = str .. hg_lib.clean_str(d[i].player_name) .. "," .. d[i].val .. "," .. d[i].total_points .. ";" 
        end 
    end
    cmdchat(cmd .. " " .. (str == "" and "EMPTY" or str))
end

function hg_lib.send_ranking_special(cat)
    local col, cmd = "total_fractures", "HunterRankingFractures"
    if cat == "chests" then 
        col, cmd = "total_chests", "HunterRankingChests"
    elseif cat == "metins" then 
        col, cmd = "total_metins", "HunterRankingMetins" 
    end
    local q = "SELECT player_name, " .. col .. " as val, total_points FROM srv1_hunabku.hunter_quest_ranking WHERE " .. col .. " > 0 ORDER BY " .. col .. " DESC LIMIT 10"
    local c, d = mysql_direct_query(q)
    local str = ""
    if c > 0 then 
        for i=1,c do 
            str = str .. hg_lib.clean_str(d[i].player_name) .. "," .. d[i].val .. "," .. d[i].total_points .. ";" 
        end 
    end
    cmdchat(cmd .. " " .. (str == "" and "EMPTY" or str))
end

function hg_lib.send_shop()
    local c, d = mysql_direct_query("SELECT id, item_vnum, item_count, price_points, description FROM srv1_hunabku.hunter_quest_shop WHERE enabled=1 ORDER BY display_order")
    local str = ""
    if c > 0 then 
        for i=1,c do 
            str = str .. d[i].id .. "," .. d[i].item_vnum .. "," .. d[i].item_count .. "," .. d[i].price_points .. "," .. hg_lib.clean_str(d[i].description) .. ";" 
        end 
    end
    local result = "EMPTY"
    if str ~= "" then result = str end
    cmdchat("HunterShopItems " .. result)
end

function hg_lib.send_achievements()
    local c, d = mysql_direct_query("SELECT id, name, type, requirement FROM srv1_hunabku.hunter_quest_achievements_config WHERE enabled=1 ORDER BY requirement")
    local str = ""
    if c > 0 then
        local k, p = pc.getqf("hq_total_kills") or 0, pc.getqf("hq_total_points") or 0
        for i=1,c do
            local aid, at, req = tonumber(d[i].id), tonumber(d[i].type), tonumber(d[i].requirement)
            local prg = k
            if at ~= 1 then prg = p end
            local unl = 0
            if prg >= req then unl = 1 end
            local clm = pc.getqf("hq_ach_clm_" .. aid) or 0
            str = str .. aid .. "," .. hg_lib.clean_str(d[i].name) .. "," .. at .. "," .. req .. "," .. prg .. "," .. unl .. "," .. clm .. ";"
        end
    end
    local result = "EMPTY"
    if str ~= "" then result = str end
    cmdchat("HunterAchievements " .. result)
end

function hg_lib.send_calendar()
    local c, d = mysql_direct_query("SELECT DISTINCT SUBSTRING_INDEX(days_active, ',', 1) as day_index, event_name, start_hour, (start_hour + FLOOR(duration_minutes/60)) as end_hour FROM srv1_hunabku.hunter_scheduled_events WHERE enabled = 1 ORDER BY start_hour LIMIT 21")
    local str = ""
    if c > 0 then 
        for i=1,c do
            local day_idx = tonumber(d[i].day_index) or 1
            day_idx = day_idx - 1
            str = str .. day_idx .. "," .. hg_lib.clean_str(d[i].event_name) .. "," .. d[i].start_hour .. "," .. d[i].end_hour .. ";" 
        end 
    end
    local result = "EMPTY"
    if str ~= "" then result = str end
    cmdchat("HunterCalendar " .. result)
end

function hg_lib.send_timers()
    local ts = get_time()
    local hour = hg_lib.get_hour_from_ts(ts)
    local min = hg_lib.get_min_from_ts(ts)
    local sec = hg_lib.get_sec_from_ts(ts)
    local seconds_today = (hour * 3600) + (min * 60) + sec
    local daily = 86400 - seconds_today
    local wday = hg_lib.get_day_db_from_ts(ts)
    local days_to_mon = 8 - wday
    if days_to_mon == 8 then days_to_mon = 7 end
    local weekly = (days_to_mon * 86400) - seconds_today
    cmdchat("HunterTimers " .. daily .. "|" .. weekly)
end

function hg_lib.send_event()
    local event = hg_lib.get_current_scheduled_event()
    local result = "NONE"
        
    if event then
        local name = event.event_name or "Evento"
        local desc = event.event_desc or ""
        local etype = event.event_type or "glory_rush"
        local reward = tonumber(event.reward_glory_base) or 50
        local winner = tonumber(event.reward_glory_winner) or 200
            
        local t = os.date("*t")
        local current_hour = t.hour
        local current_minute = t.min
        local current_total = current_hour * 60 + current_minute
            
        local start_total = tonumber(event.start_hour) * 60 + tonumber(event.start_minute)
        local duration = tonumber(event.duration_minutes) or 30
        local end_total = start_total + duration
            
        local remaining_minutes = end_total - current_total
        local remaining_seconds = remaining_minutes * 60
            
        result = hg_lib.clean_str(name) .. "|" .. 
                 hg_lib.clean_str(desc) .. "|" .. 
                 etype .. "|" .. 
                 math.floor(remaining_seconds) .. "|" .. 
                 reward .. "|" .. 
                 winner
    end
    cmdchat("HunterActiveEvent " .. result)
end

function hg_lib.send_fractures()
    local c, d = mysql_direct_query("SELECT name, req_points FROM srv1_hunabku.hunter_quest_fractures WHERE enabled=1 ORDER BY req_points")
    local str = ""
    if c > 0 then 
        for i=1,c do 
            str = str .. hg_lib.clean_str(d[i].name) .. "," .. d[i].req_points .. ";" 
        end 
    end
    local result = "EMPTY"
    if str ~= "" then result = str end
    cmdchat("HunterFractures " .. result)
end

function hg_lib.achiev_claim(id)
    local c, d = mysql_direct_query("SELECT name, type, requirement, reward_vnum, reward_count FROM srv1_hunabku.hunter_quest_achievements_config WHERE id="..id)
    if c == 0 or not d[1] then return end
        
    local name, req, vnum, count = d[1].name, tonumber(d[1].requirement), tonumber(d[1].reward_vnum), tonumber(d[1].reward_count)
    local atype = tonumber(d[1].type)
    local prog = pc.getqf("hq_total_points")
    if atype == 1 then prog = pc.getqf("hq_total_kills") end
    local is_claimed = (pc.getqf("hq_ach_clm_"..id) == 1)
    local is_unlocked = (prog >= req)
    
    local kills_txt = hg_lib.get_text("ach_kills", nil, "Kills")
    local glory_txt = hg_lib.get_text("GLORY", nil, "Gloria")
    local req_type = (atype == 1) and kills_txt or glory_txt
        
    say_title("|cffFFD700ACHIEVEMENT: " .. name .. "|r")
    say(hg_lib.get_text("ach_requirement", nil, "Requisito") .. ": " .. req .. " " .. req_type)
    say(hg_lib.get_text("ach_reward", nil, "Ricompensa") .. ": x" .. count .. " " .. hg_lib.item_name(vnum))
    say_item_vnum(vnum)
    say("")
    if is_claimed then 
        say(hg_lib.get_text("ach_already_claimed", nil, "[!] RICOMPENSA GIA' RISCOSSA"))
        select(hg_lib.get_text("ach_close", nil, "Chiudi"))
    elseif not is_unlocked then 
        say(hg_lib.get_text("ach_locked", nil, "[!] BLOCCATO - Impegnati di piu'"))
        select(hg_lib.get_text("ach_close", nil, "Chiudi"))
    else
        if select(hg_lib.get_text("ach_claim", nil, "Riscuoti Premio"), hg_lib.get_text("ach_close", nil, "Chiudi")) == 1 then
            pc.setqf("hq_ach_clm_"..id, 1)
            pc.give_item2(vnum, count)
            hg_lib.hunter_speak(hg_lib.get_text("ach_item_received", nil, "OGGETTO RICEVUTO") .. ": " .. hg_lib.item_name(vnum))
            hg_lib.send_achievements()
        end
    end
end

function hg_lib.smart_claim_reward()
    local pid = pc.get_player_id()
    local c, d = mysql_direct_query("SELECT pending_daily_reward, pending_weekly_reward FROM srv1_hunabku.hunter_quest_ranking WHERE player_id=" .. pid)
    if c == 0 or not d[1] then return end
        
    local pd, pw = tonumber(d[1].pending_daily_reward) or 0, tonumber(d[1].pending_weekly_reward) or 0
    if pd == 0 and pw == 0 then 
        say_title(hg_lib.get_text("reward_title", nil, "RICOMPENSE HUNTER"))
        say(hg_lib.get_text("reward_none", nil, "Nessun premio in attesa al momento."))
        say(hg_lib.get_text("reward_climb", nil, "Scala la classifica per ottenere gloria!"))
        select(hg_lib.get_text("shop_opt_cancel", nil, "Annulla"))
        return 
    end
        
    say_title(hg_lib.get_text("rewards_available", nil, "PREMI DISPONIBILI"))
    local opts, rdata = {}, {}
    if pd > 0 then
        local rc, rd = mysql_direct_query("SELECT item_vnum, item_quantity FROM srv1_hunabku.hunter_quest_rewards WHERE reward_type='daily' AND rank_position=" .. pd)
        if rc > 0 and rd[1] then
            say("|cff00FFFF[DAILY RANK]|r " .. hg_lib.get_text("POSITION", nil, "Posizione") .. ": |cffFFD700" .. pd .. "|r")
            say_item_vnum(tonumber(rd[1].item_vnum))
            table.insert(opts, hg_lib.get_text("claim_daily", nil, "Riscuoti Premio Giornaliero"))
            table.insert(rdata, {t="daily", p=pd, v=tonumber(rd[1].item_vnum), q=tonumber(rd[1].item_quantity)})
        end
    end
    if pw > 0 then
        local rc, rd = mysql_direct_query("SELECT item_vnum, item_quantity FROM srv1_hunabku.hunter_quest_rewards WHERE reward_type='weekly' AND rank_position=" .. pw)
        if rc > 0 and rd[1] then
            say("|cffFFD700[WEEKLY RANK]|r " .. hg_lib.get_text("POSITION", nil, "Posizione") .. ": |cffFFD700" .. pw .. "|r")
            say_item_vnum(tonumber(rd[1].item_vnum))
            table.insert(opts, hg_lib.get_text("claim_weekly", nil, "Riscuoti Premio Settimanale"))
            table.insert(rdata, {t="weekly", p=pw, v=tonumber(rd[1].item_vnum), q=tonumber(rd[1].item_quantity)})
        end
    end
    if pd > 0 and pw > 0 then 
        table.insert(opts, hg_lib.get_text("claim_all", nil, "Riscuoti TUTTO")) 
    end
    table.insert(opts, hg_lib.get_text("shop_opt_cancel", nil, "Annulla"))
    local s = select_table(opts)
    if s == table.getn(opts) then return end
        
    if pd > 0 and pw > 0 and s == table.getn(opts)-1 then
        hg_lib.give_pending_reward("daily", pd)
        hg_lib.give_pending_reward("weekly", pw)
    elseif rdata[s] then
        hg_lib.give_pending_reward(rdata[s].t, rdata[s].p)
    end
    hg_lib.send_player_data()
end

function hg_lib.give_pending_reward(rtype, pos)
    if pc.getqf("hq_reward_lock") == 1 then 
        syschat(hg_lib.get_text("PLEASE_WAIT", nil, "Attendere prego..."))
        return 
    end
    pc.setqf("hq_reward_lock", 1) 

    local pid = pc.get_player_id()
    local rc, rd = mysql_direct_query("SELECT item_vnum, item_quantity FROM srv1_hunabku.hunter_quest_rewards WHERE reward_type='" .. rtype .. "' AND rank_position=" .. pos)
    
    if rc > 0 and rd[1] then
        mysql_direct_query("UPDATE srv1_hunabku.hunter_quest_ranking SET " .. (rtype=="weekly" and "pending_weekly_reward" or "pending_daily_reward") .. " = 0 WHERE player_id=" .. pid)
        
        pc.give_item2(tonumber(rd[1].item_vnum), tonumber(rd[1].item_quantity))
        
        local pname = pc.get_name()
        local rtype_label = rtype == "daily" and (hg_lib.get_text("reward_type_daily") or "Giornaliera") or (hg_lib.get_text("reward_type_weekly") or "Settimanale")
        local msg = hg_lib.get_text("reward_claimed", {PLAYER = pname, TYPE = rtype_label}) or ("|cffFFD700[HUNTER]|r " .. pname .. " ha riscosso il premio Top Classifica " .. rtype_label .. "!")
        notice_all(msg)
    end

    pc.setqf("hq_reward_lock", 0)
end

function hg_lib.shop_buy_confirm(id)
    local pid = pc.get_player_id()
    local c, d = mysql_direct_query("SELECT item_vnum, item_count, price_points, description FROM srv1_hunabku.hunter_quest_shop WHERE id=" .. id)
    
    if c > 0 and d[1] then
        local vnum = tonumber(d[1].item_vnum)
        local count = tonumber(d[1].item_count)
        local price = tonumber(d[1].price_points)
        
        if price <= 0 then
            syschat("|cffFF0000[SECURITY]|r " .. hg_lib.get_text("PRICE_ERROR", nil, "Errore: Prezzo oggetto non valido."))
            return
        end

        local title = hg_lib.get_text("shop_title", nil, "MERCANTE HUNTER")
        local ask = hg_lib.get_text("shop_ask", nil, "Vuoi acquistare questo oggetto?")
        local opt_confirm = hg_lib.get_text("shop_opt_confirm", nil, "Conferma Acquisto")
        local opt_cancel = hg_lib.get_text("shop_opt_cancel", nil, "Annulla")
        local qty_label = hg_lib.get_text("shop_quantity", nil, "Quantita'")
        local cost_label = hg_lib.get_text("shop_cost", nil, "Costo")
        local spendable_label = hg_lib.get_text("SPENDABLE_GLORY", nil, "Gloria Spendibile")
            
        say_title(title)
        say(ask)
        say("")
        say_item_vnum(vnum)
        say(qty_label .. ": |cff00FFFFx" .. count .. "|r") 
        say(cost_label .. ": |cffFFA500" .. price .. " " .. spendable_label .. "|r")
        
        if select(opt_confirm, opt_cancel) == 1 then
            local wc, wd = mysql_direct_query("SELECT spendable_points FROM srv1_hunabku.hunter_quest_ranking WHERE player_id=" .. pid)
            local wallet = 0
            if wc > 0 and wd[1] then wallet = tonumber(wd[1].spendable_points) or 0 end
            
            if wallet >= price then
                mysql_direct_query("UPDATE srv1_hunabku.hunter_quest_ranking SET spendable_points = spendable_points - " .. price .. " WHERE player_id=" .. pid)
                pc.give_item2(vnum, count)
                
                local msg = hg_lib.get_text("shop_success", {POINTS = price}) or ("TRANSAZIONE COMPLETATA. -" .. price .. " GLORIA")
                hg_lib.hunter_speak(msg)
                hg_lib.send_player_data()
            else
                local msg = hg_lib.get_text("shop_error_funds") or "ERRORE: GLORIA INSUFFICIENTE."
                hg_lib.hunter_speak(msg)
            end
        end
    else
        syschat(hg_lib.get_text("ITEM_NOT_FOUND", nil, "Oggetto non trovato."))
    end
end

function hg_lib.announce_daily_winners()
    local q = "SELECT player_name, daily_points FROM srv1_hunabku.hunter_quest_ranking WHERE daily_points > 0 ORDER BY daily_points DESC LIMIT 3"
    local c, d = mysql_direct_query(q)
    if c > 0 then
        local sep_daily = hg_lib.get_text("winners_sep_daily") or "|cffFFD700======================================|r"
        local title_daily = hg_lib.get_text("winners_title_daily") or "|cffFFD700[HUNTER SYSTEM]|r |cff00FFFF* VINCITORI CLASSIFICA GIORNALIERA *|r"
        local glory_label = hg_lib.get_text("winners_glory", nil, "Gloria")
        notice_all("")
        notice_all(sep_daily)
        notice_all(title_daily)
        notice_all(sep_daily)
        for i = 1, c do
            local medal = ""
            local color = ""
            if i == 1 then medal = "[1]" color = "|cffFFD700" end
            if i == 2 then medal = "[2]" color = "|cffC0C0C0" end
            if i == 3 then medal = "[3]" color = "|cffCD7F32" end
            notice_all(medal .. " " .. color .. d[i].player_name .. "|r - |cffFFFFFF" .. d[i].daily_points .. " " .. glory_label .. "|r")
        end
        notice_all(sep_daily)
        notice_all("")
        local msg = hg_lib.get_text("winners_glory_syschat", nil, "[HUNTER SYSTEM] Vincitori Gloria") .. ": "
        for i = 1, c do
            if i > 1 then msg = msg .. ", " end
            msg = msg .. d[i].player_name .. " (" .. d[i].daily_points .. ")"
        end
        hg_lib.hunter_speak(msg)
    end

    local qk = "SELECT player_name, daily_kills FROM srv1_hunabku.hunter_quest_ranking WHERE daily_kills > 0 ORDER BY daily_kills DESC LIMIT 3"
    local ck, dk = mysql_direct_query(qk)
    if ck > 0 then
        local sep_kill = hg_lib.get_text("winners_sep_kill") or "|cffFF8800======================================|r"
        local title_kill = hg_lib.get_text("winners_title_kill") or "|cffFF8800[HUNTER SYSTEM]|r |cffFF8800* VINCITORI CLASSIFICA KILL GIORNALIERA *|r"
        local kills_label = hg_lib.get_text("winners_kills", nil, "Kill")
        notice_all("")
        notice_all(sep_kill)
        notice_all(title_kill)
        notice_all(sep_kill)
        for i = 1, ck do
            local medal = ""
            local color = ""
            if i == 1 then medal = "[1]" color = "|cffFFD700" end
            if i == 2 then medal = "[2]" color = "|cffC0C0C0" end
            if i == 3 then medal = "[3]" color = "|cffCD7F32" end
            notice_all(medal .. " " .. color .. dk[i].player_name .. "|r - |cffFFFFFF" .. dk[i].daily_kills .. " " .. kills_label .. "|r")
        end
        notice_all(sep_kill)
        notice_all("")
        local msgk = hg_lib.get_text("winners_kill_syschat", nil, "[HUNTER SYSTEM] Vincitori Kill") .. ": "
        for i = 1, ck do
            if i > 1 then msgk = msgk .. ", " end
            msgk = msgk .. dk[i].player_name .. " (" .. dk[i].daily_kills .. ")"
        end
        hg_lib.hunter_speak(msgk)
    end
end

function hg_lib.announce_weekly_winners()
    local q = "SELECT player_name, weekly_points FROM srv1_hunabku.hunter_quest_ranking WHERE weekly_points > 0 ORDER BY weekly_points DESC LIMIT 3"
    local c, d = mysql_direct_query(q)
    if c > 0 then
        local sep_weekly = hg_lib.get_text("winners_sep_weekly") or "|cffFF6600======================================|r"
        local title_weekly = hg_lib.get_text("winners_title_weekly") or "|cffFF6600[HUNTER SYSTEM]|r |cffFFD700** VINCITORI CLASSIFICA SETTIMANALE **|r"
        local glory_label = hg_lib.get_text("winners_glory", nil, "Gloria")
        notice_all("")
        notice_all(sep_weekly)
        notice_all(title_weekly)
        notice_all(sep_weekly)
        for i = 1, c do
            local medal = ""
            local color = ""
            if i == 1 then medal = "[1]" color = "|cffFFD700" end
            if i == 2 then medal = "[2]" color = "|cffC0C0C0" end
            if i == 3 then medal = "[3]" color = "|cffCD7F32" end
            notice_all(medal .. " " .. color .. d[i].player_name .. "|r - |cffFFFFFF" .. d[i].weekly_points .. " " .. glory_label .. "|r")
        end
        notice_all(sep_weekly)
        notice_all("")
    end
end

function hg_lib.process_daily_reset()
    -- STEP 1: Applica penalità per missioni NON completate del giorno precedente
    hg_lib.apply_mission_penalties()
    
    -- STEP 2: Assegna premi classifica
    hg_lib.assign_rank_prizes("daily")
    
    -- STEP 3: Resetta punti giornalieri
    mysql_direct_query("UPDATE srv1_hunabku.hunter_quest_ranking SET daily_points = 0, daily_kills = 0")
    
    local msg = hg_lib.get_text("reset_daily") or "|cffFFD700[HUNTER SYSTEM]|r Classifica Giornaliera Resettata! La corsa al potere ricomincia."
    notice_all(msg)
end

-- Applica penalità gloria per missioni non completate
function hg_lib.apply_mission_penalties()
    local yesterday = os.date("%Y-%m-%d", os.time() - 86400)
    
    -- Trova tutte le missioni 'active' (non completate) del giorno precedente
    local q = "SELECT pm.id, pm.player_id, pm.penalty_glory FROM srv1_hunabku.hunter_player_missions pm WHERE pm.assigned_date = '" .. yesterday .. "' AND pm.status = 'active'"
    local c, d = mysql_direct_query(q)
    
    if c > 0 then
        for i = 1, c do
            local mission = d[i]
            local player_id = tonumber(mission.player_id) or 0
            local penalty = tonumber(mission.penalty_glory) or 25
            
            if player_id > 0 and penalty > 0 then
                -- Sottrai penalità SOLO da total_points (non da spendable_points)
                -- Usa GREATEST per non andare sotto 0
                mysql_direct_query("UPDATE srv1_hunabku.hunter_quest_ranking SET total_points = GREATEST(0, total_points - " .. penalty .. ") WHERE player_id = " .. player_id)
                
                -- Marca la missione come 'failed'
                mysql_direct_query("UPDATE srv1_hunabku.hunter_player_missions SET status = 'failed' WHERE id = " .. mission.id)
            end
        end
    end
end

function hg_lib.process_weekly_reset()
    hg_lib.assign_rank_prizes("weekly")
    mysql_direct_query("UPDATE srv1_hunabku.hunter_quest_ranking SET weekly_points = 0, weekly_kills = 0")
    local msg = hg_lib.get_text("reset_weekly") or "|cffFF6600[HUNTER SYSTEM]|r Classifica Settimanale Resettata! I premi sono stati distribuiti."
    notice_all(msg)
end

function hg_lib.assign_rank_prizes(rtype)
    local col = rtype == "weekly" and "weekly_points" or "daily_points"
    local pcol = rtype == "weekly" and "pending_weekly_reward" or "pending_daily_reward"
    local q = "SELECT player_id FROM srv1_hunabku.hunter_quest_ranking WHERE " .. col .. " > 0 ORDER BY " .. col .. " DESC LIMIT 3"
    local c, d = mysql_direct_query(q)
    if c > 0 then
        for i=1,c do 
            mysql_direct_query("UPDATE srv1_hunabku.hunter_quest_ranking SET " .. pcol .. " = " .. i .. " WHERE player_id = " .. d[i].player_id) 
        end
    end
end

function hg_lib.assign_daily_missions()
    local pid = pc.get_player_id()
    local pname = pc.get_name()
    local today = hg_lib.get_today_date()
        
    local last_assign_day = pc.getqf("hq_last_assign_day") or 0
    local current_day = tonumber(os.date("%j")) or 0
    
    -- FIX: Conta TUTTE le missioni di oggi (active + completed), non solo active!
    -- Altrimenti quando ne completi una, il sistema pensa di doverle riassegnare
    if last_assign_day == current_day then
        local c, d = mysql_direct_query("SELECT COUNT(*) as cnt FROM srv1_hunabku.hunter_player_missions WHERE player_id=" .. pid .. " AND assigned_date='" .. today .. "'")
        if c > 0 and tonumber(d[1].cnt) >= 3 then
            -- Missioni gia assegnate oggi, invia i dati al client
            hg_lib.send_daily_missions()
            return false
        end
    end
    
    -- FIX: Stessa correzione qui - conta TUTTE le missioni, non solo active
    local c, d = mysql_direct_query("SELECT COUNT(*) as cnt FROM srv1_hunabku.hunter_player_missions WHERE player_id=" .. pid .. " AND assigned_date='" .. today .. "'")
    if c > 0 and tonumber(d[1].cnt) >= 3 then
        pc.setqf("hq_last_assign_day", current_day)
        -- Missioni gia presenti, invia i dati al client
        hg_lib.send_daily_missions()
        return false
    end
        
    pc.setqf("hq_last_assign_day", current_day)
        
    local rc, rd = mysql_direct_query("SELECT total_points FROM srv1_hunabku.hunter_quest_ranking WHERE player_id=" .. pid)
    local pts = 0
    if rc > 0 and rd[1] then pts = tonumber(rd[1].total_points) or 0 end
    local rank_idx = hg_lib.get_rank_index(pts)
    local rank_letter = hg_lib.get_rank_letter(rank_idx)
        
    mysql_direct_query("CALL srv1_hunabku.sp_assign_daily_missions(" .. pid .. ", '" .. rank_letter .. "', '" .. pname .. "')")
        
    local vc, vd = mysql_direct_query("SELECT COUNT(*) as cnt FROM srv1_hunabku.hunter_player_missions WHERE player_id=" .. pid .. " AND assigned_date='" .. today .. "' AND status='active'")
    local inserted_count = 0
    if vc > 0 and vd[1] then inserted_count = tonumber(vd[1].cnt) or 0 end
        
    if inserted_count >= 3 then
        hg_lib.send_daily_missions()
        timer("hq_missions_notify", 6)
        return true
    else
        syschat("|cffFF0000[HUNTER ERROR] " .. hg_lib.get_text("HUNTER_ERROR", nil, "Errore Hunter. Contatta un GM.") .. "|r")
        return false
    end
end

function hg_lib.send_daily_missions()
    local pid = pc.get_player_id()
    local today = hg_lib.get_today_date()
    local q = "SELECT pm.id, pm.mission_slot, md.mission_name, md.mission_type, pm.current_progress, pm.target_count, pm.status, pm.reward_glory, pm.penalty_glory, md.time_limit_minutes FROM srv1_hunabku.hunter_player_missions pm LEFT JOIN srv1_hunabku.hunter_mission_definitions md ON pm.mission_def_id = md.mission_id WHERE pm.player_id=" .. pid .. " AND pm.assigned_date='" .. today .. "' ORDER BY pm.mission_slot"
    local c, d = mysql_direct_query(q)
        
    cmdchat("HunterMissionsCount " .. c)
        
    if c > 0 then
        for i = 1, c do
            local m = d[i]
            local remaining = 0
            local time_limit = tonumber(m.time_limit_minutes) or 0
            if time_limit > 0 then
                remaining = time_limit * 60
            end
            local pkt = tostring(tonumber(m.id) or 0) .. "|" ..
                hg_lib.clean_str(m.mission_name or "Missione") .. "|" ..
                (m.mission_type or "kill_mob") .. "|" ..
                tostring(tonumber(m.current_progress) or 0) .. "|" ..
                tostring(tonumber(m.target_count) or 10) .. "|" ..
                tostring(tonumber(m.reward_glory) or 50) .. "|" ..
                tostring(tonumber(m.penalty_glory) or 25) .. "|" ..
                (m.status or "active")
            cmdchat("HunterMissionData " .. pkt)
        end
    end
end

-- ============================================================
-- FUNZIONE INTERNA: Processa il buffer missioni per un player
-- OTTIMIZZATO: Logica centralizzata (era duplicata in 2 funzioni)
-- ============================================================
function hg_lib._process_mission_buffer_internal(pid)
    _G.hunter_mission_buffer = _G.hunter_mission_buffer or {}
    local player_buffer = _G.hunter_mission_buffer[pid]
    if not player_buffer or next(player_buffer) == nil then
        return -- Buffer vuoto, niente da fare
    end

    -- FLUSH: Processa tutte le missioni attive del player
    local q = "SELECT pm.id, pm.current_progress, pm.target_count, pm.reward_glory, md.mission_name, md.target_vnum, md.mission_type FROM srv1_hunabku.hunter_player_missions pm LEFT JOIN srv1_hunabku.hunter_mission_definitions md ON pm.mission_def_id = md.mission_id WHERE pm.player_id=" .. pid .. " AND pm.assigned_date=CURDATE() AND pm.status='active'"
    local c, d = mysql_direct_query(q)

    if c > 0 then
        for i = 1, c do
            local m = d[i]
            local mid = tonumber(m.id)
            local cur = tonumber(m.current_progress) or 0
            local target_count = tonumber(m.target_count) or 10
            local m_type = m.mission_type or "kill_mob"
            local m_target = tonumber(m.target_vnum) or 0

            -- Trova il progresso nel buffer per questa missione
            local progress_to_add = 0
            local check_key = m_type .. "_" .. m_target

            if player_buffer[check_key] and player_buffer[check_key] > 0 then
                progress_to_add = player_buffer[check_key]
            end

            if progress_to_add > 0 then
                local new_progress = math.min(cur + progress_to_add, target_count)

                -- Aggiorna solo se c'è effettivamente progresso
                if new_progress > cur then
                    mysql_direct_query("UPDATE srv1_hunabku.hunter_player_missions SET current_progress=" .. new_progress .. " WHERE id=" .. mid)
                    cmdchat("HunterMissionProgress " .. mid .. "|" .. new_progress .. "|" .. target_count)

                    if new_progress >= target_count then
                        hg_lib.complete_mission(mid)
                    end
                end
            end
        end
    end

    -- Svuota il buffer del player dopo il flush
    _G.hunter_mission_buffer[pid] = {}
end

function hg_lib.update_mission_progress(mission_type, amount, target_vnum)
    local pid = pc.get_player_id()
    target_vnum = target_vnum or 0

    -- PERFORMANCE: Throttle mission updates - max 1 flush ogni 1 secondo per player
    local now = get_time()
    local throttle_key = pid .. "_mission_flush"
    _G.hunter_mission_throttle = _G.hunter_mission_throttle or {}
    local last_flush = _G.hunter_mission_throttle[throttle_key] or 0

    -- SEMPRE accumula nel buffer (fix: accumula TUTTE le kill)
    _G.hunter_mission_buffer = _G.hunter_mission_buffer or {}
    _G.hunter_mission_buffer[pid] = _G.hunter_mission_buffer[pid] or {}
    local player_buffer = _G.hunter_mission_buffer[pid]

    -- Accumula per tipo + vnum specifico
    local buffer_key = mission_type .. "_" .. target_vnum
    player_buffer[buffer_key] = (player_buffer[buffer_key] or 0) + amount

    -- Accumula anche per missioni generiche (target_vnum = 0)
    if target_vnum > 0 then
        local generic_key = mission_type .. "_0"
        player_buffer[generic_key] = (player_buffer[generic_key] or 0) + amount
    end

    -- Se non è passato abbastanza tempo, esci (il buffer verrà processato dopo)
    if now - last_flush < 1 then
        return
    end
    _G.hunter_mission_throttle[throttle_key] = now

    -- USA FUNZIONE CENTRALIZZATA
    hg_lib._process_mission_buffer_internal(pid)
end

-- Funzione separata per forzare il flush del buffer missioni (bypassa throttle)
function hg_lib.flush_mission_buffer(pid)
    pid = pid or pc.get_player_id()

    -- USA FUNZIONE CENTRALIZZATA
    hg_lib._process_mission_buffer_internal(pid)

    -- Aggiorna timestamp throttle
    _G.hunter_mission_throttle = _G.hunter_mission_throttle or {}
    _G.hunter_mission_throttle[pid .. "_mission_flush"] = get_time()
end

function hg_lib.complete_mission(mission_id)
    local pid = pc.get_player_id()
    local today = hg_lib.get_today_date()
    local c, d = mysql_direct_query("SELECT pm.reward_glory, pm.status, md.mission_name FROM srv1_hunabku.hunter_player_missions pm LEFT JOIN srv1_hunabku.hunter_mission_definitions md ON pm.mission_def_id = md.mission_id WHERE pm.id=" .. mission_id .. " AND pm.player_id=" .. pid)
    if c == 0 or d[1].status ~= "active" then return end
        
    local reward = tonumber(d[1].reward_glory) or 50
    local name = d[1].mission_name or "Missione"
        
    mysql_direct_query("UPDATE srv1_hunabku.hunter_player_missions SET status='completed', completed_at=NOW() WHERE id=" .. mission_id)
    mysql_direct_query("UPDATE srv1_hunabku.hunter_quest_ranking SET total_points = total_points + " .. reward .. ", spendable_points = spendable_points + " .. reward .. ", daily_points = daily_points + " .. reward .. ", weekly_points = weekly_points + " .. reward .. " WHERE player_id=" .. pid)
        
    local cc, cd = mysql_direct_query("SELECT COUNT(*) as completed FROM srv1_hunabku.hunter_player_missions WHERE player_id=" .. pid .. " AND assigned_date='" .. today .. "' AND status='completed'")
    local completed_count = 1
    if cc > 0 and cd[1] then completed_count = tonumber(cd[1].completed) or 1 end
        
    syschat("|cff00FF00========================================|r")
    syschat("|cff00FF00  [" .. hg_lib.get_text("MISSION_COMPLETED", nil, "MISSIONE COMPLETATA") .. "]|r |cffFFFFFF" .. name .. "|r")
    syschat("|cffFFD700  +" .. reward .. " " .. hg_lib.get_text("GLORY", nil, "Gloria") .. "!|r |cffAAAAAA(" .. completed_count .. "/3 " .. hg_lib.get_text("COMPLETE", nil, "complete") .. ")|r")
    syschat("|cff00FF00========================================|r")

    local speak_msg = hg_lib.get_text("MISSION_COMPLETE_SPEAK", {REWARD = reward}, "MISSIONE COMPLETATA! +" .. reward .. " GLORIA")
    hg_lib.hunter_speak(speak_msg)
    cmdchat("HunterMissionComplete " .. mission_id .. "|" .. hg_lib.clean_str(name) .. "|" .. reward)
        
    hg_lib.check_all_missions_complete()
    hg_lib.send_player_data()
end

function hg_lib.check_all_missions_complete()
    local pid = pc.get_player_id()
    local today = hg_lib.get_today_date()
    local today_num = tonumber(os.date("%j")) or 0  -- Giorno dell'anno come numero
    local c, d = mysql_direct_query("SELECT COUNT(*) as total, SUM(CASE WHEN status='completed' THEN 1 ELSE 0 END) as completed FROM srv1_hunabku.hunter_player_missions WHERE player_id=" .. pid .. " AND assigned_date='" .. today .. "'")
        
    if c > 0 and d[1] then
        local total = tonumber(d[1].total) or 0
        local completed = tonumber(d[1].completed) or 0
            
        if total >= 3 and completed >= 3 then
            -- Controlla se il bonus è già stato dato oggi (evita duplicati)
            local already_claimed = pc.getqf("hq_daily_bonus_claimed") or 0
            if already_claimed == today_num then
                return -- Bonus già riscosso oggi
            end
            pc.setqf("hq_daily_bonus_claimed", today_num)
            
            -- === ATTIVA BONUS FRATTURE ===
            hg_lib.activate_fracture_bonus()
            -- =============================
            
            -- Recupera i dettagli delle singole missioni
            local sc, sd = mysql_direct_query("SELECT mission_def_id, reward_glory FROM srv1_hunabku.hunter_player_missions WHERE player_id=" .. pid .. " AND assigned_date='" .. today .. "' AND status='completed' ORDER BY id")
            if sc > 0 then
                local total_glory = 0
                local mission_details = {}
                
                for i = 1, sc do
                    local glory = tonumber(sd[i].reward_glory) or 0
                    total_glory = total_glory + glory
                    table.insert(mission_details, glory)
                end
                
                local bonus = math.floor(total_glory * 0.5)
                
                if bonus > 0 then
                    mysql_direct_query("UPDATE srv1_hunabku.hunter_quest_ranking SET total_points = total_points + " .. bonus .. ", spendable_points = spendable_points + " .. bonus .. " WHERE player_id=" .. pid)
                    
                    -- === SYSCHAT DETTAGLIATO BONUS MISSIONI ===
                    local glory_label = hg_lib.get_text("GLORY", nil, "Gloria")
                    local mission_label = hg_lib.get_text("MISSION", nil, "Missione")
                    syschat("|cffFFD700=============================================|r")
                    syschat("|cffFFD700  [!!!] " .. hg_lib.get_text("ALL_MISSIONS_COMPLETE", nil, "TUTTE LE MISSIONI COMPLETE!") .. " [!!!]|r")
                    syschat("|cffFFD700=============================================|r")
                    syschat("")
                    syschat("|cff00FFFF  " .. hg_lib.get_text("GLORY_FROM_MISSIONS", nil, "Gloria dalle Missioni:") .. "|r")
                    for idx, glory in ipairs(mission_details) do
                        syschat("|cffFFFFFF    " .. mission_label .. " " .. idx .. ": +" .. glory .. " " .. glory_label .. "|r")
                    end
                    syschat("|cff00FF00  ────────────────────────────────|r")
                    syschat("|cffFFFFFF  " .. hg_lib.get_text("TOTAL_MISSIONS", nil, "Totale Missioni") .. ": |r|cff00FF00+" .. total_glory .. " " .. glory_label .. "|r")
                    syschat("")
                    syschat("|cffFFD700  [" .. hg_lib.get_text("BONUS_50_COMPLETION", nil, "BONUS 50% COMPLETAMENTO") .. "]|r")
                    syschat("|cffFFD700    +" .. bonus .. " " .. hg_lib.get_text("GLORY_EXTRA", nil, "Gloria Extra") .. "!|r")
                    syschat("")
                    syschat("|cff00FF00  >>> " .. hg_lib.get_text("TOTAL_EARNED", nil, "TOTALE GUADAGNATO") .. ": +" .. (total_glory + bonus) .. " " .. glory_label .. " <<<|r")
                    syschat("")
                    syschat("|cffFF6600  [" .. hg_lib.get_text("ACTIVATED", nil, "ATTIVATO") .. "] " .. hg_lib.get_text("FRACTURE_BONUS", nil, "Bonus Fratture +50%") .. "|r")
                    syschat("|cffAAAAAA  (" .. hg_lib.get_text("VALID_UNTIL_RESET", nil, "valido fino al reset di mezzanotte") .. ")|r")
                    syschat("|cffFFD700=============================================|r")
                    -- ============================================
                    
                    local msg = hg_lib.get_text("mission_all_complete") or "TUTTE LE MISSIONI COMPLETE! BONUS x1.5!"
                    hg_lib.hunter_speak_color(msg, "GOLD")
                    
                    cmdchat("HunterAllMissionsComplete " .. bonus .. "|FRACTURE_BONUS_ACTIVE")
                end
            end
        end
    end
end

-- Funzione per attivare il bonus fratture
function hg_lib.activate_fracture_bonus()
    local pid = pc.get_player_id()
    -- Usa il giorno dell'anno (1-366) come numero intero invece di stringa
    local day_of_year = tonumber(os.date("%j")) or 0
    pc.setqf("hq_fracture_bonus_active", 1)
    pc.setqf("hq_fracture_bonus_day", day_of_year)
end

-- Funzione per controllare se il bonus fratture è ancora attivo
function hg_lib.has_fracture_bonus()
    local pid = pc.get_player_id()
    local today_num = tonumber(os.date("%j")) or 0
    local bonus_active = pc.getqf("hq_fracture_bonus_active") or 0
    local bonus_day = pc.getqf("hq_fracture_bonus_day") or 0
    
    -- Il bonus scade al reset delle missioni (nuovo giorno)
    if bonus_active == 1 and bonus_day == today_num then
        return true
    else
        -- Resetta il bonus se è il giorno dopo
        pc.setqf("hq_fracture_bonus_active", 0)
        return false
    end
end

function hg_lib.on_mob_kill(mob_vnum)
    local pid = pc.get_player_id()
    local mob_info = hg_lib.get_mob_info(mob_vnum)

    -- FIX: Accumula TUTTI i tipi nel buffer PRIMA del flush
    -- Questo evita che il throttle blocchi gli altri tipi
    _G.hunter_mission_buffer = _G.hunter_mission_buffer or {}
    _G.hunter_mission_buffer[pid] = _G.hunter_mission_buffer[pid] or {}
    local player_buffer = _G.hunter_mission_buffer[pid]
    
    -- Accumula per kill_mob (sempre)
    local key_mob = "kill_mob_" .. mob_vnum
    local key_mob_generic = "kill_mob_0"
    player_buffer[key_mob] = (player_buffer[key_mob] or 0) + 1
    player_buffer[key_mob_generic] = (player_buffer[key_mob_generic] or 0) + 1
    
    -- Accumula per kill_boss (sempre - sara' la missione a filtrare per target_vnum)
    local key_boss = "kill_boss_" .. mob_vnum
    local key_boss_generic = "kill_boss_0"
    player_buffer[key_boss] = (player_buffer[key_boss] or 0) + 1
    player_buffer[key_boss_generic] = (player_buffer[key_boss_generic] or 0) + 1
    
    -- Accumula per kill_metin (sempre - sara' la missione a filtrare per target_vnum)
    local key_metin = "kill_metin_" .. mob_vnum
    local key_metin_generic = "kill_metin_0"
    player_buffer[key_metin] = (player_buffer[key_metin] or 0) + 1
    player_buffer[key_metin_generic] = (player_buffer[key_metin_generic] or 0) + 1
    
    -- ORA fai il flush (una sola volta, con tutti i dati nel buffer)
    hg_lib.flush_mission_buffer(pid)
    
    -- Se è un elite, controlla completamento trial
    if mob_info ~= nil then
        hg_lib.check_trial_completion_status()
    end
end

function hg_lib.check_trial_completion_status()
    local pid = pc.get_player_id()
    
    -- IMPORTANTE: Prima flush i trial pendenti per avere dati aggiornati
    -- Necessario per rilevare completamento in tempo reale
    local boss_kills = pc.getqf("hq_trial_boss_kill") or 0
    local metin_kills = pc.getqf("hq_trial_metin_kill") or 0
    local chest_opens = pc.getqf("hq_trial_chest_open") or 0
    local fracture_seals = pc.getqf("hq_trial_fracture_seal") or 0
    
    -- Se ci sono valori pendenti, flush prima del check
    if boss_kills > 0 or metin_kills > 0 or chest_opens > 0 or fracture_seals > 0 then
        local flush_q = string.format([[
            UPDATE srv1_hunabku.hunter_player_trials 
            SET boss_kills = boss_kills + %d,
                metin_kills = metin_kills + %d,
                chest_opens = chest_opens + %d,
                fracture_seals = fracture_seals + %d
            WHERE player_id = %d AND status = 'in_progress'
        ]], boss_kills, metin_kills, chest_opens, fracture_seals, pid)
        mysql_direct_query(flush_q)
        
        -- Reset accumulatori
        pc.setqf("hq_trial_boss_kill", 0)
        pc.setqf("hq_trial_metin_kill", 0)
        pc.setqf("hq_trial_chest_open", 0)
        pc.setqf("hq_trial_fracture_seal", 0)
    end
    
    -- Chiama la procedura che verifica se i requisiti sono soddisfatti
    -- Restituisce: completed (1/0), new_rank, reward, title
    local q = "CALL srv1_hunabku.sp_check_trial_complete(" .. pid .. ", @completed, @new_rank, @reward, @title)"
    mysql_direct_query(q)
    local c, d = mysql_direct_query("SELECT @completed as res, @new_rank as nr, @reward as rw, @title as tt")
    
    if c > 0 and d[1] and tonumber(d[1].res) == 1 then
        local new_rank = d[1].nr
        local reward = tonumber(d[1].rw) or 0
        local title = d[1].tt or ""
        
        -- Effetto sonoro/visivo
        cmdchat("HunterTrialComplete " .. new_rank .. "|" .. reward .. "|Rank+Up")
        
        -- Messaggio in chat
        local trial_complete_msg = hg_lib.get_text("TRIAL_COMPLETE_RANK", {RANK = new_rank}, "PROVA COMPLETATA! Sei stato promosso al rango " .. new_rank .. "!")
        local trial_reward_msg = hg_lib.get_text("TRIAL_REWARD", {REWARD = reward}, "Ricompensa: +" .. reward .. " Gloria")
        syschat("|cffFFD700[HUNTER SYSTEM]|r " .. trial_complete_msg)
        syschat("|cffFFD700[HUNTER SYSTEM]|r " .. trial_reward_msg)
        
        -- Aggiorna il rank in memoria del client
        local rank_idx = hg_lib.get_rank_index_by_letter(new_rank)
        pc.setqf("hq_rank_num", rank_idx)
        
        -- Aggiorna interfaccia
        hg_lib.send_player_data()
    end
end

function hg_lib.on_boss_kill(boss_vnum)
    local pid = pc.get_player_id()
    -- Aggiorna missioni giornaliere
    hg_lib.update_mission_progress("kill_boss", 1, boss_vnum)
    -- PERFORMANCE: Accumula Trial progress invece di query immediata
    hg_lib.add_trial_progress("boss_kill", 1)
    -- CHECK: Se evento "first_boss" attivo, il PRIMO a uccidere vince!
    hg_lib.check_first_boss_winner(boss_vnum)
end

function hg_lib.on_metin_kill(metin_vnum)
    local pid = pc.get_player_id()
    -- Aggiorna missioni giornaliere
    hg_lib.update_mission_progress("kill_metin", 1, metin_vnum)
    -- PERFORMANCE: Accumula Trial progress invece di query immediata
    hg_lib.add_trial_progress("metin_kill", 1)
end

function hg_lib.on_fracture_seal()
    local pid = pc.get_player_id()
    local fracture_vid = pc.getqf("hq_defense_fracture_vid") or 0
    
    -- Security Log: Fracture sealed
    local frank = "E"
    if hunter_defense_data and hunter_defense_data[pid] then
        frank = hunter_defense_data[pid].rank or "E"
    end
    hg_lib.log_fracture_seal(fracture_vid, frank, 0)

    -- 1. Aggiorna Missioni Giornaliere (Tabella: hunter_player_missions)
    hg_lib.update_mission_progress("seal_fracture", 1, 0)

    -- 2. PERFORMANCE: Accumula Trial progress invece di query immediata
    hg_lib.add_trial_progress("fracture_seal", 1)

    -- 3. Controlla se la prova è stata completata con questa azione
    hg_lib.check_trial_completion_status()
    
    -- 4. Registra partecipazione automatica all'evento (se attivo)
    hg_lib.register_event_participant()
end

function hg_lib.check_missions_reminder()
    local pid = pc.get_player_id()
    local today = hg_lib.get_today_date()
    local ts = get_time()
    local current_hour = hg_lib.get_hour_from_ts(ts)
        
    if current_hour < 22 then return end
        
    local last_reminder = pc.getqf("hq_last_reminder_hour") or 0
    if last_reminder == current_hour then return end
        
    local c, d = mysql_direct_query("SELECT COUNT(*) as total, SUM(CASE WHEN status='completed' THEN 1 ELSE 0 END) as completed FROM srv1_hunabku.hunter_player_missions WHERE player_id=" .. pid .. " AND assigned_date='" .. today .. "'")
        
    if c > 0 and d[1] then
        local total = tonumber(d[1].total) or 0
        local completed = tonumber(d[1].completed) or 0
        local incomplete = total - completed
            
        if incomplete > 0 and total >= 3 then
            pc.setqf("hq_last_reminder_hour", current_hour)
            local hours_left = 24 - current_hour
            local warning_msg = hg_lib.get_text("WARNING_INCOMPLETE_MISSIONS", {COUNT = incomplete}, "Hai " .. incomplete .. " missioni incomplete!")
            local reset_msg = hg_lib.get_text("RESET_IN_HOURS", {HOURS = hours_left}, "Reset tra " .. hours_left .. " ore")
            local penalty_msg = hg_lib.get_text("COMPLETE_TO_AVOID_PENALTY", nil, "Completa per evitare penalita'!")
            syschat("|cffFF4444========================================|r")
            syschat("|cffFF0000  [" .. hg_lib.get_text("WARNING", nil, "ATTENZIONE") .. "]|r |cffFFFFFF" .. warning_msg .. "|r")
            syschat("|cffFFAA00  " .. reset_msg .. "|r |cffFF4444- " .. penalty_msg .. "|r")
            syschat("|cffFF4444========================================|r")
        end
    end
end

function hg_lib.send_today_events(openWindow)
    local t = os.date("*t")
    local wday = t.wday - 1
    local day_db = wday
    if wday == 0 then day_db = 7 end
        
    local current_hour = t.hour
    local current_minute = t.min
    local current_total = current_hour * 60 + current_minute
        
    local q = "SELECT id, event_name, event_type, event_desc, start_hour, start_minute, duration_minutes, min_rank, reward_glory_base, reward_glory_winner, color_scheme FROM srv1_hunabku.hunter_scheduled_events WHERE enabled=1 AND FIND_IN_SET(" .. day_db .. ", days_active) > 0 ORDER BY start_hour, start_minute"
    local c, d = mysql_direct_query(q)
    local BATCH_SIZE = 5
    local events_sent = 0
        
    cmdchat("HunterEventsCount " .. c)
        
    if c > 0 then
        local batch = ""
        for i = 1, c do
            local e = d[i]
            local start_hour = tonumber(e.start_hour) or 0
            local start_minute = tonumber(e.start_minute) or 0
            local duration = tonumber(e.duration_minutes) or 30
            local start_total = start_hour * 60 + start_minute
            local end_total = start_total + duration
            local end_hour = math.floor(end_total / 60)
            local end_minute = hg_lib.modulo(end_total, 60)
            
            if end_hour >= 24 then end_hour = end_hour - 24 end
                
            local status = "upcoming"
            if current_total >= start_total and current_total < end_total then
                status = "active"
            elseif current_total >= end_total then
                status = "ended"
            end
                
            local start_time = hg_lib.format_time(start_hour, start_minute)
            local end_time = hg_lib.format_time(end_hour, end_minute)
            local reward_str = "+" .. (e.reward_glory_base or 50) .. "+Gloria"
            local winner_prize = tonumber(e.reward_glory_winner) or 200
                
            local pkt = tostring(tonumber(e.id) or 0) .. "~" ..
                hg_lib.clean_str(e.event_name or "Evento") .. "~" ..
                start_time .. "~" ..
                end_time .. "~" ..
                (e.event_type or "glory_rush") .. "~" ..
                reward_str .. "~" ..
                status .. "~" ..
                (e.min_rank or "E") .. "~" ..
                winner_prize
                
            if batch ~= "" then batch = batch .. ";" end
            batch = batch .. pkt
            events_sent = events_sent + 1
                
            if events_sent >= BATCH_SIZE or i == c then
                cmdchat("HunterEventBatch " .. batch)
                batch = ""
                events_sent = 0
            end
        end
    end
        
    if openWindow then
        cmdchat("HunterEventsOpen")
    end
end

function hg_lib.check_active_event_notify()
    local event = hg_lib.get_current_scheduled_event()
    if event then
        local name = event.event_name or "Evento"
        local etype = event.event_type or "glory_rush"
        local desc = event.event_desc or ""
        local reward = tonumber(event.reward_glory_base) or 50
        local winner_reward = tonumber(event.reward_glory_winner) or 200
        local color = event.color_scheme or "GOLD"
        local duration = tonumber(event.duration_minutes) or 30
            
        local ts = get_time()
        local current_hour = hg_lib.get_hour_from_ts(ts)
        local current_minute = hg_lib.get_min_from_ts(ts)
        local current_total = current_hour * 60 + current_minute
        local start_total = tonumber(event.start_hour) * 60 + tonumber(event.start_minute)
        local end_total = start_total + duration
        local remaining = end_total - current_total
            
        pc.setqf("hq_event_reward", reward)
        pc.setqf("hq_event_remaining", remaining)
        pc.setqf("hq_event_winner", winner_reward)
            
        timer("hq_event_notify", 8)
        cmdchat("HunterEventStatus " .. hg_lib.clean_str(name) .. "|" .. remaining * 60 .. "|" .. etype)
    end
end

function hg_lib.join_event(event_id)
    local pid = pc.get_player_id()
    local c, d = mysql_direct_query("SELECT event_name, event_type, reward_glory_base, reward_glory_winner, min_rank, color_scheme FROM srv1_hunabku.hunter_scheduled_events WHERE id=" .. event_id)
    if c == 0 then
        hg_lib.hunter_speak("Evento non trovato.")
        return
    end
        
    local event_name = d[1].event_name or "Evento"
    local event_type = d[1].event_type or "glory_rush"
    local glory_base = tonumber(d[1].reward_glory_base) or 50
    local glory_winner = tonumber(d[1].reward_glory_winner) or 200
    local min_rank = d[1].min_rank or "E"
    local color = d[1].color_scheme or "GOLD"
        
    local rc, rd = mysql_direct_query("SELECT total_points FROM srv1_hunabku.hunter_quest_ranking WHERE player_id=" .. pid)
    local pts = 0
    if rc > 0 and rd[1] then pts = tonumber(rd[1].total_points) or 0 end
    local player_rank_num = hg_lib.get_rank_index(pts)
    local required_rank_num = hg_lib.get_rank_index_by_letter(min_rank)
        
    if player_rank_num < required_rank_num then
        hg_lib.hunter_speak_color(hg_lib.get_text("RANK_INSUFFICIENT", {RANK = min_rank}, "Rank insufficiente! Richiesto: " .. min_rank .. "-Rank"), "RED")
        return
    end
        
    mysql_direct_query("UPDATE srv1_hunabku.hunter_quest_ranking SET total_points = total_points + " .. glory_base .. ", spendable_points = spendable_points + " .. glory_base .. ", daily_points = daily_points + " .. glory_base .. ", weekly_points = weekly_points + " .. glory_base .. " WHERE player_id=" .. pid)
    
    -- === SYSCHAT DETTAGLIATO PARTECIPAZIONE EVENTO ===
    local event_reg_label = hg_lib.get_text("EVENT_REGISTRATION", nil, "ISCRIZIONE EVENTO")
    syschat("|cffFFAA00========================================|r")
    syschat("|cffFFAA00  [" .. event_reg_label .. "]|r |cffFFFFFF" .. event_name .. "|r")
    syschat("|cffFFAA00========================================|r")
    syschat("")
    syschat("|cff00FFFF  " .. hg_lib.get_text("GLORY", nil, "Gloria") .. ":|r |cffFFFFFF+" .. glory_base .. "|r")
    if event_type == "first_rift" or event_type == "first_boss" then
        syschat("|cffFFD700  " .. hg_lib.get_text("REWARD", nil, "Premio") .. " 1°:|r |cffFF6600+" .. glory_winner .. " " .. hg_lib.get_text("GLORY", nil, "Gloria") .. "!|r")
    elseif event_type == "glory_rush" then
        syschat("|cffFF6600  [" .. hg_lib.get_text("BONUS", nil, "BONUS") .. "] " .. hg_lib.get_text("EVENT_BONUS_ACTIVE", nil, "Gloria aumentata durante evento!") .. "|r")
    end
    syschat("")
    syschat("|cff00FF00  >>> " .. hg_lib.get_text("TOTAL", nil, "TOTALE") .. ": +" .. glory_base .. " " .. hg_lib.get_text("GLORY", nil, "Gloria") .. " <<<|r")
    syschat("|cffFFAA00========================================|r")
    -- ==================================================
        
    local msg = hg_lib.get_text("EVENT_JOINED", {NAME = event_name}, "Partecipi a " .. event_name) .. "! +" .. glory_base .. " " .. hg_lib.get_text("GLORY", nil, "Gloria")
    if event_type == "first_rift" or event_type == "first_boss" then
        msg = msg .. " (" .. hg_lib.get_text("REWARD", nil, "Premio") .. " 1°: +" .. glory_winner .. "!)"
    elseif event_type == "glory_rush" then
        msg = msg .. " (" .. hg_lib.get_text("BONUS", nil, "Bonus") .. " " .. hg_lib.get_text("GLORY", nil, "Gloria") .. "!)"
    end
        
    hg_lib.hunter_speak_color(msg, color)
    cmdchat("HunterEventJoined " .. event_id .. "|" .. hg_lib.clean_str(event_name) .. "|" .. glory_base)
        
    hg_lib.send_player_data()
end

-- ============================================================
-- SHOP SYSTEM
-- ============================================================
function hg_lib.shop_buy_item(item_id)
    local pid = pc.get_player_id()
    
    -- Prendi info item dallo shop (usa hunter_quest_shop esistente)
    local q = "SELECT description, price_points, item_vnum, item_count FROM srv1_hunabku.hunter_quest_shop WHERE id=" .. item_id .. " AND enabled=1"
    local c, d = mysql_direct_query(q)
    
    if c == 0 then
        hg_lib.syschat_t("SHOP_NOT_AVAILABLE", "Oggetto non disponibile.", nil, "FF0000")
        return
    end

    local item_name = d[1].description or "Item"
    local price = tonumber(d[1].price_points) or 0
    local item_vnum = tonumber(d[1].item_vnum) or 0
    local item_count = tonumber(d[1].item_count) or 1

    -- Controlla gloria spendibile
    local rc, rd = mysql_direct_query("SELECT spendable_points FROM srv1_hunabku.hunter_quest_ranking WHERE player_id=" .. pid)
    if rc == 0 then
        hg_lib.syschat_t("SHOP_NOT_HUNTER", "Non sei un Hunter!", nil, "FF0000")
        return
    end

    local spendable = tonumber(rd[1].spendable_points) or 0

    -- Controlla gloria spendibile
    if spendable < price then
        syschat("|cffFF0000[SHOP]|r " .. hg_lib.get_text("SHOP_INSUFFICIENT", {HAVE = spendable, NEED = price}, "Gloria insufficiente! Hai " .. spendable .. ", serve " .. price))
        return
    end

    -- Controlla inventario
    if pc.count_empty_inventory(0) < 1 then
        hg_lib.syschat_t("SHOP_INV_FULL", "Inventario pieno!", nil, "FF0000")
        return
    end

    -- Esegui acquisto
    mysql_direct_query("UPDATE srv1_hunabku.hunter_quest_ranking SET spendable_points = spendable_points - " .. price .. " WHERE player_id=" .. pid)
    pc.give_item2(item_vnum, item_count)

    syschat("|cff00FF00[SHOP]|r " .. hg_lib.get_text("SHOP_PURCHASED", {ITEM = item_name, COUNT = item_count}, "Acquistato: " .. item_name .. " x" .. item_count))
    syschat("|cffFFD700[SHOP]|r -" .. price .. " " .. hg_lib.get_text("SPENDABLE_GLORY", nil, "Gloria Spendibile"))
    
    -- Aggiorna UI
    hg_lib.send_player_data()
end

-- ============================================================
-- ACHIEVEMENTS SYSTEM
-- ============================================================
function hg_lib.get_player_achievements(pid)
    -- Prendi configurazione achievements
    local cq = "SELECT id, name, type, requirement, reward_vnum, reward_count FROM srv1_hunabku.hunter_quest_achievements_config WHERE enabled=1 ORDER BY type, requirement"
    local cc, cd = mysql_direct_query(cq)
    
    if cc == 0 then return {} end
    
    -- Prendi statistiche giocatore
    local sq = "SELECT total_kills, total_points FROM srv1_hunabku.hunter_quest_ranking WHERE player_id=" .. pid
    local sc, sd = mysql_direct_query(sq)
    
    local kills = 0
    local points = 0
    if sc > 0 and sd[1] then
        kills = tonumber(sd[1].total_kills) or 0
        points = tonumber(sd[1].total_points) or 0
    end
    
    -- Prendi achievements riscossi
    local claimed_map = {}
    local rq = "SELECT achievement_id FROM srv1_hunabku.hunter_achievements_claimed WHERE player_id=" .. pid
    local rc, rd = mysql_direct_query(rq)
    if rc > 0 then
        for i = 1, rc do
            claimed_map[tonumber(rd[i].achievement_id)] = true
        end
    end
    
    -- Costruisci lista
    local result = {}
    for i = 1, cc do
        local a = cd[i]
        local ach_id = tonumber(a.id)
        local ach_type = tonumber(a.type) or 1
        local req = tonumber(a.requirement) or 0
        
        -- type 1 = kills, type 2 = points
        local progress = (ach_type == 1) and kills or points
        local unlocked = progress >= req
        local claimed = claimed_map[ach_id] or false
        
        table.insert(result, {
            id = ach_id,
            name = a.name or "",
            progress = progress,
            requirement = req,
            unlocked = unlocked,
            claimed = claimed,
            reward_vnum = tonumber(a.reward_vnum) or 0,
            reward_count = tonumber(a.reward_count) or 1
        })
    end
    
    return result
end

function hg_lib.claim_achievement(ach_id)
    local pid = pc.get_player_id()
    
    -- Prendi info achievement
    local q = "SELECT name, type, requirement, reward_vnum, reward_count FROM srv1_hunabku.hunter_quest_achievements_config WHERE id=" .. ach_id .. " AND enabled=1"
    local c, d = mysql_direct_query(q)
    
    if c == 0 then
        hg_lib.syschat_t("ACH_NOT_FOUND", "Non trovato.", nil, "FF0000")
        return
    end

    local ach_name = d[1].name or "Achievement"
    local ach_type = tonumber(d[1].type) or 1
    local req = tonumber(d[1].requirement) or 0
    local reward_vnum = tonumber(d[1].reward_vnum) or 0
    local reward_count = tonumber(d[1].reward_count) or 1

    -- Controlla se gia riscosso
    local check_q = "SELECT id FROM srv1_hunabku.hunter_achievements_claimed WHERE player_id=" .. pid .. " AND achievement_id=" .. ach_id
    local cc = mysql_direct_query(check_q)
    if cc > 0 then
        hg_lib.syschat_t("ACH_ALREADY_CLAIMED", "Gia' riscosso!", nil, "FF6600")
        return
    end

    -- Controlla progresso
    local sq = "SELECT total_kills, total_points FROM srv1_hunabku.hunter_quest_ranking WHERE player_id=" .. pid
    local sc, sd = mysql_direct_query(sq)
    if sc == 0 then
        hg_lib.syschat_t("ACH_NOT_HUNTER", "Non sei un Hunter!", nil, "FF0000")
        return
    end

    local kills = tonumber(sd[1].total_kills) or 0
    local points = tonumber(sd[1].total_points) or 0
    local progress = (ach_type == 1) and kills or points

    if progress < req then
        syschat("|cffFF0000[" .. hg_lib.get_text("ACHIEVEMENT", nil, "TRAGUARDO") .. "]|r " .. hg_lib.get_text("ACH_NOT_UNLOCKED", {PROG = progress, REQ = req}, "Non ancora sbloccato! " .. progress .. "/" .. req))
        return
    end

    -- Controlla inventario
    if pc.count_empty_inventory(0) < 1 then
        hg_lib.syschat_t("ACH_INV_FULL", "Inventario pieno!", nil, "FF0000")
        return
    end

    -- Riscuoti
    mysql_direct_query("INSERT INTO srv1_hunabku.hunter_achievements_claimed (player_id, achievement_id, claimed_at) VALUES (" .. pid .. ", " .. ach_id .. ", NOW())")
    pc.give_item2(reward_vnum, reward_count)

    syschat("|cff00FF00[" .. hg_lib.get_text("ACHIEVEMENT", nil, "TRAGUARDO") .. "]|r " .. ach_name .. " " .. hg_lib.get_text("COMPLETED", nil, "completato") .. "!")
    syschat("|cffFFD700[" .. hg_lib.get_text("REWARD", nil, "RICOMPENSA") .. "]|r " .. hg_lib.get_text("ACH_RECEIVED", {COUNT = reward_count}, "Ricevuto x" .. reward_count .. " oggetto!"))
    
    -- Aggiorna UI
    cmdchat("HunterAchievementClaimed " .. ach_id)
end

function hg_lib.smart_claim_all()
    local pid = pc.get_player_id()
    local achievements = hg_lib.get_player_achievements(pid)
    local claimed_count = 0
    
    for _, a in ipairs(achievements) do
        if a.unlocked and not a.claimed then
            -- Controlla inventario
            if pc.count_empty_inventory(0) < 1 then
                syschat("|cffFF6600[SMART CLAIM]|r " .. hg_lib.get_text("SMART_INV_FULL", {COUNT = claimed_count}, "Inventario pieno! Riscossi " .. claimed_count .. " traguardi."))
                return
            end

            -- Riscuoti
            mysql_direct_query("INSERT INTO srv1_hunabku.hunter_achievements_claimed (player_id, achievement_id, claimed_at) VALUES (" .. pid .. ", " .. a.id .. ", NOW())")
            pc.give_item2(a.reward_vnum, a.reward_count)
            claimed_count = claimed_count + 1
        end
    end
    
    if claimed_count > 0 then
        syschat("|cff00FF00[SMART CLAIM]|r " .. hg_lib.get_text("SMART_CLAIMED", {COUNT = claimed_count}, "Riscossi " .. claimed_count .. " traguardi!"))
    else
        hg_lib.syschat_t("SMART_NONE", "Nessun traguardo da riscuotere.", nil, "FFD700")
    end
end

-- ============================================================
-- LANGUAGE DATABASE PERSISTENCE
-- ============================================================

-- Ottiene la lingua preferita del giocatore dal database MySQL
function hg_lib.get_player_language(pid)
    if not pid then pid = pc.get_player_id() end

    local c, d = mysql_direct_query("SELECT setting_value FROM srv1_hunabku.hunter_player_settings WHERE player_id=" .. pid .. " AND setting_key='language'")

    if c > 0 and d[1] then
        local val = d[1].setting_value
        -- Se e' una tabella (bug mysql_direct_query), prendi il primo elemento
        if type(val) == "table" then
            val = val[1]
        end
        if val and val ~= "" and hg_lib.translations[val] then
            return tostring(val)
        end
    end

    return "it"  -- Default: italiano
end

-- Imposta la lingua preferita del giocatore nel database MySQL
function hg_lib.set_player_language(pid, lang_code)
    if not pid then pid = pc.get_player_id() end
    if not lang_code then lang_code = "it" end

    -- Valida lingua contro traduzioni disponibili
    if not hg_lib.translations[lang_code] then
        lang_code = "it"
    end

    -- Upsert setting nel database
    mysql_direct_query("INSERT INTO srv1_hunabku.hunter_player_settings (player_id, setting_key, setting_value) VALUES ("
        .. pid .. ", 'language', '" .. lang_code .. "') ON DUPLICATE KEY UPDATE setting_value='" .. lang_code .. "'")
    
    return true
end

-- ============================================================
-- LANGUAGE CHANGE HANDLERS
-- ============================================================

-- Notifica il client del cambio lingua
function hg_lib.send_language_notification(lang_code)
    if not lang_code then
        lang_code = hg_lib.get_player_lang()
    end
    cmdchat("HunterLanguageChanged " .. lang_code)
    cmdchat("HunterTranslationsReady " .. lang_code)
end

-- Lista lingue disponibili (sincronizzata con hg_lib.translations)
function hg_lib.get_available_languages()
    return {
        {code = "it", name = "Italiano"},
        {code = "en", name = "English"},
        {code = "de", name = "Deutsch"},
        {code = "es", name = "Español"},
        {code = "fr", name = "Français"},
        {code = "pt", name = "Português"},
        {code = "pl", name = "Polski"},
        {code = "ru", name = "Русский"}
    }
end

-- Handler per cambio lingua dal client
function hg_lib.handle_language_change(new_lang)
    if hg_lib.set_player_lang(new_lang) then
        hg_lib.send_language_notification(new_lang)
        syschat("|cff00AAFF[HUNTER]|r " .. hg_lib.get_text("LANG_CHANGED", nil, "Lingua cambiata!"))
        return true
    end
    return false
end