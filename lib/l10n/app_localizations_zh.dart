import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get welcome => '最期待的约会应用来啦！';

  @override
  String get welcomeSmallMessage => '约会不必太难。';

  @override
  String get letsGo => '走吧';

  @override
  String get menuFeaturedUsers => '特色用户';

  @override
  String get menuRandomUsers => '随机用户';

  @override
  String get menuOnlineUsers => '在线用户';

  @override
  String get menuNewestUsers => '最新用户';

  @override
  String get menuNearestUsers => '最近用户';

  @override
  String get menuCreditWallet => '信用钱包';

  @override
  String get menuWhoLikesMe => '谁喜欢我';

  @override
  String get menuMutualLikes => '互相喜欢';

  @override
  String get menuMyLikes => '我的喜欢';

  @override
  String get menuMyDislikes => '我的不喜欢';

  @override
  String get menuVisitors => '访客';

  @override
  String get menuBlockedUsers => '已屏蔽用户';

  @override
  String get menuChangePassword => '更改密码';

  @override
  String get menuChangeEmail => '更改电子邮件';

  @override
  String get menuSettings => '设置';

  @override
  String get menuLogout => '登出';

  @override
  String get areYouSure => '您确定吗？';

  @override
  String get profilePhoto => '个人照片';

  @override
  String get uploadNewPhotos => '上传新照片';

  @override
  String get helloWorld => '你好，世界！';

  @override
  String get bePremium => '成为高级用户';

  @override
  String get aboutUs => '关于我们';

  @override
  String get version => '版本';

  @override
  String get boostMyProfile => '提升我的资料';

  @override
  String get yourProfileIsBoostedFor => '您的资料已提升';

  @override
  String byBoostingYourProfileYouWillBeAPartOf(Object booster_price, Object booster_period) {
    return '通过提升您的资料，您将成为特色用户，并在搜索和随机用户中优先显示。即刻提升需支付 $booster_price 积分，有效时长 $booster_period 分钟。';
  }

  @override
  String get boostAgain => '再次提升';

  @override
  String get buyCredits => '购买积分';

  @override
  String get yourDailyLimitForEncountersMayExceedOrThereAre => '您的每日约会上限可能已超出或没有用户展示。';

  @override
  String get find => '查找';

  @override
  String get myProfile => '我的资料';

  @override
  String get encounter => '遇见';

  @override
  String get myPhotos => '我的照片';

  @override
  String get messenger => '信使';

  @override
  String get register => '注册';

  @override
  String get youWantToDeleteThisImage => '您确定要删除这张照片吗？';

  @override
  String get thereAreNoResultsToShow => '没有可显示的结果。';

  @override
  String get failed => '失败';

  @override
  String get notifications => '通知';

  @override
  String get noResultFound => '未找到结果';

  @override
  String get endOfResult => '结果结束';

  @override
  String get premium => '高级';

  @override
  String get youArePremiumUser => '您是高级用户';

  @override
  String get premiumMembershipExpiry => '高级会员到期';

  @override
  String itemPriceCredits(Object price) {
    return '$price 积分';
  }

  @override
  String get selectPlan => '选择计划';

  @override
  String get pleaseSelectAPlan => '请选择一个计划';

  @override
  String get ok => '确认';

  @override
  String get extendPremiumMembership => '延长高级会员';

  @override
  String get bePremiumNow => '立即成为高级用户';

  @override
  String get gift => '礼物';

  @override
  String get sendAGift => '发送礼物';

  @override
  String get privately => '私下';

  @override
  String get send => '发送';

  @override
  String get cancel => '取消';

  @override
  String get reportAbuse => '举报滥用';

  @override
  String get block => '屏蔽';

  @override
  String get userBlocked => '用户已屏蔽';

  @override
  String get unblock => '解除屏蔽';

  @override
  String get totalLikes => '总喜欢';

  @override
  String get totalViews => '总浏览';

  @override
  String get aboutMe => '关于我';

  @override
  String get gender => '性别';

  @override
  String get preferredLanguage => '首选语言';

  @override
  String get relationshipStatus => '关系状态';

  @override
  String get education => '教育';

  @override
  String get mobileNumber => '手机号码';

  @override
  String get location => '位置';

  @override
  String get workStatus => '工作状态';

  @override
  String get birthday => '生日';

  @override
  String get updatePhoto => '更新照片';

  @override
  String get profileCoverPhoto => '个人封面照片';

  @override
  String get myProfileUpdate => '我的资料更新';

  @override
  String get basicInformation => '基本信息';

  @override
  String get selectCountryCode => '选择国家代码';

  @override
  String get firstName => '名字';

  @override
  String get lastName => '姓氏';

  @override
  String get language => '语言';

  @override
  String get countryPhoneCode => '国家电话代码';

  @override
  String errorError(Object error) {
    return '错误: $error';
  }

  @override
  String get yourBasicInformationFormWillComeHere => '您的基本信息表单将显示在这里';

  @override
  String get purchaseCredits => '购买积分';

  @override
  String get tryingToConnect => '尝试连接中...';

  @override
  String get notConnected => '未连接';

  @override
  String get fetchingProducts => '获取产品中...';

  @override
  String get creditPackages => '积分套餐';

  @override
  String notFoundedProductsNotFound(Object notFoundedProducts) {
    return '未找到$notFoundedProducts';
  }

  @override
  String get packageNotFound => '未找到套餐';

  @override
  String creditsCredits(Object credits) {
    return '$credits 积分';
  }

  @override
  String get fetchingConsumables => '获取消耗品中...';

  @override
  String get thisIsAPremiumFeatureToViewThisYouNeed => '这是高级功能，您需要先购买高级套餐才能查看。';

  @override
  String get all => '全部';

  @override
  String get basic => '基本';

  @override
  String get name => '姓名';

  @override
  String get username => '用户名';

  @override
  String get lookingFor => '寻找';

  @override
  String get minimumAge => '最小年龄';

  @override
  String get maximumAge => '最大年龄';

  @override
  String distanceFromMyLocationDistanceUnit(Object distanceUnit) {
    return '距离我的位置 ($distanceUnit)';
  }

  @override
  String get personal => '个人';

  @override
  String get minimumHeight => '最小身高';

  @override
  String get maximumHeight => '最大身高';

  @override
  String get apply => '应用';

  @override
  String get home => '主页';

  @override
  String get myCreditWallet => '我的积分钱包';

  @override
  String get buyMoreCredits => '购买更多积分';

  @override
  String get yourWalletBalance => '您的钱包余额';

  @override
  String walletBalanceCredits(int walletBalance) {
    return '$walletBalance 积分';
  }

  @override
  String get financialTransaction => '财务交易';

  @override
  String get transaction => '交易';

  @override
  String get on => '在';

  @override
  String get paymentMethod => '支付方式';

  @override
  String get abuseReport => '滥用报告';

  @override
  String get userHasBeenReportedSuccessfully => '用户已成功举报';

  @override
  String get report => '举报';

  @override
  String get reason => '原因';

  @override
  String get reportUser => '举报用户';

  @override
  String get goBack => '返回';

  @override
  String get changeEmail => '更改电子邮件';

  @override
  String get activateYourNewEmailAddress => '激活您的新电子邮件地址';

  @override
  String get almostFinishedYouNeedToConfirmYourEmailAddressTo => '几乎完成... 您需要确认您的电子邮件地址。请点击我们刚发送给您的电子邮件中的链接，以完成激活过程。';

  @override
  String get currentEmail => '当前电子邮件';

  @override
  String get newEmail => '新电子邮件';

  @override
  String get password => '密码';

  @override
  String get changePassword => '更改密码';

  @override
  String get showVisitorNotifications => '显示访客通知';

  @override
  String get showGiftsNotifications => '显示礼物通知';

  @override
  String get showMessagesNotifications => '显示消息通知';

  @override
  String get showLoginNotificationsForYourLikedUsers => '显示喜欢的用户的登录通知';

  @override
  String get displayMobileNumber => '显示手机号码';

  @override
  String get updateSettings => '更新设置';

  @override
  String get allContentIncludingPhotosAndOtherDataWillBePermanently => '所有内容（包括照片和其他数据）将被永久删除！';

  @override
  String get confirmPassword => '确认密码';

  @override
  String get yesDelete => '是，删除';

  @override
  String get deleteAccount => '删除账户';

  @override
  String get alert => '警报';

  @override
  String get error => '错误...';

  @override
  String get doYouWantToDeleteAllTheChatMessageOf => '您是否要删除此用户的所有聊天消息？';

  @override
  String get yes => '是';

  @override
  String get no => '否';

  @override
  String get deleteAllChatHistory => '删除所有聊天记录';

  @override
  String get loadingMessages => '正在加载消息...';

  @override
  String get requestDenied => '请求被拒绝';

  @override
  String get youHaveAlreadyDeclinedUserMessageRequest => '您已经拒绝了用户的消息请求';

  @override
  String get youCanAcceptOrDenyUserMessageRequest => '您可以接受或拒绝用户的消息请求。';

  @override
  String youWantToPurchaseThisStickerItWillCostYou(Object stickerFormattedPrice) {
    return '您要购买此贴纸吗？将花费您 $stickerFormattedPrice';
  }

  @override
  String get loading => '加载中...';

  @override
  String get showLikesNotifications => '显示喜欢的通知';

  @override
  String get settings => '设置';

  @override
  String get selectLanguage => '选择语言';

  @override
  String get french => '法语';

  @override
  String get english => '英语';

  @override
  String sendGiftToLocalUserProfileItemName(Object localUserProfileItemName) {
    return '向 $localUserProfileItemName 发送礼物';
  }

  @override
  String get signIn => '登录';

  @override
  String get emailOrUsername => '电子邮件或用户名';

  @override
  String get login => '登录';

  @override
  String get forgotPassword => '忘记密码？';

  @override
  String get failedToInitialize => '初始化失败';

  @override
  String get goHome => '返回首页';

  @override
  String get email => '电子邮件';

  @override
  String get iAcceptAllThe => '我接受所有';

  @override
  String get and => '和';

  @override
  String get termsConditions => '条款和条件';

  @override
  String get privacyPolicy => '隐私政策';

  @override
  String get accountCreatedSuccessfully => '账户创建成功';

  @override
  String get goToLoginNow => '立即登录';

  @override
  String get signInWithFacebook => '使用 Facebook 登录';

  @override
  String get signInWithGoogle => '使用 Google 登录';

  @override
  String get yourEmailAddress => '您的电子邮件地址';

  @override
  String get sendEmailOtp => '发送电子邮件 OTP';

  @override
  String get emailOtp => '电子邮件 OTP';

  @override
  String get newPassword => '新密码';

  @override
  String get confirmNewPassword => '确认新密码';

  @override
  String get submit => '提交';
}
