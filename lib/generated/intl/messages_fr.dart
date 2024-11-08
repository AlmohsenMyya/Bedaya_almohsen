// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'fr';

  static String m0(boosterPrice, boosterPeriod) =>
      "En boostant votre profil, vous ferez partie des utilisateurs en vedette et aurez la priorité dans les recherches et les utilisateurs aléatoires. Cela vous coûtera ${boosterPrice} crédits pour une durée immédiate de ${boosterPeriod} minutes";

  static String m1(credits) => "${credits} crédits";

  static String m2(distanceUnit) => "Distance de ma position (${distanceUnit})";

  static String m3(error) => "Erreur : ${error}";

  static String m4(price) => "${price} crédits";

  static String m5(notFoundedProducts) => "${notFoundedProducts} non trouvé";

  static String m6(localUserProfileItemName) =>
      "Envoyer un cadeau à ${localUserProfileItemName}";

  static String m7(walletBalance) => "${walletBalance} crédits";

  static String m8(stickerFormattedPrice) =>
      "Voulez-vous acheter ce sticker ? Cela vous coûtera ${stickerFormattedPrice}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "aboutMe": MessageLookupByLibrary.simpleMessage("À propos de moi"),
        "aboutUs": MessageLookupByLibrary.simpleMessage("À propos de nous"),
        "abuseReport": MessageLookupByLibrary.simpleMessage("Signaler un abus"),
        "accountCreatedSuccessfully":
            MessageLookupByLibrary.simpleMessage("Compte créé avec succès"),
        "activateYourNewEmailAddress": MessageLookupByLibrary.simpleMessage(
            "Activez votre nouvelle adresse e-mail"),
        "alert": MessageLookupByLibrary.simpleMessage("Alerte"),
        "all": MessageLookupByLibrary.simpleMessage("Tous"),
        "allContentIncludingPhotosAndOtherDataWillBePermanently":
            MessageLookupByLibrary.simpleMessage(
                "Tout le contenu, y compris les photos et autres données, sera définitivement supprimé !"),
        "almostFinishedYouNeedToConfirmYourEmailAddressTo":
            MessageLookupByLibrary.simpleMessage(
                "Presque terminé... Vous devez confirmer votre adresse e-mail. Pour terminer le processus d\'activation, veuillez cliquer sur le lien dans l\'e-mail que nous venons de vous envoyer."),
        "and": MessageLookupByLibrary.simpleMessage(" et "),
        "apply": MessageLookupByLibrary.simpleMessage("Appliquer"),
        "areYouSure":
            MessageLookupByLibrary.simpleMessage("Êtes-vous sûr(e) ?"),
        "basic": MessageLookupByLibrary.simpleMessage("Basique"),
        "basicInformation":
            MessageLookupByLibrary.simpleMessage("Informations de base"),
        "bePremium": MessageLookupByLibrary.simpleMessage("Devenir Premium"),
        "bePremiumNow":
            MessageLookupByLibrary.simpleMessage("Devenez Premium maintenant"),
        "birthday": MessageLookupByLibrary.simpleMessage("Anniversaire"),
        "block": MessageLookupByLibrary.simpleMessage("Bloquer"),
        "boostAgain": MessageLookupByLibrary.simpleMessage("Booster à nouveau"),
        "boostMyProfile":
            MessageLookupByLibrary.simpleMessage("Booster mon profil"),
        "buyCredits":
            MessageLookupByLibrary.simpleMessage("Acheter des crédits"),
        "buyMoreCredits":
            MessageLookupByLibrary.simpleMessage("Acheter plus de crédits"),
        "byBoostingYourProfileYouWillBeAPartOf": m0,
        "cancel": MessageLookupByLibrary.simpleMessage("Annuler"),
        "changeEmail":
            MessageLookupByLibrary.simpleMessage("Changer l\'adresse e-mail"),
        "changePassword":
            MessageLookupByLibrary.simpleMessage("Changer le mot de passe"),
        "confirmNewPassword": MessageLookupByLibrary.simpleMessage(
            "Confirmer le nouveau mot de passe"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirmez le mot de passe"),
        "countryPhoneCode":
            MessageLookupByLibrary.simpleMessage("Code téléphonique du pays"),
        "creditPackages":
            MessageLookupByLibrary.simpleMessage("Forfaits de crédits"),
        "creditsCredits": m1,
        "currentEmail": MessageLookupByLibrary.simpleMessage("E-mail actuel"),
        "deleteAccount":
            MessageLookupByLibrary.simpleMessage("Supprimer le compte"),
        "deleteAllChatHistory": MessageLookupByLibrary.simpleMessage(
            "Supprimer l\'historique de chat"),
        "displayMobileNumber": MessageLookupByLibrary.simpleMessage(
            "Afficher le numéro de téléphone mobile"),
        "distanceFromMyLocationDistanceUnit": m2,
        "doYouWantToDeleteAllTheChatMessageOf":
            MessageLookupByLibrary.simpleMessage(
                "Voulez-vous supprimer tous les messages de chat de cet utilisateur ?"),
        "education": MessageLookupByLibrary.simpleMessage("Éducation"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "emailOrUsername":
            MessageLookupByLibrary.simpleMessage("Email ou Nom d\'utilisateur"),
        "emailOtp": MessageLookupByLibrary.simpleMessage("Code OTP par e-mail"),
        "encounter": MessageLookupByLibrary.simpleMessage("Rencontre"),
        "endOfResult":
            MessageLookupByLibrary.simpleMessage("Fin des résultats"),
        "error": MessageLookupByLibrary.simpleMessage("Erreur..."),
        "errorError": m3,
        "extendPremiumMembership": MessageLookupByLibrary.simpleMessage(
            "Prolonger l\'adhésion Premium"),
        "failed": MessageLookupByLibrary.simpleMessage("Échoué"),
        "failedToInitialize":
            MessageLookupByLibrary.simpleMessage("Échec de l\'initialisation"),
        "fetchingConsumables": MessageLookupByLibrary.simpleMessage(
            "Récupération des consommables..."),
        "fetchingProducts": MessageLookupByLibrary.simpleMessage(
            "Récupération des produits..."),
        "financialTransaction":
            MessageLookupByLibrary.simpleMessage("Transaction financière"),
        "find": MessageLookupByLibrary.simpleMessage("Trouver"),
        "firstName": MessageLookupByLibrary.simpleMessage("Prénom"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Mot de passe oublié ?"),
        "gender": MessageLookupByLibrary.simpleMessage("Genre"),
        "gift": MessageLookupByLibrary.simpleMessage("Cadeau"),
        "goBack": MessageLookupByLibrary.simpleMessage("Retour"),
        "goHome": MessageLookupByLibrary.simpleMessage("RETOUR À LA MAISON"),
        "goToLoginNow": MessageLookupByLibrary.simpleMessage(
            "Aller à la connexion maintenant"),
        "helloWorld":
            MessageLookupByLibrary.simpleMessage("Bonjour le monde !"),
        "home": MessageLookupByLibrary.simpleMessage("Accueil"),
        "iAcceptAllThe":
            MessageLookupByLibrary.simpleMessage("J\'accepte toutes les "),
        "itemPriceCredits": m4,
        "language": MessageLookupByLibrary.simpleMessage("Langue"),
        "lastName": MessageLookupByLibrary.simpleMessage("Nom de famille"),
        "letsGo": MessageLookupByLibrary.simpleMessage("Allons-y"),
        "loading": MessageLookupByLibrary.simpleMessage("Chargement..."),
        "loadingMessages":
            MessageLookupByLibrary.simpleMessage("Chargement des messages..."),
        "location": MessageLookupByLibrary.simpleMessage("Emplacement"),
        "login": MessageLookupByLibrary.simpleMessage("Connexion"),
        "lookingFor": MessageLookupByLibrary.simpleMessage("Recherche"),
        "maximumAge": MessageLookupByLibrary.simpleMessage("Âge maximum"),
        "maximumHeight":
            MessageLookupByLibrary.simpleMessage("Hauteur maximum"),
        "menuBlockedUsers":
            MessageLookupByLibrary.simpleMessage("Utilisateurs bloqués"),
        "menuChangeEmail":
            MessageLookupByLibrary.simpleMessage("Changer l\'adresse e-mail"),
        "menuChangePassword":
            MessageLookupByLibrary.simpleMessage("Changer le mot de passe"),
        "menuCreditWallet":
            MessageLookupByLibrary.simpleMessage("Portefeuille de crédits"),
        "menuFeaturedUsers":
            MessageLookupByLibrary.simpleMessage("Utilisateurs en vedette"),
        "menuLogout": MessageLookupByLibrary.simpleMessage("Déconnexion"),
        "menuMutualLikes":
            MessageLookupByLibrary.simpleMessage("Likes réciproques"),
        "menuMyDislikes": MessageLookupByLibrary.simpleMessage("Mes dégoûts"),
        "menuMyLikes": MessageLookupByLibrary.simpleMessage("Mes favoris"),
        "menuRandomUsers":
            MessageLookupByLibrary.simpleMessage("Utilisateurs aléatoires"),
        "menuSettings": MessageLookupByLibrary.simpleMessage("Paramètres"),
        "menuVisitors": MessageLookupByLibrary.simpleMessage("Visiteurs"),
        "menuWhoLikesMe": MessageLookupByLibrary.simpleMessage("Qui m\'aime"),
        "messenger": MessageLookupByLibrary.simpleMessage("Messager"),
        "minimumAge": MessageLookupByLibrary.simpleMessage("Âge minimum"),
        "minimumHeight":
            MessageLookupByLibrary.simpleMessage("Hauteur minimum"),
        "mobileNumber":
            MessageLookupByLibrary.simpleMessage("Numéro de téléphone mobile"),
        "myCreditWallet":
            MessageLookupByLibrary.simpleMessage("Mon portefeuille de crédits"),
        "myPhotos": MessageLookupByLibrary.simpleMessage("Mes photos"),
        "myProfile": MessageLookupByLibrary.simpleMessage("Mon profil"),
        "myProfileUpdate":
            MessageLookupByLibrary.simpleMessage("Mise à jour de mon profil"),
        "name": MessageLookupByLibrary.simpleMessage("Nom"),
        "newEmail": MessageLookupByLibrary.simpleMessage("Nouvel e-mail"),
        "newPassword":
            MessageLookupByLibrary.simpleMessage("Nouveau mot de passe"),
        "no": MessageLookupByLibrary.simpleMessage("Non"),
        "noResultFound":
            MessageLookupByLibrary.simpleMessage("Aucun résultat trouvé"),
        "notConnected": MessageLookupByLibrary.simpleMessage("Non connecté"),
        "notFoundedProductsNotFound": m5,
        "notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "on": MessageLookupByLibrary.simpleMessage("le"),
        "packageNotFound":
            MessageLookupByLibrary.simpleMessage("Forfait non trouvé"),
        "password": MessageLookupByLibrary.simpleMessage("Mot de passe"),
        "paymentMethod":
            MessageLookupByLibrary.simpleMessage("Méthode de paiement"),
        "personal": MessageLookupByLibrary.simpleMessage("Personnel"),
        "pleaseSelectAPlan": MessageLookupByLibrary.simpleMessage(
            "Veuillez sélectionner un plan"),
        "preferredLanguage":
            MessageLookupByLibrary.simpleMessage("Langue préférée"),
        "premium": MessageLookupByLibrary.simpleMessage("Premium"),
        "premiumMembershipExpiry": MessageLookupByLibrary.simpleMessage(
            "Expiration de l\'adhésion Premium"),
        "privacyPolicy": MessageLookupByLibrary.simpleMessage(
            "politique de confidentialité"),
        "privately": MessageLookupByLibrary.simpleMessage("Privément"),
        "profileCoverPhoto": MessageLookupByLibrary.simpleMessage(
            "Photo de couverture du profil"),
        "profilePhoto": MessageLookupByLibrary.simpleMessage("Photo de profil"),
        "purchaseCredits":
            MessageLookupByLibrary.simpleMessage("Acheter des crédits"),
        "reason": MessageLookupByLibrary.simpleMessage("Raison"),
        "register": MessageLookupByLibrary.simpleMessage("S\'inscrire"),
        "relationshipStatus":
            MessageLookupByLibrary.simpleMessage("État civil"),
        "report": MessageLookupByLibrary.simpleMessage("Rapport"),
        "reportAbuse": MessageLookupByLibrary.simpleMessage("Signaler un abus"),
        "reportUser":
            MessageLookupByLibrary.simpleMessage("Signaler un utilisateur"),
        "requestDenied":
            MessageLookupByLibrary.simpleMessage("Demande refusée"),
        "selectCountryCode":
            MessageLookupByLibrary.simpleMessage("Sélectionner le code pays"),
        "selectLanguage":
            MessageLookupByLibrary.simpleMessage("Sélectionner la langue"),
        "selectPlan":
            MessageLookupByLibrary.simpleMessage("Sélectionner un plan"),
        "send": MessageLookupByLibrary.simpleMessage("Envoyer"),
        "sendAGift": MessageLookupByLibrary.simpleMessage("Envoyer un cadeau"),
        "sendEmailOtp": MessageLookupByLibrary.simpleMessage(
            "Envoyer le code OTP par e-mail"),
        "sendGiftToLocalUserProfileItemName": m6,
        "settings": MessageLookupByLibrary.simpleMessage("Paramètres"),
        "showGiftsNotifications": MessageLookupByLibrary.simpleMessage(
            "Afficher les notifications de cadeaux"),
        "showLikesNotifications": MessageLookupByLibrary.simpleMessage(
            "Afficher les notifications de likes"),
        "showLoginNotificationsForYourLikedUsers":
            MessageLookupByLibrary.simpleMessage(
                "Afficher les notifications de connexion pour vos utilisateurs préférés"),
        "showMessagesNotifications": MessageLookupByLibrary.simpleMessage(
            "Afficher les notifications de messages"),
        "showVisitorNotifications": MessageLookupByLibrary.simpleMessage(
            "Afficher les notifications de visiteurs"),
        "signIn": MessageLookupByLibrary.simpleMessage("Se connecter"),
        "signInWithFacebook":
            MessageLookupByLibrary.simpleMessage("Se connecter avec Facebook"),
        "signInWithGoogle":
            MessageLookupByLibrary.simpleMessage("Se connecter avec Google"),
        "submit": MessageLookupByLibrary.simpleMessage("Soumettre"),
        "termsConditions":
            MessageLookupByLibrary.simpleMessage("conditions générales"),
        "thereAreNoResultsToShow": MessageLookupByLibrary.simpleMessage(
            "Il n\'y a pas de résultats à afficher."),
        "thisIsAPremiumFeatureToViewThisYouNeed":
            MessageLookupByLibrary.simpleMessage(
                "Il s\'agit d\'une fonctionnalité premium, pour la voir, vous devez d\'abord acheter un plan premium."),
        "totalLikes": MessageLookupByLibrary.simpleMessage("Total des likes"),
        "totalViews": MessageLookupByLibrary.simpleMessage("Total des vues"),
        "transaction": MessageLookupByLibrary.simpleMessage("Transaction"),
        "tryingToConnect":
            MessageLookupByLibrary.simpleMessage("Tentative de connexion..."),
        "unblock": MessageLookupByLibrary.simpleMessage("Débloquer"),
        "updatePhoto":
            MessageLookupByLibrary.simpleMessage("Mettre à jour la photo"),
        "updateSettings": MessageLookupByLibrary.simpleMessage(
            "Mettre à jour les paramètres"),
        "uploadNewPhotos": MessageLookupByLibrary.simpleMessage(
            "Télécharger de nouvelles photos"),
        "userBlocked":
            MessageLookupByLibrary.simpleMessage("Utilisateur bloqué"),
        "userHasBeenReportedSuccessfully": MessageLookupByLibrary.simpleMessage(
            "L\'utilisateur a été signalé avec succès"),
        "username": MessageLookupByLibrary.simpleMessage("Nom d\'utilisateur"),
        "version": MessageLookupByLibrary.simpleMessage("Version"),
        "walletBalanceCredits": m7,
        "welcome": MessageLookupByLibrary.simpleMessage(
            "L\'application de rencontres la plus attendue est ici !"),
        "welcomeSmallMessage": MessageLookupByLibrary.simpleMessage(
            "Rencontrer n\'a pas besoin d\'être difficile."),
        "workStatus":
            MessageLookupByLibrary.simpleMessage("Statut professionnel"),
        "yes": MessageLookupByLibrary.simpleMessage("Oui"),
        "yesDelete": MessageLookupByLibrary.simpleMessage("Oui, supprimer"),
        "youArePremiumUser": MessageLookupByLibrary.simpleMessage(
            "Vous êtes un utilisateur premium"),
        "youCanAcceptOrDenyUserMessageRequest":
            MessageLookupByLibrary.simpleMessage(
                "Vous pouvez accepter ou refuser la demande de message de l\'utilisateur."),
        "youHaveAlreadyDeclinedUserMessageRequest":
            MessageLookupByLibrary.simpleMessage(
                "Vous avez déjà refusé la demande de message de l\'utilisateur"),
        "youWantToDeleteThisImage": MessageLookupByLibrary.simpleMessage(
            "Voulez-vous supprimer cette image ?"),
        "youWantToPurchaseThisStickerItWillCostYou": m8,
        "yourBasicInformationFormWillComeHere":
            MessageLookupByLibrary.simpleMessage(
                "Votre formulaire d\'informations de base apparaîtra ici"),
        "yourDailyLimitForEncountersMayExceedOrThereAre":
            MessageLookupByLibrary.simpleMessage(
                "Votre limite quotidienne d\'encounters peut être dépassée ou il n\'y a pas d\'utilisateurs à afficher."),
        "yourEmailAddress":
            MessageLookupByLibrary.simpleMessage("Votre adresse e-mail"),
        "yourProfileIsBoostedFor": MessageLookupByLibrary.simpleMessage(
            "Votre profil est boosté pour"),
        "yourWalletBalance":
            MessageLookupByLibrary.simpleMessage("Solde de votre portefeuille")
      };
}
