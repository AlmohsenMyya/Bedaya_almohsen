import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get welcome => 'Bienvenue sur Abaan Apps!';

  @override
  String get welcomeSmallMessage => 'Votre voyage commence ici.';

  @override
  String get letsGo => 'Allons-y';

  @override
  String get menuFeaturedUsers => 'Utilisateurs en vedette';

  @override
  String get menuRandomUsers => 'Utilisateurs aléatoires';

  @override
  String get menuCreditWallet => 'Portefeuille de crédits';

  @override
  String get menuWhoLikesMe => 'Qui m\'aime';

  @override
  String get menuMutualLikes => 'J\'aime mutuels';

  @override
  String get menuMyLikes => 'Mes J\'aime';

  @override
  String get menuMyDislikes => 'Mes Je n\'aime pas';

  @override
  String get menuVisitors => 'Visiteurs';

  @override
  String get menuBlockedUsers => 'Utilisateurs bloqués';

  @override
  String get menuChangePassword => 'Changer le mot de passe';

  @override
  String get menuChangeEmail => 'Changer l\'email';

  @override
  String get menuSettings => 'Paramètres';

  @override
  String get menuLogout => 'Déconnexion';

  @override
  String get areYouSure => 'Êtes-vous sûr?';

  @override
  String get profilePhoto => 'Photo de profil';

  @override
  String get uploadNewPhotos => 'Télécharger de nouvelles photos';

  @override
  String get helloWorld => 'Bonjour le monde';

  @override
  String get bePremium => 'Devenir Premium';

  @override
  String get aboutUs => 'À propos de nous';

  @override
  String get version => 'Version';

  @override
  String get boostMyProfile => 'Booster mon profil';

  @override
  String get yourProfileIsBoostedFor => 'Votre profil est boosté pour';

  @override
  String byBoostingYourProfileYouWillBeAPartOf(Object booster_price, Object booster_period) {
    return 'En boostant votre profil, vous ferez partie des utilisateurs mis en avant et vous attirerez plus d\'attention. Cela coûte $booster_price crédits pour une durée de $booster_period minutes.';
  }

  @override
  String get boostAgain => 'Booster à nouveau';

  @override
  String get buyCredits => 'Acheter des crédits';

  @override
  String get yourDailyLimitForEncountersMayExceedOrThereAre => 'Votre limite quotidienne de rencontres peut être dépassée ou il n\'y a pas d\'utilisateurs disponibles.';

  @override
  String get find => 'Trouver';

  @override
  String get myProfile => 'Mon profil';

  @override
  String get encounter => 'Rencontre';

  @override
  String get myPhotos => 'Mes photos';

  @override
  String get messenger => 'Messagerie';

  @override
  String get register => 'S\'inscrire';

  @override
  String get youWantToDeleteThisImage => 'Voulez-vous supprimer cette image?';

  @override
  String get thereAreNoResultsToShow => 'Aucun résultat à afficher.';

  @override
  String get failed => 'Échec';

  @override
  String get notifications => 'Notifications';

  @override
  String get noResultFound => 'Aucun résultat trouvé';

  @override
  String get endOfResult => 'Fin des résultats';

  @override
  String get premium => 'Premium';

  @override
  String get youArePremiumUser => 'Vous êtes un utilisateur Premium';

  @override
  String get premiumMembershipExpiry => 'Expiration de l\'abonnement Premium';

  @override
  String itemPriceCredits(Object price) {
    return '$price crédits';
  }

  @override
  String get selectPlan => 'Sélectionner un plan';

  @override
  String get pleaseSelectAPlan => 'Veuillez sélectionner un plan.';

  @override
  String get ok => 'OK';

  @override
  String get extendPremiumMembership => 'Prolonger l\'abonnement Premium';

  @override
  String get bePremiumNow => 'Devenir Premium maintenant';

  @override
  String get gift => 'Cadeau';

  @override
  String get sendAGift => 'Envoyer un cadeau';

  @override
  String get privately => 'Privé';

  @override
  String get send => 'Envoyer';

  @override
  String get cancel => 'Annuler';

  @override
  String get reportAbuse => 'Signaler un abus';

  @override
  String get block => 'Bloquer';

  @override
  String get userBlocked => 'Utilisateur bloqué';

  @override
  String get unblock => 'Débloquer';

  @override
  String get totalLikes => 'Total des J\'aime';

  @override
  String get totalViews => 'Total des vues';

  @override
  String get aboutMe => 'À propos de moi';

  @override
  String get gender => 'Sexe';

  @override
  String get preferredLanguage => 'Langue préférée';

  @override
  String get relationshipStatus => 'Statut de la relation';

  @override
  String get education => 'Éducation';

  @override
  String get mobileNumber => 'Numéro de mobile';

  @override
  String get location => 'Emplacement';

  @override
  String get workStatus => 'Statut professionnel';

  @override
  String get birthday => 'Anniversaire';

  @override
  String get updatePhoto => 'Mettre à jour la photo';

  @override
  String get profileCoverPhoto => 'Photo de couverture de profil';

  @override
  String get myProfileUpdate => 'Mise à jour de mon profil';

  @override
  String get basicInformation => 'Informations de base';

  @override
  String get selectCountryCode => 'Sélectionner le code du pays';

  @override
  String get firstName => 'Prénom';

  @override
  String get lastName => 'Nom';

  @override
  String get language => 'Langue';

  @override
  String get countryPhoneCode => 'Code téléphonique du pays';

  @override
  String errorError(Object error) {
    return 'Erreur: $error';
  }

  @override
  String get yourBasicInformationFormWillComeHere => 'Votre formulaire d\'informations de base apparaîtra ici';

  @override
  String get purchaseCredits => 'Acheter des crédits';

  @override
  String get tryingToConnect => 'Essayer de se connecter...';

  @override
  String get notConnected => 'Non connecté';

  @override
  String get fetchingProducts => 'Récupération des produits...';

  @override
  String get creditPackages => 'Paquets de crédits';

  @override
  String notFoundedProductsNotFound(Object notFoundedProducts) {
    return '$notFoundedProducts non trouvés';
  }

  @override
  String get packageNotFound => 'Paquet non trouvé';

  @override
  String creditsCredits(Object credits) {
    return '$credits crédits';
  }

  @override
  String get fetchingConsumables => 'Récupération des consommables...';

  @override
  String get thisIsAPremiumFeatureToViewThisYouNeed => 'Ceci est une fonctionnalité Premium. Pour voir cela, vous devez être Premium.';

  @override
  String get all => 'Tout';

  @override
  String get basic => 'De base';

  @override
  String get name => 'Nom';

  @override
  String get username => 'Nom d\'utilisateur';

  @override
  String get lookingFor => 'Recherche';

  @override
  String get minimumAge => 'Âge minimum';

  @override
  String get maximumAge => 'Âge maximum';

  @override
  String distanceFromMyLocationDistanceUnit(Object distanceUnit) {
    return 'Distance de mon emplacement ($distanceUnit)';
  }

  @override
  String get personal => 'Personnel';

  @override
  String get minimumHeight => 'Taille minimum';

  @override
  String get maximumHeight => 'Taille maximum';

  @override
  String get apply => 'Appliquer';

  @override
  String get home => 'Accueil';

  @override
  String get myCreditWallet => 'Mon portefeuille de crédits';

  @override
  String get buyMoreCredits => 'Acheter plus de crédits';

  @override
  String get yourWalletBalance => 'Solde de votre portefeuille';

  @override
  String walletBalanceCredits(int walletBalance) {
    return '$walletBalance crédits';
  }

  @override
  String get financialTransaction => 'Transaction financière';

  @override
  String get transaction => 'Transaction';

  @override
  String get on => 'sur';

  @override
  String get paymentMethod => 'Méthode de paiement';

  @override
  String get abuseReport => 'Signalement d\'abus';

  @override
  String get userHasBeenReportedSuccessfully => 'L\'utilisateur a été signalé avec succès';

  @override
  String get report => 'Signaler';

  @override
  String get reason => 'Raison';

  @override
  String get reportUser => 'Signaler un utilisateur';

  @override
  String get goBack => 'Retour';

  @override
  String get changeEmail => 'Changer l\'email';

  @override
  String get activateYourNewEmailAddress => 'Activer votre nouvelle adresse email';

  @override
  String get almostFinishedYouNeedToConfirmYourEmailAddressTo => 'Presque terminé... Vous devez confirmer votre adresse email. Un lien de confirmation a été envoyé à votre email.';

  @override
  String get currentEmail => 'Email actuel';

  @override
  String get newEmail => 'Nouvel email';

  @override
  String get password => 'Mot de passe';

  @override
  String get changePassword => 'Changer le mot de passe';

  @override
  String get showVisitorNotifications => 'Afficher les notifications de visiteurs';

  @override
  String get showGiftsNotifications => 'Afficher les notifications de cadeaux';

  @override
  String get showMessagesNotifications => 'Afficher les notifications de messages';

  @override
  String get showLoginNotificationsForYourLikedUsers => 'Afficher les notifications de connexion pour les utilisateurs que vous aimez';

  @override
  String get displayMobileNumber => 'Afficher le numéro de mobile';

  @override
  String get updateSettings => 'Mettre à jour les paramètres';

  @override
  String get allContentIncludingPhotosAndOtherDataWillBePermanently => 'Tout le contenu, y compris les photos et autres données, sera définitivement supprimé!';

  @override
  String get confirmPassword => 'Confirmer le mot de passe';

  @override
  String get yesDelete => 'Oui, supprimer';

  @override
  String get deleteAccount => 'Supprimer le compte';

  @override
  String get alert => 'Alerte';

  @override
  String get error => 'erreur ...';

  @override
  String get doYouWantToDeleteAllTheChatMessageOf => 'Voulez-vous supprimer tous les messages de chat de';

  @override
  String get yes => 'Oui';

  @override
  String get no => 'Non';

  @override
  String get deleteAllChatHistory => 'Supprimer tout l\'historique des chats';

  @override
  String get loadingMessages => 'chargement des messages ...';

  @override
  String get requestDenied => 'Demande refusée';

  @override
  String get youHaveAlreadyDeclinedUserMessageRequest => 'Vous avez déjà refusé la demande de message de l\'utilisateur';

  @override
  String get youCanAcceptOrDenyUserMessageRequest => 'Vous pouvez accepter ou refuser la demande de message de l\'utilisateur.';

  @override
  String youWantToPurchaseThisStickerItWillCostYou(Object stickerFormattedPrice) {
    return 'Voulez-vous acheter cet autocollant? Cela vous coûtera $stickerFormattedPrice crédits.';
  }

  @override
  String get loading => 'chargement ...';

  @override
  String get showLikesNotifications => 'Afficher les notifications de J\'aime';

  @override
  String get settings => 'Paramètres';

  @override
  String get selectLanguage => 'Choisir la langue';

  @override
  String get french => 'Français';

  @override
  String get english => 'Anglais';

  @override
  String sendGiftToLocalUserProfileItemName(Object localUserProfileItemName) {
    return 'Envoyer un cadeau à $localUserProfileItemName';
  }

  @override
  String get signIn => 'Se connecter';

  @override
  String get emailOrUsername => 'Email ou nom d\'utilisateur';

  @override
  String get login => 'Connexion';

  @override
  String get forgotPassword => 'Mot de passe oublié?';

  @override
  String get failedToInitialize => 'Échec de l\'initialisation';

  @override
  String get goHome => 'ACCUEIL';

  @override
  String get email => 'Email';

  @override
  String get iAcceptAllThe => 'J\'accepte tous les';

  @override
  String get and => ' et ';

  @override
  String get termsConditions => 'termes et conditions';

  @override
  String get privacyPolicy => 'politique de confidentialité';

  @override
  String get accountCreatedSuccessfully => 'Compte créé avec succès';

  @override
  String get goToLoginNow => 'Aller à la connexion maintenant';

  @override
  String get signInWithFacebook => 'Se connecter avec Facebook';

  @override
  String get signInWithGoogle => 'Se connecter avec Google';

  @override
  String get yourEmailAddress => 'Votre adresse email';

  @override
  String get sendEmailOtp => 'Envoyer OTP par email';

  @override
  String get emailOtp => 'Email OTP';

  @override
  String get newPassword => 'Nouveau mot de passe';

  @override
  String get confirmNewPassword => 'Confirmer le nouveau mot de passe';

  @override
  String get submit => 'Soumettre';
}
