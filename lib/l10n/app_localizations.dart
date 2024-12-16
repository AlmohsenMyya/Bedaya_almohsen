import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_gu.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_mr.dart';
import 'app_localizations_no.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('mr'),
    Locale('no'),
    Locale('ar'),
    Locale('bn'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('gu'),
    Locale('hi'),
    Locale('it'),
    Locale('ja'),
    Locale('pt'),
    Locale('ru'),
    Locale('sv'),
    Locale('ta'),
    Locale('tr'),
    Locale('vi'),
    Locale('zh')
  ];

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Most awaited Marriage app is here!'**
  String get welcome;

  /// No description provided for @welcomeSmallMessage.
  ///
  /// In en, this message translates to:
  /// **'Finding your life partner doesn’t have to be hard'**
  String get welcomeSmallMessage;

  /// No description provided for @letsGo.
  ///
  /// In en, this message translates to:
  /// **'Let\'s Go'**
  String get letsGo;

  /// No description provided for @menuFeaturedUsers.
  ///
  /// In en, this message translates to:
  /// **'Featured Users'**
  String get menuFeaturedUsers;

  /// No description provided for @menuRandomUsers.
  ///
  /// In en, this message translates to:
  /// **'Random Users'**
  String get menuRandomUsers;

  /// No description provided for @menuOnlineUsers.
  ///
  /// In en, this message translates to:
  /// **'Recently Online'**
  String get menuOnlineUsers;

  /// No description provided for @menuNewestUsers.
  ///
  /// In en, this message translates to:
  /// **'Newest Users'**
  String get menuNewestUsers;

  /// No description provided for @menuNearestUsers.
  ///
  /// In en, this message translates to:
  /// **'Nearest Users'**
  String get menuNearestUsers;

  /// No description provided for @menuCreditWallet.
  ///
  /// In en, this message translates to:
  /// **'Credit Wallet'**
  String get menuCreditWallet;

  /// No description provided for @menuWhoLikesMe.
  ///
  /// In en, this message translates to:
  /// **'Who liked me'**
  String get menuWhoLikesMe;

  /// No description provided for @menuMutualLikes.
  ///
  /// In en, this message translates to:
  /// **'Mutual Likes'**
  String get menuMutualLikes;

  /// No description provided for @menuMyLikes.
  ///
  /// In en, this message translates to:
  /// **'My Likes'**
  String get menuMyLikes;

  /// No description provided for @menuMyDislikes.
  ///
  /// In en, this message translates to:
  /// **'My Dislikes'**
  String get menuMyDislikes;

  /// No description provided for @menuVisitors.
  ///
  /// In en, this message translates to:
  /// **'Visitors'**
  String get menuVisitors;

  /// No description provided for @menuBlockedUsers.
  ///
  /// In en, this message translates to:
  /// **'Blocked Users'**
  String get menuBlockedUsers;

  /// No description provided for @menuChangePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get menuChangePassword;

  /// No description provided for @menuChangeEmail.
  ///
  /// In en, this message translates to:
  /// **'Change Email'**
  String get menuChangeEmail;

  /// No description provided for @menuSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get menuSettings;

  /// No description provided for @menuLogout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get menuLogout;

  /// No description provided for @areYouSure.
  ///
  /// In en, this message translates to:
  /// **'Are you sure?'**
  String get areYouSure;

  /// No description provided for @profilePhoto.
  ///
  /// In en, this message translates to:
  /// **'Profile Photo'**
  String get profilePhoto;

  /// No description provided for @uploadNewPhotos.
  ///
  /// In en, this message translates to:
  /// **'Profile Photo'**
  String get uploadNewPhotos;

  /// No description provided for @helloWorld.
  ///
  /// In en, this message translates to:
  /// **'Hello World!'**
  String get helloWorld;

  /// No description provided for @bePremium.
  ///
  /// In en, this message translates to:
  /// **'Be Premium'**
  String get bePremium;

  /// No description provided for @aboutUs.
  ///
  /// In en, this message translates to:
  /// **'About us'**
  String get aboutUs;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @boostMyProfile.
  ///
  /// In en, this message translates to:
  /// **'Boost my Profile'**
  String get boostMyProfile;

  /// No description provided for @yourProfileIsBoostedFor.
  ///
  /// In en, this message translates to:
  /// **'Your profile is boosted for'**
  String get yourProfileIsBoostedFor;

  /// boosting screen message
  ///
  /// In en, this message translates to:
  /// **'By boosting your profile you will be a part of featured user and will a get priority in search and random users. It will costs you {booster_price} credits for immediate {booster_period} minutes'**
  String byBoostingYourProfileYouWillBeAPartOf(Object booster_price, Object booster_period);

  /// No description provided for @boostAgain.
  ///
  /// In en, this message translates to:
  /// **'Boost Again'**
  String get boostAgain;

  /// No description provided for @buyCredits.
  ///
  /// In en, this message translates to:
  /// **'Buy Credits'**
  String get buyCredits;

  /// No description provided for @yourDailyLimitForEncountersMayExceedOrThereAre.
  ///
  /// In en, this message translates to:
  /// **'Your daily limit for encounters may exceed or there are no users to show.'**
  String get yourDailyLimitForEncountersMayExceedOrThereAre;

  /// No description provided for @find.
  ///
  /// In en, this message translates to:
  /// **'Find'**
  String get find;

  /// No description provided for @myProfile.
  ///
  /// In en, this message translates to:
  /// **'My Profile'**
  String get myProfile;

  /// No description provided for @encounter.
  ///
  /// In en, this message translates to:
  /// **'Encounter'**
  String get encounter;

  /// No description provided for @myPhotos.
  ///
  /// In en, this message translates to:
  /// **'My Photos'**
  String get myPhotos;

  /// No description provided for @messenger.
  ///
  /// In en, this message translates to:
  /// **'Messenger'**
  String get messenger;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @youWantToDeleteThisImage.
  ///
  /// In en, this message translates to:
  /// **'You want to delete this image?'**
  String get youWantToDeleteThisImage;

  /// No description provided for @thereAreNoResultsToShow.
  ///
  /// In en, this message translates to:
  /// **'There are no results to show.'**
  String get thereAreNoResultsToShow;

  /// No description provided for @failed.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get failed;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @noResultFound.
  ///
  /// In en, this message translates to:
  /// **'no result found'**
  String get noResultFound;

  /// No description provided for @endOfResult.
  ///
  /// In en, this message translates to:
  /// **'end of result'**
  String get endOfResult;

  /// No description provided for @premium.
  ///
  /// In en, this message translates to:
  /// **'Premium'**
  String get premium;

  /// No description provided for @youArePremiumUser.
  ///
  /// In en, this message translates to:
  /// **'You are premium user'**
  String get youArePremiumUser;

  /// No description provided for @premiumMembershipExpiry.
  ///
  /// In en, this message translates to:
  /// **'Premium Membership Expiry'**
  String get premiumMembershipExpiry;

  /// credits price
  ///
  /// In en, this message translates to:
  /// **'{price} credits'**
  String itemPriceCredits(Object price);

  /// No description provided for @selectPlan.
  ///
  /// In en, this message translates to:
  /// **'Select Plan'**
  String get selectPlan;

  /// No description provided for @pleaseSelectAPlan.
  ///
  /// In en, this message translates to:
  /// **'Please select a plan'**
  String get pleaseSelectAPlan;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @extendPremiumMembership.
  ///
  /// In en, this message translates to:
  /// **'Extend Premium Membership'**
  String get extendPremiumMembership;

  /// No description provided for @bePremiumNow.
  ///
  /// In en, this message translates to:
  /// **'Be Premium Now'**
  String get bePremiumNow;

  /// No description provided for @gift.
  ///
  /// In en, this message translates to:
  /// **'Gift'**
  String get gift;

  /// No description provided for @sendAGift.
  ///
  /// In en, this message translates to:
  /// **'Send a Gift'**
  String get sendAGift;

  /// No description provided for @privately.
  ///
  /// In en, this message translates to:
  /// **'Privately'**
  String get privately;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @reportAbuse.
  ///
  /// In en, this message translates to:
  /// **'Report Abuse'**
  String get reportAbuse;

  /// No description provided for @block.
  ///
  /// In en, this message translates to:
  /// **'Block'**
  String get block;

  /// No description provided for @userBlocked.
  ///
  /// In en, this message translates to:
  /// **'User blocked'**
  String get userBlocked;

  /// No description provided for @unblock.
  ///
  /// In en, this message translates to:
  /// **'Unblock'**
  String get unblock;

  /// No description provided for @totalLikes.
  ///
  /// In en, this message translates to:
  /// **'Total Likes'**
  String get totalLikes;

  /// No description provided for @totalViews.
  ///
  /// In en, this message translates to:
  /// **'Total Views'**
  String get totalViews;

  /// No description provided for @aboutMe.
  ///
  /// In en, this message translates to:
  /// **'About Me'**
  String get aboutMe;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @preferredLanguage.
  ///
  /// In en, this message translates to:
  /// **'Preferred Language'**
  String get preferredLanguage;

  /// No description provided for @relationshipStatus.
  ///
  /// In en, this message translates to:
  /// **'Relationship Status'**
  String get relationshipStatus;

  /// No description provided for @education.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get education;

  /// No description provided for @mobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Mobile Number'**
  String get mobileNumber;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @workStatus.
  ///
  /// In en, this message translates to:
  /// **'Work Status'**
  String get workStatus;

  /// No description provided for @birthday.
  ///
  /// In en, this message translates to:
  /// **'Birthday'**
  String get birthday;

  /// No description provided for @updatePhoto.
  ///
  /// In en, this message translates to:
  /// **'Update Photo'**
  String get updatePhoto;

  /// No description provided for @profileCoverPhoto.
  ///
  /// In en, this message translates to:
  /// **'Profile Cover Photo'**
  String get profileCoverPhoto;

  /// No description provided for @myProfileUpdate.
  ///
  /// In en, this message translates to:
  /// **'My Profile Update'**
  String get myProfileUpdate;

  /// No description provided for @basicInformation.
  ///
  /// In en, this message translates to:
  /// **'Basic Information'**
  String get basicInformation;

  /// No description provided for @selectCountryCode.
  ///
  /// In en, this message translates to:
  /// **'Select Country Code'**
  String get selectCountryCode;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @countryPhoneCode.
  ///
  /// In en, this message translates to:
  /// **'Country Phone Code'**
  String get countryPhoneCode;

  /// error
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String errorError(Object error);

  /// No description provided for @yourBasicInformationFormWillComeHere.
  ///
  /// In en, this message translates to:
  /// **'Your basic information form will come here'**
  String get yourBasicInformationFormWillComeHere;

  /// No description provided for @purchaseCredits.
  ///
  /// In en, this message translates to:
  /// **'Purchase Credits'**
  String get purchaseCredits;

  /// No description provided for @tryingToConnect.
  ///
  /// In en, this message translates to:
  /// **'Trying to connect...'**
  String get tryingToConnect;

  /// No description provided for @notConnected.
  ///
  /// In en, this message translates to:
  /// **'Not connected'**
  String get notConnected;

  /// No description provided for @fetchingProducts.
  ///
  /// In en, this message translates to:
  /// **'Fetching products...'**
  String get fetchingProducts;

  /// No description provided for @creditPackages.
  ///
  /// In en, this message translates to:
  /// **'Credit Packages'**
  String get creditPackages;

  /// No description provided for @notFoundedProductsNotFound.
  ///
  /// In en, this message translates to:
  /// **'{notFoundedProducts} not found'**
  String notFoundedProductsNotFound(Object notFoundedProducts);

  /// No description provided for @packageNotFound.
  ///
  /// In en, this message translates to:
  /// **'Package not found'**
  String get packageNotFound;

  /// No description provided for @creditsCredits.
  ///
  /// In en, this message translates to:
  /// **'{credits} credits'**
  String creditsCredits(Object credits);

  /// No description provided for @fetchingConsumables.
  ///
  /// In en, this message translates to:
  /// **'Fetching consumables...'**
  String get fetchingConsumables;

  /// No description provided for @thisIsAPremiumFeatureToViewThisYouNeed.
  ///
  /// In en, this message translates to:
  /// **'This is a premium feature, to view this you need to buy premium plan first.'**
  String get thisIsAPremiumFeatureToViewThisYouNeed;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @basic.
  ///
  /// In en, this message translates to:
  /// **'Basic'**
  String get basic;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @lookingFor.
  ///
  /// In en, this message translates to:
  /// **'Looking for'**
  String get lookingFor;

  /// No description provided for @minimumAge.
  ///
  /// In en, this message translates to:
  /// **'Minimum Age'**
  String get minimumAge;

  /// No description provided for @maximumAge.
  ///
  /// In en, this message translates to:
  /// **'Maximum Age'**
  String get maximumAge;

  /// No description provided for @distanceFromMyLocationDistanceUnit.
  ///
  /// In en, this message translates to:
  /// **'Distance from my location ({distanceUnit})'**
  String distanceFromMyLocationDistanceUnit(Object distanceUnit);

  /// No description provided for @personal.
  ///
  /// In en, this message translates to:
  /// **'Personal'**
  String get personal;

  /// No description provided for @minimumHeight.
  ///
  /// In en, this message translates to:
  /// **'Minimum Height'**
  String get minimumHeight;

  /// No description provided for @maximumHeight.
  ///
  /// In en, this message translates to:
  /// **'Maximum Height'**
  String get maximumHeight;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @myCreditWallet.
  ///
  /// In en, this message translates to:
  /// **'My Credit Wallet'**
  String get myCreditWallet;

  /// No description provided for @buyMoreCredits.
  ///
  /// In en, this message translates to:
  /// **'Buy More Credits'**
  String get buyMoreCredits;

  /// No description provided for @yourWalletBalance.
  ///
  /// In en, this message translates to:
  /// **'Your Wallet Balance'**
  String get yourWalletBalance;

  /// wallet credit balance amount
  ///
  /// In en, this message translates to:
  /// **'{walletBalance} Credits'**
  String walletBalanceCredits(int walletBalance);

  /// No description provided for @financialTransaction.
  ///
  /// In en, this message translates to:
  /// **'Financial Transaction'**
  String get financialTransaction;

  /// No description provided for @transaction.
  ///
  /// In en, this message translates to:
  /// **'Transaction'**
  String get transaction;

  /// No description provided for @on.
  ///
  /// In en, this message translates to:
  /// **'on'**
  String get on;

  /// No description provided for @paymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get paymentMethod;

  /// No description provided for @abuseReport.
  ///
  /// In en, this message translates to:
  /// **'Abuse report'**
  String get abuseReport;

  /// No description provided for @userHasBeenReportedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'User has been reported successfully'**
  String get userHasBeenReportedSuccessfully;

  /// No description provided for @report.
  ///
  /// In en, this message translates to:
  /// **'Report'**
  String get report;

  /// No description provided for @reason.
  ///
  /// In en, this message translates to:
  /// **'Reason'**
  String get reason;

  /// No description provided for @reportUser.
  ///
  /// In en, this message translates to:
  /// **'Report User'**
  String get reportUser;

  /// No description provided for @goBack.
  ///
  /// In en, this message translates to:
  /// **'Go back'**
  String get goBack;

  /// No description provided for @changeEmail.
  ///
  /// In en, this message translates to:
  /// **'Change Email'**
  String get changeEmail;

  /// No description provided for @activateYourNewEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'Activate your new email address'**
  String get activateYourNewEmailAddress;

  /// No description provided for @almostFinishedYouNeedToConfirmYourEmailAddressTo.
  ///
  /// In en, this message translates to:
  /// **'Almost finished... You need to confirm your email address. To complete the activation process, please click the link in the email we just sent you.'**
  String get almostFinishedYouNeedToConfirmYourEmailAddressTo;

  /// No description provided for @currentEmail.
  ///
  /// In en, this message translates to:
  /// **'Current Email'**
  String get currentEmail;

  /// No description provided for @newEmail.
  ///
  /// In en, this message translates to:
  /// **'New Email'**
  String get newEmail;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// No description provided for @showVisitorNotifications.
  ///
  /// In en, this message translates to:
  /// **'Show Visitor Notifications'**
  String get showVisitorNotifications;

  /// No description provided for @showGiftsNotifications.
  ///
  /// In en, this message translates to:
  /// **'Show Gifts Notifications'**
  String get showGiftsNotifications;

  /// No description provided for @showMessagesNotifications.
  ///
  /// In en, this message translates to:
  /// **'Show Messages Notifications'**
  String get showMessagesNotifications;

  /// No description provided for @showLoginNotificationsForYourLikedUsers.
  ///
  /// In en, this message translates to:
  /// **'Show Login Notifications for your Liked Users'**
  String get showLoginNotificationsForYourLikedUsers;

  /// No description provided for @displayMobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Display Mobile Number'**
  String get displayMobileNumber;

  /// No description provided for @updateSettings.
  ///
  /// In en, this message translates to:
  /// **'Update Settings'**
  String get updateSettings;

  /// No description provided for @allContentIncludingPhotosAndOtherDataWillBePermanently.
  ///
  /// In en, this message translates to:
  /// **'All content including photos and other data will be permanently removed!'**
  String get allContentIncludingPhotosAndOtherDataWillBePermanently;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @yesDelete.
  ///
  /// In en, this message translates to:
  /// **'Yes delete'**
  String get yesDelete;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccount;

  /// No description provided for @alert.
  ///
  /// In en, this message translates to:
  /// **'Alert'**
  String get alert;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'error ...'**
  String get error;

  /// No description provided for @doYouWantToDeleteAllTheChatMessageOf.
  ///
  /// In en, this message translates to:
  /// **'Do you want to delete all the chat message of this user?'**
  String get doYouWantToDeleteAllTheChatMessageOf;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @deleteAllChatHistory.
  ///
  /// In en, this message translates to:
  /// **'Delete All Chat History'**
  String get deleteAllChatHistory;

  /// No description provided for @loadingMessages.
  ///
  /// In en, this message translates to:
  /// **'loading messages ...'**
  String get loadingMessages;

  /// No description provided for @requestDenied.
  ///
  /// In en, this message translates to:
  /// **'Request Denied'**
  String get requestDenied;

  /// No description provided for @youHaveAlreadyDeclinedUserMessageRequest.
  ///
  /// In en, this message translates to:
  /// **'You have already declined user message request'**
  String get youHaveAlreadyDeclinedUserMessageRequest;

  /// No description provided for @youCanAcceptOrDenyUserMessageRequest.
  ///
  /// In en, this message translates to:
  /// **'You can accept or deny user message request.'**
  String get youCanAcceptOrDenyUserMessageRequest;

  /// No description provided for @youWantToPurchaseThisStickerItWillCostYou.
  ///
  /// In en, this message translates to:
  /// **'You want to purchase this sticker? It will cost you {stickerFormattedPrice}'**
  String youWantToPurchaseThisStickerItWillCostYou(Object stickerFormattedPrice);

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'loading ...'**
  String get loading;

  /// No description provided for @showLikesNotifications.
  ///
  /// In en, this message translates to:
  /// **'Show Likes Notifications'**
  String get showLikesNotifications;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @french.
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get french;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @sendGiftToLocalUserProfileItemName.
  ///
  /// In en, this message translates to:
  /// **'Send Gift to {localUserProfileItemName}'**
  String sendGiftToLocalUserProfileItemName(Object localUserProfileItemName);

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signIn;

  /// No description provided for @emailOrUsername.
  ///
  /// In en, this message translates to:
  /// **'Email or Username'**
  String get emailOrUsername;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @failedToInitialize.
  ///
  /// In en, this message translates to:
  /// **'Failed to initialize'**
  String get failedToInitialize;

  /// No description provided for @goHome.
  ///
  /// In en, this message translates to:
  /// **'GO HOME'**
  String get goHome;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @iAcceptAllThe.
  ///
  /// In en, this message translates to:
  /// **'I accept all the '**
  String get iAcceptAllThe;

  /// No description provided for @and.
  ///
  /// In en, this message translates to:
  /// **' and '**
  String get and;

  /// No description provided for @termsConditions.
  ///
  /// In en, this message translates to:
  /// **'terms & conditions'**
  String get termsConditions;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'privacy policy'**
  String get privacyPolicy;

  /// No description provided for @accountCreatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Account Created Successfully'**
  String get accountCreatedSuccessfully;

  /// No description provided for @goToLoginNow.
  ///
  /// In en, this message translates to:
  /// **'Go to login now'**
  String get goToLoginNow;

  /// No description provided for @signInWithFacebook.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Facebook'**
  String get signInWithFacebook;

  /// No description provided for @signInWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Google'**
  String get signInWithGoogle;

  /// No description provided for @yourEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'Your email address'**
  String get yourEmailAddress;

  /// No description provided for @sendEmailOtp.
  ///
  /// In en, this message translates to:
  /// **'Send Email OTP'**
  String get sendEmailOtp;

  /// No description provided for @emailOtp.
  ///
  /// In en, this message translates to:
  /// **'Email OTP'**
  String get emailOtp;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// No description provided for @confirmNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm New Password'**
  String get confirmNewPassword;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['mr', 'no', 'ar', 'bn', 'de', 'en', 'es', 'fr', 'gu', 'hi', 'it', 'ja', 'pt', 'ru', 'sv', 'ta', 'tr', 'vi', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'mr': return AppLocalizationsMr();
    case 'no': return AppLocalizationsNo();
    case 'ar': return AppLocalizationsAr();
    case 'bn': return AppLocalizationsBn();
    case 'de': return AppLocalizationsDe();
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'fr': return AppLocalizationsFr();
    case 'gu': return AppLocalizationsGu();
    case 'hi': return AppLocalizationsHi();
    case 'it': return AppLocalizationsIt();
    case 'ja': return AppLocalizationsJa();
    case 'pt': return AppLocalizationsPt();
    case 'ru': return AppLocalizationsRu();
    case 'sv': return AppLocalizationsSv();
    case 'ta': return AppLocalizationsTa();
    case 'tr': return AppLocalizationsTr();
    case 'vi': return AppLocalizationsVi();
    case 'zh': return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
