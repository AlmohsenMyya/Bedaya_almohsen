import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get welcome => 'Den mest efterlängtade dejtingappen är här!';

  @override
  String get welcomeSmallMessage => 'Dejting behöver inte vara svårt.';

  @override
  String get letsGo => 'Låt oss gå';

  @override
  String get menuFeaturedUsers => 'Utvalda användare';

  @override
  String get menuRandomUsers => 'Slumpmässiga användare';

  @override
  String get menuCreditWallet => 'Kreditplånbok';

  @override
  String get menuWhoLikesMe => 'Vem gillar mig';

  @override
  String get menuMutualLikes => 'Ömsesidiga gillanden';

  @override
  String get menuMyLikes => 'Mina gillanden';

  @override
  String get menuMyDislikes => 'Mina ogillanden';

  @override
  String get menuVisitors => 'Besökare';

  @override
  String get menuBlockedUsers => 'Blockerade användare';

  @override
  String get menuChangePassword => 'Ändra lösenord';

  @override
  String get menuChangeEmail => 'Ändra e-post';

  @override
  String get menuSettings => 'Inställningar';

  @override
  String get menuLogout => 'Logga ut';

  @override
  String get areYouSure => 'Är du säker?';

  @override
  String get profilePhoto => 'Profilfoto';

  @override
  String get uploadNewPhotos => 'Ladda upp nya foton';

  @override
  String get helloWorld => 'Hej världen!';

  @override
  String get bePremium => 'Bli Premium';

  @override
  String get aboutUs => 'Om oss';

  @override
  String get version => 'Version';

  @override
  String get boostMyProfile => 'Boosta min profil';

  @override
  String get yourProfileIsBoostedFor => 'Din profil är boostad i';

  @override
  String byBoostingYourProfileYouWillBeAPartOf(Object booster_price, Object booster_period) {
    return 'Genom att boosta din profil blir du en del av utvalda användare och får prioritet i sökningar och slumpmässiga användare. Det kostar $booster_price krediter för omedelbara $booster_period minuter.';
  }

  @override
  String get boostAgain => 'Boosta igen';

  @override
  String get buyCredits => 'Köp krediter';

  @override
  String get yourDailyLimitForEncountersMayExceedOrThereAre => 'Ditt dagliga begränsning för möten kan överstiga eller det finns inga användare att visa.';

  @override
  String get find => 'Hitta';

  @override
  String get myProfile => 'Min profil';

  @override
  String get encounter => 'Möte';

  @override
  String get myPhotos => 'Mina foton';

  @override
  String get messenger => 'Messenger';

  @override
  String get register => 'Registrera';

  @override
  String get youWantToDeleteThisImage => 'Vill du ta bort denna bild?';

  @override
  String get thereAreNoResultsToShow => 'Det finns inga resultat att visa.';

  @override
  String get failed => 'Misslyckades';

  @override
  String get notifications => 'Meddelanden';

  @override
  String get noResultFound => 'Inget resultat hittades';

  @override
  String get endOfResult => 'Slut på resultat';

  @override
  String get premium => 'Premium';

  @override
  String get youArePremiumUser => 'Du är en premiumanvändare';

  @override
  String get premiumMembershipExpiry => 'Premiummedlemskap löper ut';

  @override
  String itemPriceCredits(Object price) {
    return '$price krediter';
  }

  @override
  String get selectPlan => 'Välj Plan';

  @override
  String get pleaseSelectAPlan => 'Vänligen välj en plan';

  @override
  String get ok => 'OK';

  @override
  String get extendPremiumMembership => 'Förläng Premiummedlemskap';

  @override
  String get bePremiumNow => 'Bli Premium Nu';

  @override
  String get gift => 'Present';

  @override
  String get sendAGift => 'Skicka en Present';

  @override
  String get privately => 'Privat';

  @override
  String get send => 'Skicka';

  @override
  String get cancel => 'Avbryt';

  @override
  String get reportAbuse => 'Rapportera Missbruk';

  @override
  String get block => 'Blockera';

  @override
  String get userBlocked => 'Användare blockerad';

  @override
  String get unblock => 'Avblockera';

  @override
  String get totalLikes => 'Totalt Gillanden';

  @override
  String get totalViews => 'Totalt Visningar';

  @override
  String get aboutMe => 'Om Mig';

  @override
  String get gender => 'Kön';

  @override
  String get preferredLanguage => 'Föredraget Språk';

  @override
  String get relationshipStatus => 'Relationsstatus';

  @override
  String get education => 'Utbildning';

  @override
  String get mobileNumber => 'Mobilnummer';

  @override
  String get location => 'Plats';

  @override
  String get workStatus => 'Arbetsstatus';

  @override
  String get birthday => 'Födelsedag';

  @override
  String get updatePhoto => 'Uppdatera Foto';

  @override
  String get profileCoverPhoto => 'Profilomslagsfoto';

  @override
  String get myProfileUpdate => 'Min Profiluppdatering';

  @override
  String get basicInformation => 'Grundläggande Information';

  @override
  String get selectCountryCode => 'Välj Landskod';

  @override
  String get firstName => 'Förnamn';

  @override
  String get lastName => 'Efternamn';

  @override
  String get language => 'Språk';

  @override
  String get countryPhoneCode => 'Landstelefonkod';

  @override
  String errorError(Object error) {
    return 'Fel: $error';
  }

  @override
  String get yourBasicInformationFormWillComeHere => 'Ditt formulär för grundläggande information kommer här';

  @override
  String get purchaseCredits => 'Köp Krediter';

  @override
  String get tryingToConnect => 'Försöker att ansluta...';

  @override
  String get notConnected => 'Ej ansluten';

  @override
  String get fetchingProducts => 'Hämtar produkter...';

  @override
  String get creditPackages => 'Kreditpaket';

  @override
  String notFoundedProductsNotFound(Object notFoundedProducts) {
    return '$notFoundedProducts inte hittat';
  }

  @override
  String get packageNotFound => 'Paket inte hittat';

  @override
  String creditsCredits(Object credits) {
    return '$credits krediter';
  }

  @override
  String get fetchingConsumables => 'Hämtar förbrukningsvaror...';

  @override
  String get thisIsAPremiumFeatureToViewThisYouNeed => 'Det här är en premiumfunktion, för att se detta behöver du köpa premiumplanen först.';

  @override
  String get all => 'Alla';

  @override
  String get basic => 'Grundläggande';

  @override
  String get name => 'Namn';

  @override
  String get username => 'Användarnamn';

  @override
  String get lookingFor => 'Söker';

  @override
  String get minimumAge => 'Minsta Ålder';

  @override
  String get maximumAge => 'Högsta Ålder';

  @override
  String distanceFromMyLocationDistanceUnit(Object distanceUnit) {
    return 'Avstånd från min plats ($distanceUnit)';
  }

  @override
  String get personal => 'Personligt';

  @override
  String get minimumHeight => 'Minsta Höjd';

  @override
  String get maximumHeight => 'Högsta Höjd';

  @override
  String get apply => 'Använd';

  @override
  String get home => 'Hem';

  @override
  String get myCreditWallet => 'Min Kreditplånbok';

  @override
  String get buyMoreCredits => 'Köp Mer Krediter';

  @override
  String get yourWalletBalance => 'Din Plånbok Balans';

  @override
  String walletBalanceCredits(int walletBalance) {
    return '$walletBalance krediter';
  }

  @override
  String get financialTransaction => 'Ekonomisk transaktion';

  @override
  String get transaction => 'Transaktion';

  @override
  String get on => 'på';

  @override
  String get paymentMethod => 'Betalningsmetod';

  @override
  String get abuseReport => 'Rapportera missbruk';

  @override
  String get userHasBeenReportedSuccessfully => 'Användaren har rapporterats framgångsrikt';

  @override
  String get report => 'Rapportera';

  @override
  String get reason => 'Anledning';

  @override
  String get reportUser => 'Rapportera användare';

  @override
  String get goBack => 'Gå tillbaka';

  @override
  String get changeEmail => 'Ändra e-post';

  @override
  String get activateYourNewEmailAddress => 'Aktivera din nya e-postadress';

  @override
  String get almostFinishedYouNeedToConfirmYourEmailAddressTo => 'Nästan klar... Du behöver bekräfta din e-postadress. För att slutföra aktiveringsprocessen, klicka på länken i det e-postmeddelande vi precis skickade till dig.';

  @override
  String get currentEmail => 'Nuvarande e-post';

  @override
  String get newEmail => 'Ny e-post';

  @override
  String get password => 'Lösenord';

  @override
  String get changePassword => 'Ändra lösenord';

  @override
  String get showVisitorNotifications => 'Visa besökaraviseringar';

  @override
  String get showGiftsNotifications => 'Visa gåvomeddelanden';

  @override
  String get showMessagesNotifications => 'Visa meddelandeaviseringar';

  @override
  String get showLoginNotificationsForYourLikedUsers => 'Visa inloggningar för dina gillade användare';

  @override
  String get displayMobileNumber => 'Visa mobilnummer';

  @override
  String get updateSettings => 'Uppdatera inställningar';

  @override
  String get allContentIncludingPhotosAndOtherDataWillBePermanently => 'Allt innehåll inklusive foton och annan data kommer att raderas permanent!';

  @override
  String get confirmPassword => 'Bekräfta lösenord';

  @override
  String get yesDelete => 'Ja, radera';

  @override
  String get deleteAccount => 'Radera konto';

  @override
  String get alert => 'Varning';

  @override
  String get error => 'fel ...';

  @override
  String get doYouWantToDeleteAllTheChatMessageOf => 'Vill du ta bort alla chattmeddelanden från den här användaren?';

  @override
  String get yes => 'Ja';

  @override
  String get no => 'Nej';

  @override
  String get deleteAllChatHistory => 'Radera all chatt-historik';

  @override
  String get loadingMessages => 'Laddar meddelanden ...';

  @override
  String get requestDenied => 'Begäran nekad';

  @override
  String get youHaveAlreadyDeclinedUserMessageRequest => 'Du har redan avböjt användarmeddelandebegäran';

  @override
  String get youCanAcceptOrDenyUserMessageRequest => 'Du kan acceptera eller neka användarmeddelandebegäran.';

  @override
  String youWantToPurchaseThisStickerItWillCostYou(Object stickerFormattedPrice) {
    return 'Vill du köpa denna klistermärke? Det kostar $stickerFormattedPrice';
  }

  @override
  String get loading => 'Laddar ...';

  @override
  String get showLikesNotifications => 'Visa gilla-aviseringar';

  @override
  String get settings => 'Inställningar';

  @override
  String get selectLanguage => 'Välj språk';

  @override
  String get french => 'Franska';

  @override
  String get english => 'Engelska';

  @override
  String sendGiftToLocalUserProfileItemName(Object localUserProfileItemName) {
    return 'Skicka present till $localUserProfileItemName';
  }

  @override
  String get signIn => 'Logga in';

  @override
  String get emailOrUsername => 'E-post eller användarnamn';

  @override
  String get login => 'Logga in';

  @override
  String get forgotPassword => 'Glömt lösenord?';

  @override
  String get failedToInitialize => 'Misslyckades med att initialisera';

  @override
  String get goHome => 'GÅ HEM';

  @override
  String get email => 'E-post';

  @override
  String get iAcceptAllThe => 'Jag accepterar alla ';

  @override
  String get and => ' och ';

  @override
  String get termsConditions => 'villkor och bestämmelser';

  @override
  String get privacyPolicy => 'integritetspolicy';

  @override
  String get accountCreatedSuccessfully => 'Konto skapat framgångsrikt';

  @override
  String get goToLoginNow => 'Gå till inloggning nu';

  @override
  String get signInWithFacebook => 'Logga in med Facebook';

  @override
  String get signInWithGoogle => 'Logga in med Google';

  @override
  String get yourEmailAddress => 'Din e-postadress';

  @override
  String get sendEmailOtp => 'Skicka e-post OTP';

  @override
  String get emailOtp => 'E-post OTP';

  @override
  String get newPassword => 'Nytt lösenord';

  @override
  String get confirmNewPassword => 'Bekräfta nytt lösenord';

  @override
  String get submit => 'Skicka';
}
