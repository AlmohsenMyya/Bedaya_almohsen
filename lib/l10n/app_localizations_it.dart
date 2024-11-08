import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get welcome => 'La tanto attesa app di incontri è qui!';

  @override
  String get welcomeSmallMessage => 'Gli incontri non devono essere difficili.';

  @override
  String get letsGo => 'Andiamo';

  @override
  String get menuFeaturedUsers => 'Utenti in primo piano';

  @override
  String get menuRandomUsers => 'Utenti casuali';

  @override
  String get menuCreditWallet => 'Portafoglio Crediti';

  @override
  String get menuWhoLikesMe => 'Chi mi piace';

  @override
  String get menuMutualLikes => 'Mi piace reciproci';

  @override
  String get menuMyLikes => 'I miei Mi piace';

  @override
  String get menuMyDislikes => 'I miei Non mi piace';

  @override
  String get menuVisitors => 'Visitatori';

  @override
  String get menuBlockedUsers => 'Utenti bloccati';

  @override
  String get menuChangePassword => 'Cambia password';

  @override
  String get menuChangeEmail => 'Cambia email';

  @override
  String get menuSettings => 'Impostazioni';

  @override
  String get menuLogout => 'Esci';

  @override
  String get areYouSure => 'Sei sicuro?';

  @override
  String get profilePhoto => 'Foto del profilo';

  @override
  String get uploadNewPhotos => 'Carica nuove foto';

  @override
  String get helloWorld => 'Ciao mondo!';

  @override
  String get bePremium => 'Diventa Premium';

  @override
  String get aboutUs => 'Chi siamo';

  @override
  String get version => 'Versione';

  @override
  String get boostMyProfile => 'Potenzia il mio profilo';

  @override
  String get yourProfileIsBoostedFor => 'Il tuo profilo è potenziato per';

  @override
  String byBoostingYourProfileYouWillBeAPartOf(Object booster_price, Object booster_period) {
    return 'Potenziando il tuo profilo farai parte degli utenti in primo piano e avrai priorità nelle ricerche e tra gli utenti casuali. Costerà $booster_price crediti per $booster_period minuti immediati';
  }

  @override
  String get boostAgain => 'Potenzia di nuovo';

  @override
  String get buyCredits => 'Compra crediti';

  @override
  String get yourDailyLimitForEncountersMayExceedOrThereAre => 'Il limite giornaliero per gli incontri potrebbe essere superato o non ci sono utenti da mostrare.';

  @override
  String get find => 'Trova';

  @override
  String get myProfile => 'Il mio profilo';

  @override
  String get encounter => 'Incontro';

  @override
  String get myPhotos => 'Le mie foto';

  @override
  String get messenger => 'Messaggero';

  @override
  String get register => 'Registrati';

  @override
  String get youWantToDeleteThisImage => 'Vuoi eliminare questa immagine?';

  @override
  String get thereAreNoResultsToShow => 'Non ci sono risultati da mostrare.';

  @override
  String get failed => 'Fallito';

  @override
  String get notifications => 'Notifiche';

  @override
  String get noResultFound => 'nessun risultato trovato';

  @override
  String get endOfResult => 'fine dei risultati';

  @override
  String get premium => 'Premium';

  @override
  String get youArePremiumUser => 'Sei un utente Premium';

  @override
  String get premiumMembershipExpiry => 'Scadenza abbonamento Premium';

  @override
  String itemPriceCredits(Object price) {
    return '$price crediti';
  }

  @override
  String get selectPlan => 'Seleziona il piano';

  @override
  String get pleaseSelectAPlan => 'Seleziona un piano';

  @override
  String get ok => 'OK';

  @override
  String get extendPremiumMembership => 'Estendi l\'abbonamento Premium';

  @override
  String get bePremiumNow => 'Diventa Premium ora';

  @override
  String get gift => 'Regalo';

  @override
  String get sendAGift => 'Invia un regalo';

  @override
  String get privately => 'Privatamente';

  @override
  String get send => 'Invia';

  @override
  String get cancel => 'Annulla';

  @override
  String get reportAbuse => 'Segnala abuso';

  @override
  String get block => 'Blocca';

  @override
  String get userBlocked => 'Utente bloccato';

  @override
  String get unblock => 'Sblocca';

  @override
  String get totalLikes => 'Mi piace totali';

  @override
  String get totalViews => 'Visualizzazioni totali';

  @override
  String get aboutMe => 'Su di me';

  @override
  String get gender => 'Genere';

  @override
  String get preferredLanguage => 'Lingua preferita';

  @override
  String get relationshipStatus => 'Stato civile';

  @override
  String get education => 'Educazione';

  @override
  String get mobileNumber => 'Numero di cellulare';

  @override
  String get location => 'Posizione';

  @override
  String get workStatus => 'Stato lavorativo';

  @override
  String get birthday => 'Compleanno';

  @override
  String get updatePhoto => 'Aggiorna foto';

  @override
  String get profileCoverPhoto => 'Foto di copertina del profilo';

  @override
  String get myProfileUpdate => 'Aggiornamento del mio profilo';

  @override
  String get basicInformation => 'Informazioni di base';

  @override
  String get selectCountryCode => 'Seleziona il codice del paese';

  @override
  String get firstName => 'Nome';

  @override
  String get lastName => 'Cognome';

  @override
  String get language => 'Lingua';

  @override
  String get countryPhoneCode => 'Codice telefonico del paese';

  @override
  String errorError(Object error) {
    return 'Errore: $error';
  }

  @override
  String get yourBasicInformationFormWillComeHere => 'Il modulo delle tue informazioni di base apparirà qui';

  @override
  String get purchaseCredits => 'Acquista crediti';

  @override
  String get tryingToConnect => 'Tentativo di connessione...';

  @override
  String get notConnected => 'Non connesso';

  @override
  String get fetchingProducts => 'Recupero dei prodotti...';

  @override
  String get creditPackages => 'Pacchetti crediti';

  @override
  String notFoundedProductsNotFound(Object notFoundedProducts) {
    return '$notFoundedProducts non trovato';
  }

  @override
  String get packageNotFound => 'Pacchetto non trovato';

  @override
  String creditsCredits(Object credits) {
    return '$credits crediti';
  }

  @override
  String get fetchingConsumables => 'Recupero dei consumabili...';

  @override
  String get thisIsAPremiumFeatureToViewThisYouNeed => 'Questa è una funzione premium, per visualizzarla devi prima acquistare un piano premium.';

  @override
  String get all => 'Tutto';

  @override
  String get basic => 'Base';

  @override
  String get name => 'Nome';

  @override
  String get username => 'Nome utente';

  @override
  String get lookingFor => 'Cerco';

  @override
  String get minimumAge => 'Età minima';

  @override
  String get maximumAge => 'Età massima';

  @override
  String distanceFromMyLocationDistanceUnit(Object distanceUnit) {
    return 'Distanza dalla mia posizione ($distanceUnit)';
  }

  @override
  String get personal => 'Personale';

  @override
  String get minimumHeight => 'Altezza minima';

  @override
  String get maximumHeight => 'Altezza massima';

  @override
  String get apply => 'Applica';

  @override
  String get home => 'Home';

  @override
  String get myCreditWallet => 'Il mio portafoglio crediti';

  @override
  String get buyMoreCredits => 'Compra più crediti';

  @override
  String get yourWalletBalance => 'Il saldo del tuo portafoglio';

  @override
  String walletBalanceCredits(int walletBalance) {
    return '$walletBalance crediti';
  }

  @override
  String get financialTransaction => 'Transazione Finanziaria';

  @override
  String get transaction => 'Transazione';

  @override
  String get on => 'su';

  @override
  String get paymentMethod => 'Metodo di Pagamento';

  @override
  String get abuseReport => 'Segnalazione di Abuso';

  @override
  String get userHasBeenReportedSuccessfully => 'L\'utente è stato segnalato con successo';

  @override
  String get report => 'Segnala';

  @override
  String get reason => 'Motivo';

  @override
  String get reportUser => 'Segnala Utente';

  @override
  String get goBack => 'Torna Indietro';

  @override
  String get changeEmail => 'Cambia Email';

  @override
  String get activateYourNewEmailAddress => 'Attiva il tuo nuovo indirizzo email';

  @override
  String get almostFinishedYouNeedToConfirmYourEmailAddressTo => 'Quasi finito... Devi confermare il tuo indirizzo email. Per completare il processo di attivazione, fai clic sul link nell\'email che ti abbiamo appena inviato.';

  @override
  String get currentEmail => 'Email Attuale';

  @override
  String get newEmail => 'Nuova Email';

  @override
  String get password => 'Password';

  @override
  String get changePassword => 'Cambia Password';

  @override
  String get showVisitorNotifications => 'Mostra Notifiche dei Visitatori';

  @override
  String get showGiftsNotifications => 'Mostra Notifiche dei Regali';

  @override
  String get showMessagesNotifications => 'Mostra Notifiche dei Messaggi';

  @override
  String get showLoginNotificationsForYourLikedUsers => 'Mostra Notifiche di Accesso per gli Utenti Piaciuti';

  @override
  String get displayMobileNumber => 'Visualizza Numero di Cellulare';

  @override
  String get updateSettings => 'Aggiorna Impostazioni';

  @override
  String get allContentIncludingPhotosAndOtherDataWillBePermanently => 'Tutti i contenuti, incluse foto e altri dati, saranno rimossi permanentemente!';

  @override
  String get confirmPassword => 'Conferma Password';

  @override
  String get yesDelete => 'Sì, elimina';

  @override
  String get deleteAccount => 'Elimina Account';

  @override
  String get alert => 'Avviso';

  @override
  String get error => 'errore ...';

  @override
  String get doYouWantToDeleteAllTheChatMessageOf => 'Vuoi eliminare tutti i messaggi di chat di questo utente?';

  @override
  String get yes => 'Sì';

  @override
  String get no => 'No';

  @override
  String get deleteAllChatHistory => 'Elimina Tutta la Cronologia della Chat';

  @override
  String get loadingMessages => 'caricamento messaggi ...';

  @override
  String get requestDenied => 'Richiesta Negata';

  @override
  String get youHaveAlreadyDeclinedUserMessageRequest => 'Hai già rifiutato la richiesta di messaggio dell\'utente';

  @override
  String get youCanAcceptOrDenyUserMessageRequest => 'Puoi accettare o rifiutare la richiesta di messaggio dell\'utente.';

  @override
  String youWantToPurchaseThisStickerItWillCostYou(Object stickerFormattedPrice) {
    return 'Vuoi acquistare questo adesivo? Ti costerà $stickerFormattedPrice';
  }

  @override
  String get loading => 'caricamento ...';

  @override
  String get showLikesNotifications => 'Mostra Notifiche dei Mi Piace';

  @override
  String get settings => 'Impostazioni';

  @override
  String get selectLanguage => 'Seleziona Lingua';

  @override
  String get french => 'Francese';

  @override
  String get english => 'Inglese';

  @override
  String sendGiftToLocalUserProfileItemName(Object localUserProfileItemName) {
    return 'Invia Regalo a $localUserProfileItemName';
  }

  @override
  String get signIn => 'Accedi';

  @override
  String get emailOrUsername => 'Email o Nome Utente';

  @override
  String get login => 'Accesso';

  @override
  String get forgotPassword => 'Password Dimenticata?';

  @override
  String get failedToInitialize => 'Inizializzazione fallita';

  @override
  String get goHome => 'VAI ALLA HOME';

  @override
  String get email => 'Email';

  @override
  String get iAcceptAllThe => 'Accetto tutti i ';

  @override
  String get and => ' e ';

  @override
  String get termsConditions => 'termini e condizioni';

  @override
  String get privacyPolicy => 'informativa sulla privacy';

  @override
  String get accountCreatedSuccessfully => 'Account Creato con Successo';

  @override
  String get goToLoginNow => 'Vai al login ora';

  @override
  String get signInWithFacebook => 'Accedi con Facebook';

  @override
  String get signInWithGoogle => 'Accedi con Google';

  @override
  String get yourEmailAddress => 'Il tuo indirizzo email';

  @override
  String get sendEmailOtp => 'Invia OTP Email';

  @override
  String get emailOtp => 'OTP Email';

  @override
  String get newPassword => 'Nuova Password';

  @override
  String get confirmNewPassword => 'Conferma Nuova Password';

  @override
  String get submit => 'Invia';
}
