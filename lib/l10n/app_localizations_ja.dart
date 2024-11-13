import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get welcome => '待ちに待ったデートアプリが登場しました！';

  @override
  String get welcomeSmallMessage => 'デートは難しいことではありません。';

  @override
  String get letsGo => 'さあ、始めましょう';

  @override
  String get menuFeaturedUsers => '注目ユーザー';

  @override
  String get menuRandomUsers => 'ランダムユーザー';

  @override
  String get menuOnlineUsers => 'オンラインユーザー';

  @override
  String get menuNewestUsers => '最新ユーザー';

  @override
  String get menuNearestUsers => '近くのユーザー';

  @override
  String get menuCreditWallet => 'クレジットウォレット';

  @override
  String get menuWhoLikesMe => '私をいいねした人';

  @override
  String get menuMutualLikes => '相互いいね！';

  @override
  String get menuMyLikes => '私のいいね！';

  @override
  String get menuMyDislikes => '私の嫌いな人';

  @override
  String get menuVisitors => '訪問者';

  @override
  String get menuBlockedUsers => 'ブロックユーザー';

  @override
  String get menuChangePassword => 'パスワード変更';

  @override
  String get menuChangeEmail => 'メールアドレス変更';

  @override
  String get menuSettings => '設定';

  @override
  String get menuLogout => 'ログアウト';

  @override
  String get areYouSure => '本当によろしいですか？';

  @override
  String get profilePhoto => 'プロフィール写真';

  @override
  String get uploadNewPhotos => 'プロフィール写真';

  @override
  String get helloWorld => 'こんにちは、世界！';

  @override
  String get bePremium => 'プレミアムになる';

  @override
  String get aboutUs => '私たちについて';

  @override
  String get version => 'バージョン';

  @override
  String get boostMyProfile => 'プロフィールをブースト';

  @override
  String get yourProfileIsBoostedFor => 'あなたのプロフィールはブーストされています';

  @override
  String byBoostingYourProfileYouWillBeAPartOf(Object booster_price, Object booster_period) {
    return 'プロフィールをブーストすることで、注目ユーザーになり、検索やランダムユーザーで優先されます。即時$booster_period分の間、$booster_priceクレジットがかかります。';
  }

  @override
  String get boostAgain => '再度ブースト';

  @override
  String get buyCredits => 'クレジットを購入';

  @override
  String get yourDailyLimitForEncountersMayExceedOrThereAre => '出会いの日々の制限が超過する可能性があります。または表示するユーザーがいません。';

  @override
  String get find => '探す';

  @override
  String get myProfile => 'マイプロフィール';

  @override
  String get encounter => 'エンカウンター';

  @override
  String get myPhotos => '私の写真';

  @override
  String get messenger => 'メッセンジャー';

  @override
  String get register => '登録';

  @override
  String get youWantToDeleteThisImage => 'この画像を削除しますか？';

  @override
  String get thereAreNoResultsToShow => '結果がありません。';

  @override
  String get failed => '失敗しました';

  @override
  String get notifications => '通知';

  @override
  String get noResultFound => '結果が見つかりません';

  @override
  String get endOfResult => '結果の終わり';

  @override
  String get premium => 'プレミアム';

  @override
  String get youArePremiumUser => 'プレミアムユーザーです';

  @override
  String get premiumMembershipExpiry => 'プレミアム会員資格の有効期限';

  @override
  String itemPriceCredits(Object price) {
    return '$price クレジット';
  }

  @override
  String get selectPlan => 'プランを選択';

  @override
  String get pleaseSelectAPlan => 'プランを選択してください';

  @override
  String get ok => 'OK';

  @override
  String get extendPremiumMembership => 'プレミアム会員資格を延長';

  @override
  String get bePremiumNow => '今すぐプレミアムになる';

  @override
  String get gift => 'ギフト';

  @override
  String get sendAGift => 'ギフトを送る';

  @override
  String get privately => '個人的に';

  @override
  String get send => '送信';

  @override
  String get cancel => 'キャンセル';

  @override
  String get reportAbuse => '虐待通報';

  @override
  String get block => 'ブロック';

  @override
  String get userBlocked => 'ユーザーがブロックされました';

  @override
  String get unblock => 'ブロック解除';

  @override
  String get totalLikes => '総いいね数';

  @override
  String get totalViews => '総閲覧数';

  @override
  String get aboutMe => '自己紹介';

  @override
  String get gender => '性別';

  @override
  String get preferredLanguage => '希望言語';

  @override
  String get relationshipStatus => '関係の状態';

  @override
  String get education => '学歴';

  @override
  String get mobileNumber => '携帯電話番号';

  @override
  String get location => '場所';

  @override
  String get workStatus => '勤務状況';

  @override
  String get birthday => '誕生日';

  @override
  String get updatePhoto => '写真を更新';

  @override
  String get profileCoverPhoto => 'プロフィールカバー写真';

  @override
  String get myProfileUpdate => 'マイプロフィール更新';

  @override
  String get basicInformation => '基本情報';

  @override
  String get selectCountryCode => '国コードを選択';

  @override
  String get firstName => '名';

  @override
  String get lastName => '姓';

  @override
  String get language => '言語';

  @override
  String get countryPhoneCode => '国の電話コード';

  @override
  String errorError(Object error) {
    return 'エラー: $error';
  }

  @override
  String get yourBasicInformationFormWillComeHere => 'ここに基本情報フォームが表示されます';

  @override
  String get purchaseCredits => 'クレジットを購入';

  @override
  String get tryingToConnect => '接続を試行中...';

  @override
  String get notConnected => '接続されていません';

  @override
  String get fetchingProducts => '製品を取得中...';

  @override
  String get creditPackages => 'クレジットパッケージ';

  @override
  String notFoundedProductsNotFound(Object notFoundedProducts) {
    return '$notFoundedProducts が見つかりません';
  }

  @override
  String get packageNotFound => 'パッケージが見つかりません';

  @override
  String creditsCredits(Object credits) {
    return '$credits クレジット';
  }

  @override
  String get fetchingConsumables => '消耗品を取得中...';

  @override
  String get thisIsAPremiumFeatureToViewThisYouNeed => 'これはプレミアム機能です。これを表示するには、まずプレミアムプランを購入する必要があります。';

  @override
  String get all => 'すべて';

  @override
  String get basic => '基本';

  @override
  String get name => '名前';

  @override
  String get username => 'ユーザー名';

  @override
  String get lookingFor => '探しているもの';

  @override
  String get minimumAge => '最低年齢';

  @override
  String get maximumAge => '最高年齢';

  @override
  String distanceFromMyLocationDistanceUnit(Object distanceUnit) {
    return '私の位置からの距離 ($distanceUnit)';
  }

  @override
  String get personal => '個人的';

  @override
  String get minimumHeight => '最低身長';

  @override
  String get maximumHeight => '最高身長';

  @override
  String get apply => '適用';

  @override
  String get home => 'ホーム';

  @override
  String get myCreditWallet => '私のクレジットウォレット';

  @override
  String get buyMoreCredits => 'さらにクレジットを購入';

  @override
  String get yourWalletBalance => 'あなたのウォレット残高';

  @override
  String walletBalanceCredits(int walletBalance) {
    return '$walletBalance クレジット';
  }

  @override
  String get financialTransaction => '金融取引';

  @override
  String get transaction => '取引';

  @override
  String get on => 'で';

  @override
  String get paymentMethod => '支払い方法';

  @override
  String get abuseReport => '虐待報告';

  @override
  String get userHasBeenReportedSuccessfully => 'ユーザーは正常に報告されました';

  @override
  String get report => '報告する';

  @override
  String get reason => '理由';

  @override
  String get reportUser => 'ユーザーを報告する';

  @override
  String get goBack => '戻る';

  @override
  String get changeEmail => 'メールアドレスの変更';

  @override
  String get activateYourNewEmailAddress => '新しいメールアドレスを有効化する';

  @override
  String get almostFinishedYouNeedToConfirmYourEmailAddressTo => 'もうすぐ終了します... メールアドレスを確認する必要があります。アクティベーションプロセスを完了するには、私たちが送ったメール内のリンクをクリックしてください。';

  @override
  String get currentEmail => '現在のメールアドレス';

  @override
  String get newEmail => '新しいメールアドレス';

  @override
  String get password => 'パスワード';

  @override
  String get changePassword => 'パスワードの変更';

  @override
  String get showVisitorNotifications => '訪問者通知を表示する';

  @override
  String get showGiftsNotifications => 'ギフト通知を表示する';

  @override
  String get showMessagesNotifications => 'メッセージ通知を表示する';

  @override
  String get showLoginNotificationsForYourLikedUsers => '好きなユーザーのログイン通知を表示する';

  @override
  String get displayMobileNumber => '携帯番号を表示する';

  @override
  String get updateSettings => '設定を更新する';

  @override
  String get allContentIncludingPhotosAndOtherDataWillBePermanently => '写真やその他のデータを含むすべてのコンテンツは永久に削除されます！';

  @override
  String get confirmPassword => 'パスワードを確認する';

  @override
  String get yesDelete => 'はい、削除する';

  @override
  String get deleteAccount => 'アカウントを削除する';

  @override
  String get alert => '警告';

  @override
  String get error => 'エラー...';

  @override
  String get doYouWantToDeleteAllTheChatMessageOf => 'このユーザーのすべてのチャットメッセージを削除しますか？';

  @override
  String get yes => 'はい';

  @override
  String get no => 'いいえ';

  @override
  String get deleteAllChatHistory => 'すべてのチャット履歴を削除する';

  @override
  String get loadingMessages => 'メッセージを読み込んでいます...';

  @override
  String get requestDenied => 'リクエストが拒否されました';

  @override
  String get youHaveAlreadyDeclinedUserMessageRequest => 'すでにユーザーメッセージのリクエストを拒否しています';

  @override
  String get youCanAcceptOrDenyUserMessageRequest => 'ユーザーメッセージのリクエストを承諾または拒否できます。';

  @override
  String youWantToPurchaseThisStickerItWillCostYou(Object stickerFormattedPrice) {
    return 'このステッカーを購入しますか？ それは $stickerFormattedPrice かかります';
  }

  @override
  String get loading => '読み込み中...';

  @override
  String get showLikesNotifications => 'いいね通知を表示する';

  @override
  String get settings => '設定';

  @override
  String get selectLanguage => '言語を選択';

  @override
  String get french => 'フランス語';

  @override
  String get english => '英語';

  @override
  String sendGiftToLocalUserProfileItemName(Object localUserProfileItemName) {
    return '$localUserProfileItemName にギフトを送る';
  }

  @override
  String get signIn => 'サインイン';

  @override
  String get emailOrUsername => 'メールアドレスまたはユーザー名';

  @override
  String get login => 'ログイン';

  @override
  String get forgotPassword => 'パスワードを忘れた場合';

  @override
  String get failedToInitialize => '初期化に失敗しました';

  @override
  String get goHome => 'ホームに戻る';

  @override
  String get email => 'メール';

  @override
  String get iAcceptAllThe => '私はすべてを受け入れます';

  @override
  String get and => ' および ';

  @override
  String get termsConditions => '利用規約';

  @override
  String get privacyPolicy => 'プライバシーポリシー';

  @override
  String get accountCreatedSuccessfully => 'アカウントが正常に作成されました';

  @override
  String get goToLoginNow => '今すぐログインに移動';

  @override
  String get signInWithFacebook => 'Facebookでサインイン';

  @override
  String get signInWithGoogle => 'Googleでサインイン';

  @override
  String get yourEmailAddress => 'あなたのメールアドレス';

  @override
  String get sendEmailOtp => 'メールOTPを送信';

  @override
  String get emailOtp => 'メールOTP';

  @override
  String get newPassword => '新しいパスワード';

  @override
  String get confirmNewPassword => '新しいパスワードを確認';

  @override
  String get submit => '送信する';
}
