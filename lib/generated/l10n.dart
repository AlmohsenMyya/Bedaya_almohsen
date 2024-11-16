// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Most awaited Dating App is here!`
  String get welcome {
    return Intl.message(
      'Most awaited Dating App is here!',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Dating doesn't have to be hard.`
  String get welcomeSmallMessage {
    return Intl.message(
      'Dating doesn\'t have to be hard.',
      name: 'welcomeSmallMessage',
      desc: '',
      args: [],
    );
  }

  /// `Let's Go`
  String get letsGo {
    return Intl.message(
      'Let\'s Go',
      name: 'letsGo',
      desc: '',
      args: [],
    );
  }

  /// `Featured Users`
  String get menuFeaturedUsers {
    return Intl.message(
      'Featured Users',
      name: 'menuFeaturedUsers',
      desc: '',
      args: [],
    );
  }

  /// `Random Users`
  String get menuRandomUsers {
    return Intl.message(
      'Random Users',
      name: 'menuRandomUsers',
      desc: '',
      args: [],
    );
  }
  String get menuOnlineUsers {
    return Intl.message(
      'Recently Online',
      name: 'menuOnlineUsers',
      desc: '',
      args: [],
    );
  }

  String get menuNewestUsers {
    return Intl.message(
      'Newest Users',
      name: 'menuNewestUsers',
      desc: '',
      args: [],
    );
  }

  String get menuNearestUsers {
    return Intl.message(
      'Nearest Users',
      name: 'menuNearestUsers',
      desc: '',
      args: [],
    );
  }

  /// `Credit Wallet`
  String get menuCreditWallet {
    return Intl.message(
      'Credit Wallet',
      name: 'menuCreditWallet',
      desc: '',
      args: [],
    );
  }

  /// `Who liked me`
  String get menuWhoLikesMe {
    return Intl.message(
      'Who liked me',
      name: 'menuWhoLikesMe',
      desc: '',
      args: [],
    );
  }

  /// `Mutual Likes`
  String get menuMutualLikes {
    return Intl.message(
      'Mutual Likes',
      name: 'menuMutualLikes',
      desc: '',
      args: [],
    );
  }

  /// `My Likes`
  String get menuMyLikes {
    return Intl.message(
      'My Likes',
      name: 'menuMyLikes',
      desc: '',
      args: [],
    );
  }

  /// `My Dislikes`
  String get menuMyDislikes {
    return Intl.message(
      'My Dislikes',
      name: 'menuMyDislikes',
      desc: '',
      args: [],
    );
  }

  /// `Visitors`
  String get menuVisitors {
    return Intl.message(
      'Visitors',
      name: 'menuVisitors',
      desc: '',
      args: [],
    );
  }

  /// `Blocked Users`
  String get menuBlockedUsers {
    return Intl.message(
      'Blocked Users',
      name: 'menuBlockedUsers',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get menuChangePassword {
    return Intl.message(
      'Change Password',
      name: 'menuChangePassword',
      desc: '',
      args: [],
    );
  }

  /// `Change Email`
  String get menuChangeEmail {
    return Intl.message(
      'Change Email',
      name: 'menuChangeEmail',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get menuSettings {
    return Intl.message(
      'Settings',
      name: 'menuSettings',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get menuLogout {
    return Intl.message(
      'Logout',
      name: 'menuLogout',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure?`
  String get areYouSure {
    return Intl.message(
      'Are you sure?',
      name: 'areYouSure',
      desc: '',
      args: [],
    );
  }

  /// `Profile Photo`
  String get profilePhoto {
    return Intl.message(
      'Profile Photo',
      name: 'profilePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Profile Photo`
  String get uploadNewPhotos {
    return Intl.message(
      'Profile Photo',
      name: 'uploadNewPhotos',
      desc: '',
      args: [],
    );
  }

  /// `Hello World!`
  String get helloWorld {
    return Intl.message(
      'Hello World!',
      name: 'helloWorld',
      desc: '',
      args: [],
    );
  }

  /// `Be Premium`
  String get bePremium {
    return Intl.message(
      'Be Premium',
      name: 'bePremium',
      desc: '',
      args: [],
    );
  }

  /// `About us`
  String get aboutUs {
    return Intl.message(
      'About us',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Version`
  String get version {
    return Intl.message(
      'Version',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  /// `Boost my Profile`
  String get boostMyProfile {
    return Intl.message(
      'Boost my Profile',
      name: 'boostMyProfile',
      desc: '',
      args: [],
    );
  }

  /// `Your profile is boosted for`
  String get yourProfileIsBoostedFor {
    return Intl.message(
      'Your profile is boosted for',
      name: 'yourProfileIsBoostedFor',
      desc: '',
      args: [],
    );
  }

  /// `By boosting your profile you will be a part of featured user and will a get priority in search and random users. It will costs you {booster_price} credits for immediate {booster_period} minutes`
  String byBoostingYourProfileYouWillBeAPartOf(
      Object booster_price, Object booster_period) {
    return Intl.message(
      'By boosting your profile you will be a part of featured user and will a get priority in search and random users. It will costs you $booster_price credits for immediate $booster_period minutes',
      name: 'byBoostingYourProfileYouWillBeAPartOf',
      desc: 'boosting screen message',
      args: [booster_price, booster_period],
    );
  }

  /// `Boost Again`
  String get boostAgain {
    return Intl.message(
      'Boost Again',
      name: 'boostAgain',
      desc: '',
      args: [],
    );
  }

  /// `Buy Credits`
  String get buyCredits {
    return Intl.message(
      'Buy Credits',
      name: 'buyCredits',
      desc: '',
      args: [],
    );
  }

  /// `Your daily limit for encounters may exceed or there are no users to show.`
  String get yourDailyLimitForEncountersMayExceedOrThereAre {
    return Intl.message(
      'Your daily limit for encounters may exceed or there are no users to show.',
      name: 'yourDailyLimitForEncountersMayExceedOrThereAre',
      desc: '',
      args: [],
    );
  }

  /// `Find`
  String get find {
    return Intl.message(
      'Find',
      name: 'find',
      desc: '',
      args: [],
    );
  }

  /// `My Profile`
  String get myProfile {
    return Intl.message(
      'My Profile',
      name: 'myProfile',
      desc: '',
      args: [],
    );
  }

  /// `Encounter`
  String get encounter {
    return Intl.message(
      'Encounter',
      name: 'encounter',
      desc: '',
      args: [],
    );
  }

  /// `My Photos`
  String get myPhotos {
    return Intl.message(
      'My Photos',
      name: 'myPhotos',
      desc: '',
      args: [],
    );
  }

  /// `Messenger`
  String get messenger {
    return Intl.message(
      'Messenger',
      name: 'messenger',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `You want to delete this image?`
  String get youWantToDeleteThisImage {
    return Intl.message(
      'You want to delete this image?',
      name: 'youWantToDeleteThisImage',
      desc: '',
      args: [],
    );
  }

  /// `There are no results to show.`
  String get thereAreNoResultsToShow {
    return Intl.message(
      'There are no results to show.',
      name: 'thereAreNoResultsToShow',
      desc: '',
      args: [],
    );
  }

  /// `Failed`
  String get failed {
    return Intl.message(
      'Failed',
      name: 'failed',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `no result found`
  String get noResultFound {
    return Intl.message(
      'no result found',
      name: 'noResultFound',
      desc: '',
      args: [],
    );
  }

  /// `end of result`
  String get endOfResult {
    return Intl.message(
      'end of result',
      name: 'endOfResult',
      desc: '',
      args: [],
    );
  }

  /// `Premium`
  String get premium {
    return Intl.message(
      'Premium',
      name: 'premium',
      desc: '',
      args: [],
    );
  }

  /// `You are premium user`
  String get youArePremiumUser {
    return Intl.message(
      'You are premium user',
      name: 'youArePremiumUser',
      desc: '',
      args: [],
    );
  }

  /// `Premium Membership Expiry`
  String get premiumMembershipExpiry {
    return Intl.message(
      'Premium Membership Expiry',
      name: 'premiumMembershipExpiry',
      desc: '',
      args: [],
    );
  }

  /// `{price} credits`
  String itemPriceCredits(Object price) {
    return Intl.message(
      '$price credits',
      name: 'itemPriceCredits',
      desc: 'credits price',
      args: [price],
    );
  }

  /// `Select Plan`
  String get selectPlan {
    return Intl.message(
      'Select Plan',
      name: 'selectPlan',
      desc: '',
      args: [],
    );
  }

  /// `Please select a plan`
  String get pleaseSelectAPlan {
    return Intl.message(
      'Please select a plan',
      name: 'pleaseSelectAPlan',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Extend Premium Membership`
  String get extendPremiumMembership {
    return Intl.message(
      'Extend Premium Membership',
      name: 'extendPremiumMembership',
      desc: '',
      args: [],
    );
  }

  /// `Be Premium Now`
  String get bePremiumNow {
    return Intl.message(
      'Be Premium Now',
      name: 'bePremiumNow',
      desc: '',
      args: [],
    );
  }

  /// `Gift`
  String get gift {
    return Intl.message(
      'Gift',
      name: 'gift',
      desc: '',
      args: [],
    );
  }

  /// `Send a Gift`
  String get sendAGift {
    return Intl.message(
      'Send a Gift',
      name: 'sendAGift',
      desc: '',
      args: [],
    );
  }

  /// `Privately`
  String get privately {
    return Intl.message(
      'Privately',
      name: 'privately',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Report Abuse`
  String get reportAbuse {
    return Intl.message(
      'Report Abuse',
      name: 'reportAbuse',
      desc: '',
      args: [],
    );
  }

  /// `Block`
  String get block {
    return Intl.message(
      'Block',
      name: 'block',
      desc: '',
      args: [],
    );
  }

  /// `User blocked`
  String get userBlocked {
    return Intl.message(
      'User blocked',
      name: 'userBlocked',
      desc: '',
      args: [],
    );
  }

  /// `Unblock`
  String get unblock {
    return Intl.message(
      'Unblock',
      name: 'unblock',
      desc: '',
      args: [],
    );
  }

  /// `Total Likes`
  String get totalLikes {
    return Intl.message(
      'Total Likes',
      name: 'totalLikes',
      desc: '',
      args: [],
    );
  }

  /// `Total Views`
  String get totalViews {
    return Intl.message(
      'Total Views',
      name: 'totalViews',
      desc: '',
      args: [],
    );
  }

  /// `About Me`
  String get aboutMe {
    return Intl.message(
      'About Me',
      name: 'aboutMe',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Preferred Language`
  String get preferredLanguage {
    return Intl.message(
      'Preferred Language',
      name: 'preferredLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Relationship Status`
  String get relationshipStatus {
    return Intl.message(
      'Relationship Status',
      name: 'relationshipStatus',
      desc: '',
      args: [],
    );
  }

  /// `Education`
  String get education {
    return Intl.message(
      'Education',
      name: 'education',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Number`
  String get mobileNumber {
    return Intl.message(
      'Mobile Number',
      name: 'mobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Work Status`
  String get workStatus {
    return Intl.message(
      'Work Status',
      name: 'workStatus',
      desc: '',
      args: [],
    );
  }

  /// `Birthday`
  String get birthday {
    return Intl.message(
      'Birthday',
      name: 'birthday',
      desc: '',
      args: [],
    );
  }

  /// `Update Photo`
  String get updatePhoto {
    return Intl.message(
      'Update Photo',
      name: 'updatePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Profile Cover Photo`
  String get profileCoverPhoto {
    return Intl.message(
      'Profile Cover Photo',
      name: 'profileCoverPhoto',
      desc: '',
      args: [],
    );
  }

  /// `My Profile Update`
  String get myProfileUpdate {
    return Intl.message(
      'My Profile Update',
      name: 'myProfileUpdate',
      desc: '',
      args: [],
    );
  }

  /// `Basic Information`
  String get basicInformation {
    return Intl.message(
      'Basic Information',
      name: 'basicInformation',
      desc: '',
      args: [],
    );
  }

  /// `Select Country Code`
  String get selectCountryCode {
    return Intl.message(
      'Select Country Code',
      name: 'selectCountryCode',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message(
      'First Name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Country Phone Code`
  String get countryPhoneCode {
    return Intl.message(
      'Country Phone Code',
      name: 'countryPhoneCode',
      desc: '',
      args: [],
    );
  }

  /// `Error: {error}`
  String errorError(Object error) {
    return Intl.message(
      'Error: $error',
      name: 'errorError',
      desc: 'error',
      args: [error],
    );
  }

  /// `Your basic information form will come here`
  String get yourBasicInformationFormWillComeHere {
    return Intl.message(
      'Your basic information form will come here',
      name: 'yourBasicInformationFormWillComeHere',
      desc: '',
      args: [],
    );
  }

  /// `Purchase Credits`
  String get purchaseCredits {
    return Intl.message(
      'Purchase Credits',
      name: 'purchaseCredits',
      desc: '',
      args: [],
    );
  }

  /// `Trying to connect...`
  String get tryingToConnect {
    return Intl.message(
      'Trying to connect...',
      name: 'tryingToConnect',
      desc: '',
      args: [],
    );
  }

  /// `Not connected`
  String get notConnected {
    return Intl.message(
      'Not connected',
      name: 'notConnected',
      desc: '',
      args: [],
    );
  }

  /// `Fetching products...`
  String get fetchingProducts {
    return Intl.message(
      'Fetching products...',
      name: 'fetchingProducts',
      desc: '',
      args: [],
    );
  }

  /// `Credit Packages`
  String get creditPackages {
    return Intl.message(
      'Credit Packages',
      name: 'creditPackages',
      desc: '',
      args: [],
    );
  }

  /// `{notFoundedProducts} not found`
  String notFoundedProductsNotFound(Object notFoundedProducts) {
    return Intl.message(
      '$notFoundedProducts not found',
      name: 'notFoundedProductsNotFound',
      desc: '',
      args: [notFoundedProducts],
    );
  }

  /// `Package not found`
  String get packageNotFound {
    return Intl.message(
      'Package not found',
      name: 'packageNotFound',
      desc: '',
      args: [],
    );
  }

  /// `{credits} credits`
  String creditsCredits(Object credits) {
    return Intl.message(
      '$credits credits',
      name: 'creditsCredits',
      desc: '',
      args: [credits],
    );
  }

  /// `Fetching consumables...`
  String get fetchingConsumables {
    return Intl.message(
      'Fetching consumables...',
      name: 'fetchingConsumables',
      desc: '',
      args: [],
    );
  }

  /// `This is a premium feature, to view this you need to buy premium plan first.`
  String get thisIsAPremiumFeatureToViewThisYouNeed {
    return Intl.message(
      'This is a premium feature, to view this you need to buy premium plan first.',
      name: 'thisIsAPremiumFeatureToViewThisYouNeed',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Basic`
  String get basic {
    return Intl.message(
      'Basic',
      name: 'basic',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Looking for`
  String get lookingFor {
    return Intl.message(
      'Looking for',
      name: 'lookingFor',
      desc: '',
      args: [],
    );
  }

  /// `Minimum Age`
  String get minimumAge {
    return Intl.message(
      'Minimum Age',
      name: 'minimumAge',
      desc: '',
      args: [],
    );
  }

  /// `Maximum Age`
  String get maximumAge {
    return Intl.message(
      'Maximum Age',
      name: 'maximumAge',
      desc: '',
      args: [],
    );
  }

  /// `Distance from my location ({distanceUnit})`
  String distanceFromMyLocationDistanceUnit(Object distanceUnit) {
    return Intl.message(
      'Distance from my location ($distanceUnit)',
      name: 'distanceFromMyLocationDistanceUnit',
      desc: '',
      args: [distanceUnit],
    );
  }

  /// `Personal`
  String get personal {
    return Intl.message(
      'Personal',
      name: 'personal',
      desc: '',
      args: [],
    );
  }

  /// `Minimum Height`
  String get minimumHeight {
    return Intl.message(
      'Minimum Height',
      name: 'minimumHeight',
      desc: '',
      args: [],
    );
  }

  /// `Maximum Height`
  String get maximumHeight {
    return Intl.message(
      'Maximum Height',
      name: 'maximumHeight',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message(
      'Apply',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `My Credit Wallet`
  String get myCreditWallet {
    return Intl.message(
      'My Credit Wallet',
      name: 'myCreditWallet',
      desc: '',
      args: [],
    );
  }

  /// `Buy More Credits`
  String get buyMoreCredits {
    return Intl.message(
      'Buy More Credits',
      name: 'buyMoreCredits',
      desc: '',
      args: [],
    );
  }

  /// `Your Wallet Balance`
  String get yourWalletBalance {
    return Intl.message(
      'Your Wallet Balance',
      name: 'yourWalletBalance',
      desc: '',
      args: [],
    );
  }

  /// `{walletBalance} Credits`
  String walletBalanceCredits(int walletBalance) {
    return Intl.message(
      '$walletBalance Credits',
      name: 'walletBalanceCredits',
      desc: 'wallet credit balance amount',
      args: [walletBalance],
    );
  }

  /// `Financial Transaction`
  String get financialTransaction {
    return Intl.message(
      'Financial Transaction',
      name: 'financialTransaction',
      desc: '',
      args: [],
    );
  }

  /// `Transaction`
  String get transaction {
    return Intl.message(
      'Transaction',
      name: 'transaction',
      desc: '',
      args: [],
    );
  }

  /// `on`
  String get on {
    return Intl.message(
      'on',
      name: 'on',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get paymentMethod {
    return Intl.message(
      'Payment Method',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Abuse report`
  String get abuseReport {
    return Intl.message(
      'Abuse report',
      name: 'abuseReport',
      desc: '',
      args: [],
    );
  }

  /// `User has been reported successfully`
  String get userHasBeenReportedSuccessfully {
    return Intl.message(
      'User has been reported successfully',
      name: 'userHasBeenReportedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Report`
  String get report {
    return Intl.message(
      'Report',
      name: 'report',
      desc: '',
      args: [],
    );
  }

  /// `Reason`
  String get reason {
    return Intl.message(
      'Reason',
      name: 'reason',
      desc: '',
      args: [],
    );
  }

  /// `Report User`
  String get reportUser {
    return Intl.message(
      'Report User',
      name: 'reportUser',
      desc: '',
      args: [],
    );
  }

  /// `Go back`
  String get goBack {
    return Intl.message(
      'Go back',
      name: 'goBack',
      desc: '',
      args: [],
    );
  }

  /// `Change Email`
  String get changeEmail {
    return Intl.message(
      'Change Email',
      name: 'changeEmail',
      desc: '',
      args: [],
    );
  }

  /// `Activate your new email address`
  String get activateYourNewEmailAddress {
    return Intl.message(
      'Activate your new email address',
      name: 'activateYourNewEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Almost finished... You need to confirm your email address. To complete the activation process, please click the link in the email we just sent you.`
  String get almostFinishedYouNeedToConfirmYourEmailAddressTo {
    return Intl.message(
      'Almost finished... You need to confirm your email address. To complete the activation process, please click the link in the email we just sent you.',
      name: 'almostFinishedYouNeedToConfirmYourEmailAddressTo',
      desc: '',
      args: [],
    );
  }

  /// `Current Email`
  String get currentEmail {
    return Intl.message(
      'Current Email',
      name: 'currentEmail',
      desc: '',
      args: [],
    );
  }

  /// `New Email`
  String get newEmail {
    return Intl.message(
      'New Email',
      name: 'newEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Show Visitor Notifications`
  String get showVisitorNotifications {
    return Intl.message(
      'Show Visitor Notifications',
      name: 'showVisitorNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Show Gifts Notifications`
  String get showGiftsNotifications {
    return Intl.message(
      'Show Gifts Notifications',
      name: 'showGiftsNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Show Messages Notifications`
  String get showMessagesNotifications {
    return Intl.message(
      'Show Messages Notifications',
      name: 'showMessagesNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Show Login Notifications for your Liked Users`
  String get showLoginNotificationsForYourLikedUsers {
    return Intl.message(
      'Show Login Notifications for your Liked Users',
      name: 'showLoginNotificationsForYourLikedUsers',
      desc: '',
      args: [],
    );
  }

  /// `Display Mobile Number`
  String get displayMobileNumber {
    return Intl.message(
      'Display Mobile Number',
      name: 'displayMobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Update Settings`
  String get updateSettings {
    return Intl.message(
      'Update Settings',
      name: 'updateSettings',
      desc: '',
      args: [],
    );
  }

  /// `All content including photos and other data will be permanently removed!`
  String get allContentIncludingPhotosAndOtherDataWillBePermanently {
    return Intl.message(
      'All content including photos and other data will be permanently removed!',
      name: 'allContentIncludingPhotosAndOtherDataWillBePermanently',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Yes delete`
  String get yesDelete {
    return Intl.message(
      'Yes delete',
      name: 'yesDelete',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get deleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Alert`
  String get alert {
    return Intl.message(
      'Alert',
      name: 'alert',
      desc: '',
      args: [],
    );
  }

  /// `error ...`
  String get error {
    return Intl.message(
      'error ...',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to delete all the chat message of this user?`
  String get doYouWantToDeleteAllTheChatMessageOf {
    return Intl.message(
      'Do you want to delete all the chat message of this user?',
      name: 'doYouWantToDeleteAllTheChatMessageOf',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Delete All Chat History`
  String get deleteAllChatHistory {
    return Intl.message(
      'Delete All Chat History',
      name: 'deleteAllChatHistory',
      desc: '',
      args: [],
    );
  }

  /// `loading messages ...`
  String get loadingMessages {
    return Intl.message(
      'loading messages ...',
      name: 'loadingMessages',
      desc: '',
      args: [],
    );
  }

  /// `Request Denied`
  String get requestDenied {
    return Intl.message(
      'Request Denied',
      name: 'requestDenied',
      desc: '',
      args: [],
    );
  }

  /// `You have already declined user message request`
  String get youHaveAlreadyDeclinedUserMessageRequest {
    return Intl.message(
      'You have already declined user message request',
      name: 'youHaveAlreadyDeclinedUserMessageRequest',
      desc: '',
      args: [],
    );
  }

  /// `You can accept or deny user message request.`
  String get youCanAcceptOrDenyUserMessageRequest {
    return Intl.message(
      'You can accept or deny user message request.',
      name: 'youCanAcceptOrDenyUserMessageRequest',
      desc: '',
      args: [],
    );
  }

  /// `You want to purchase this sticker? It will cost you {stickerFormattedPrice}`
  String youWantToPurchaseThisStickerItWillCostYou(
      Object stickerFormattedPrice) {
    return Intl.message(
      'You want to purchase this sticker? It will cost you $stickerFormattedPrice',
      name: 'youWantToPurchaseThisStickerItWillCostYou',
      desc: '',
      args: [stickerFormattedPrice],
    );
  }

  /// `loading ...`
  String get loading {
    return Intl.message(
      'loading ...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Show Likes Notifications`
  String get showLikesNotifications {
    return Intl.message(
      'Show Likes Notifications',
      name: 'showLikesNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get selectLanguage {
    return Intl.message(
      'Select Language',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `French`
  String get french {
    return Intl.message(
      'French',
      name: 'french',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Send Gift to {localUserProfileItemName}`
  String sendGiftToLocalUserProfileItemName(Object localUserProfileItemName) {
    return Intl.message(
      'Send Gift to $localUserProfileItemName',
      name: 'sendGiftToLocalUserProfileItemName',
      desc: '',
      args: [localUserProfileItemName],
    );
  }

  /// `Sign in`
  String get signIn {
    return Intl.message(
      'Sign in',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Email or Username`
  String get emailOrUsername {
    return Intl.message(
      'Email or Username',
      name: 'emailOrUsername',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Failed to initialize`
  String get failedToInitialize {
    return Intl.message(
      'Failed to initialize',
      name: 'failedToInitialize',
      desc: '',
      args: [],
    );
  }

  /// `GO HOME`
  String get goHome {
    return Intl.message(
      'GO HOME',
      name: 'goHome',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `I accept all the `
  String get iAcceptAllThe {
    return Intl.message(
      'I accept all the ',
      name: 'iAcceptAllThe',
      desc: '',
      args: [],
    );
  }

  /// ` and `
  String get and {
    return Intl.message(
      ' and ',
      name: 'and',
      desc: '',
      args: [],
    );
  }

  /// `terms & conditions`
  String get termsConditions {
    return Intl.message(
      'terms & conditions',
      name: 'termsConditions',
      desc: '',
      args: [],
    );
  }

  /// `privacy policy`
  String get privacyPolicy {
    return Intl.message(
      'privacy policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Account Created Successfully`
  String get accountCreatedSuccessfully {
    return Intl.message(
      'Account Created Successfully',
      name: 'accountCreatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Go to login now`
  String get goToLoginNow {
    return Intl.message(
      'Go to login now',
      name: 'goToLoginNow',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Facebook`
  String get signInWithFacebook {
    return Intl.message(
      'Sign in with Facebook',
      name: 'signInWithFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Google`
  String get signInWithGoogle {
    return Intl.message(
      'Sign in with Google',
      name: 'signInWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Your email address`
  String get yourEmailAddress {
    return Intl.message(
      'Your email address',
      name: 'yourEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Send Email OTP`
  String get sendEmailOtp {
    return Intl.message(
      'Send Email OTP',
      name: 'sendEmailOtp',
      desc: '',
      args: [],
    );
  }

  /// `Email OTP`
  String get emailOtp {
    return Intl.message(
      'Email OTP',
      name: 'emailOtp',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get confirmNewPassword {
    return Intl.message(
      'Confirm New Password',
      name: 'confirmNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
