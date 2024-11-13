import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get welcome => 'Самое ожидаемое приложение для знакомств здесь!';

  @override
  String get welcomeSmallMessage => 'Знакомства не обязательно быть сложными.';

  @override
  String get letsGo => 'Поехали';

  @override
  String get menuFeaturedUsers => 'Избранные пользователи';

  @override
  String get menuRandomUsers => 'Случайные пользователи';

  @override
  String get menuOnlineUsers => 'Онлайн пользователи';

  @override
  String get menuNewestUsers => 'Новые пользователи';

  @override
  String get menuNearestUsers => 'Ближайшие пользователи';

  @override
  String get menuCreditWallet => 'Кошелёк кредитов';

  @override
  String get menuWhoLikesMe => 'Кто понравился';

  @override
  String get menuMutualLikes => 'Взаимные лайки';

  @override
  String get menuMyLikes => 'Мои лайки';

  @override
  String get menuMyDislikes => 'Мои дизлайки';

  @override
  String get menuVisitors => 'Посетители';

  @override
  String get menuBlockedUsers => 'Заблокированные пользователи';

  @override
  String get menuChangePassword => 'Сменить пароль';

  @override
  String get menuChangeEmail => 'Сменить email';

  @override
  String get menuSettings => 'Настройки';

  @override
  String get menuLogout => 'Выйти';

  @override
  String get areYouSure => 'Вы уверены?';

  @override
  String get profilePhoto => 'Фото профиля';

  @override
  String get uploadNewPhotos => 'Загрузить новые фото';

  @override
  String get helloWorld => 'Привет, мир!';

  @override
  String get bePremium => 'Станьте Премиум';

  @override
  String get aboutUs => 'О нас';

  @override
  String get version => 'Версия';

  @override
  String get boostMyProfile => 'Поднять мой профиль';

  @override
  String get yourProfileIsBoostedFor => 'Ваш профиль поднят на';

  @override
  String byBoostingYourProfileYouWillBeAPartOf(Object booster_price, Object booster_period) {
    return 'Поднимая свой профиль, вы становитесь частью избранных пользователей и получаете приоритет в поиске и случайных пользователях. Это будет стоить вам $booster_price кредитов на $booster_period минут';
  }

  @override
  String get boostAgain => 'Поднять снова';

  @override
  String get buyCredits => 'Купить кредиты';

  @override
  String get yourDailyLimitForEncountersMayExceedOrThereAre => 'Ваш ежедневный лимит встреч может быть превышен или нет пользователей для отображения.';

  @override
  String get find => 'Найти';

  @override
  String get myProfile => 'Мой профиль';

  @override
  String get encounter => 'Встреча';

  @override
  String get myPhotos => 'Мои фото';

  @override
  String get messenger => 'Мессенджер';

  @override
  String get register => 'Регистрация';

  @override
  String get youWantToDeleteThisImage => 'Вы хотите удалить это изображение?';

  @override
  String get thereAreNoResultsToShow => 'Нет результатов для отображения.';

  @override
  String get failed => 'Ошибка';

  @override
  String get notifications => 'Уведомления';

  @override
  String get noResultFound => 'Результат не найден';

  @override
  String get endOfResult => 'Конец результатов';

  @override
  String get premium => 'Премиум';

  @override
  String get youArePremiumUser => 'Вы являетесь пользователем Премиум';

  @override
  String get premiumMembershipExpiry => 'Истекает Премиум-членство';

  @override
  String itemPriceCredits(Object price) {
    return '$price кредитов';
  }

  @override
  String get selectPlan => 'Выберите план';

  @override
  String get pleaseSelectAPlan => 'Пожалуйста, выберите план';

  @override
  String get ok => 'OK';

  @override
  String get extendPremiumMembership => 'Продлить Премиум-членство';

  @override
  String get bePremiumNow => 'Станьте Премиум сейчас';

  @override
  String get gift => 'Подарок';

  @override
  String get sendAGift => 'Отправить подарок';

  @override
  String get privately => 'Лично';

  @override
  String get send => 'Отправить';

  @override
  String get cancel => 'Отмена';

  @override
  String get reportAbuse => 'Сообщить о нарушении';

  @override
  String get block => 'Заблокировать';

  @override
  String get userBlocked => 'Пользователь заблокирован';

  @override
  String get unblock => 'Разблокировать';

  @override
  String get totalLikes => 'Всего лайков';

  @override
  String get totalViews => 'Всего просмотров';

  @override
  String get aboutMe => 'Обо мне';

  @override
  String get gender => 'Пол';

  @override
  String get preferredLanguage => 'Предпочитаемый язык';

  @override
  String get relationshipStatus => 'Семейное положение';

  @override
  String get education => 'Образование';

  @override
  String get mobileNumber => 'Номер мобильного';

  @override
  String get location => 'Местоположение';

  @override
  String get workStatus => 'Рабочий статус';

  @override
  String get birthday => 'День рождения';

  @override
  String get updatePhoto => 'Обновить фото';

  @override
  String get profileCoverPhoto => 'Фото обложки профиля';

  @override
  String get myProfileUpdate => 'Мое обновление профиля';

  @override
  String get basicInformation => 'Основная информация';

  @override
  String get selectCountryCode => 'Выберите код страны';

  @override
  String get firstName => 'Имя';

  @override
  String get lastName => 'Фамилия';

  @override
  String get language => 'Язык';

  @override
  String get countryPhoneCode => 'Телефонный код страны';

  @override
  String errorError(Object error) {
    return 'Ошибка: $error';
  }

  @override
  String get yourBasicInformationFormWillComeHere => 'Здесь будет ваша форма базовой информации';

  @override
  String get purchaseCredits => 'Купить кредиты';

  @override
  String get tryingToConnect => 'Попытка подключения...';

  @override
  String get notConnected => 'Не подключено';

  @override
  String get fetchingProducts => 'Получение продуктов...';

  @override
  String get creditPackages => 'Пакеты кредитов';

  @override
  String notFoundedProductsNotFound(Object notFoundedProducts) {
    return '$notFoundedProducts не найдено';
  }

  @override
  String get packageNotFound => 'Пакет не найден';

  @override
  String creditsCredits(Object credits) {
    return '$credits кредитов';
  }

  @override
  String get fetchingConsumables => 'Получение расходных материалов...';

  @override
  String get thisIsAPremiumFeatureToViewThisYouNeed => 'Это премиум-функция. Чтобы её просматривать, вам необходимо сначала купить премиум-план.';

  @override
  String get all => 'Все';

  @override
  String get basic => 'Основные';

  @override
  String get name => 'Имя';

  @override
  String get username => 'Имя пользователя';

  @override
  String get lookingFor => 'Ищу';

  @override
  String get minimumAge => 'Минимальный возраст';

  @override
  String get maximumAge => 'Максимальный возраст';

  @override
  String distanceFromMyLocationDistanceUnit(Object distanceUnit) {
    return 'Расстояние от моего местоположения ($distanceUnit)';
  }

  @override
  String get personal => 'Личные';

  @override
  String get minimumHeight => 'Минимальный рост';

  @override
  String get maximumHeight => 'Максимальный рост';

  @override
  String get apply => 'Применить';

  @override
  String get home => 'Главная';

  @override
  String get myCreditWallet => 'Мой кошелек кредитов';

  @override
  String get buyMoreCredits => 'Купить больше кредитов';

  @override
  String get yourWalletBalance => 'Баланс вашего кошелька';

  @override
  String walletBalanceCredits(int walletBalance) {
    return '$walletBalance кредитов';
  }

  @override
  String get financialTransaction => 'Финансовая транзакция';

  @override
  String get transaction => 'Транзакция';

  @override
  String get on => 'на';

  @override
  String get paymentMethod => 'Метод оплаты';

  @override
  String get abuseReport => 'Отчет о нарушении';

  @override
  String get userHasBeenReportedSuccessfully => 'Пользователь успешно зарегистрирован';

  @override
  String get report => 'Сообщить';

  @override
  String get reason => 'Причина';

  @override
  String get reportUser => 'Сообщить о пользователе';

  @override
  String get goBack => 'Назад';

  @override
  String get changeEmail => 'Изменить Email';

  @override
  String get activateYourNewEmailAddress => 'Активируйте ваш новый адрес электронной почты';

  @override
  String get almostFinishedYouNeedToConfirmYourEmailAddressTo => 'Почти закончено... Вам нужно подтвердить свой адрес электронной почты. Чтобы завершить процесс активации, пожалуйста, перейдите по ссылке в письме, которое мы только что отправили вам.';

  @override
  String get currentEmail => 'Текущий Email';

  @override
  String get newEmail => 'Новый Email';

  @override
  String get password => 'Пароль';

  @override
  String get changePassword => 'Изменить пароль';

  @override
  String get showVisitorNotifications => 'Показывать уведомления о посетителях';

  @override
  String get showGiftsNotifications => 'Показывать уведомления о подарках';

  @override
  String get showMessagesNotifications => 'Показывать уведомления о сообщениях';

  @override
  String get showLoginNotificationsForYourLikedUsers => 'Показывать уведомления о входах в систему для ваших понравившихся пользователях';

  @override
  String get displayMobileNumber => 'Отображать номер мобильного телефона';

  @override
  String get updateSettings => 'Обновить настройки';

  @override
  String get allContentIncludingPhotosAndOtherDataWillBePermanently => 'Весь контент, включая фотографии и другие данные, будет безвозвратно удален!';

  @override
  String get confirmPassword => 'Подтвердите пароль';

  @override
  String get yesDelete => 'Да, удалить';

  @override
  String get deleteAccount => 'Удалить аккаунт';

  @override
  String get alert => 'Предупреждение';

  @override
  String get error => 'Ошибка';

  @override
  String get doYouWantToDeleteAllTheChatMessageOf => 'Вы хотите удалить все сообщения чата с этим пользователем?';

  @override
  String get yes => 'Да';

  @override
  String get no => 'Нет';

  @override
  String get deleteAllChatHistory => 'Удалить всю историю чата';

  @override
  String get loadingMessages => 'Загрузка сообщений...';

  @override
  String get requestDenied => 'Запрос отклонен';

  @override
  String get youHaveAlreadyDeclinedUserMessageRequest => 'Вы уже отклонили запрос на сообщение от пользователя';

  @override
  String get youCanAcceptOrDenyUserMessageRequest => 'Вы можете принять или отклонить запрос на сообщение от пользователя.';

  @override
  String youWantToPurchaseThisStickerItWillCostYou(Object stickerFormattedPrice) {
    return 'Вы хотите купить этот стикер? Это будет стоить вам $stickerFormattedPrice';
  }

  @override
  String get loading => 'Загрузка...';

  @override
  String get showLikesNotifications => 'Показывать уведомления о лайках';

  @override
  String get settings => 'Настройки';

  @override
  String get selectLanguage => 'Выберите язык';

  @override
  String get french => 'Французский';

  @override
  String get english => 'Английский';

  @override
  String sendGiftToLocalUserProfileItemName(Object localUserProfileItemName) {
    return 'Отправить подарок пользователю $localUserProfileItemName';
  }

  @override
  String get signIn => 'Войти';

  @override
  String get emailOrUsername => 'Email или Имя пользователя';

  @override
  String get login => 'Вход';

  @override
  String get forgotPassword => 'Забыли пароль?';

  @override
  String get failedToInitialize => 'Ошибка инициализации';

  @override
  String get goHome => 'На главную';

  @override
  String get email => 'Email';

  @override
  String get iAcceptAllThe => 'Я принимаю все ';

  @override
  String get and => ' и ';

  @override
  String get termsConditions => 'условия использования';

  @override
  String get privacyPolicy => 'политику конфиденциальности';

  @override
  String get accountCreatedSuccessfully => 'Аккаунт успешно создан';

  @override
  String get goToLoginNow => 'Перейти к входу сейчас';

  @override
  String get signInWithFacebook => 'Войти через Facebook';

  @override
  String get signInWithGoogle => 'Войти через Google';

  @override
  String get yourEmailAddress => 'Ваш адрес электронной почты';

  @override
  String get sendEmailOtp => 'Отправить Email OTP';

  @override
  String get emailOtp => 'Email OTP';

  @override
  String get newPassword => 'Новый пароль';

  @override
  String get confirmNewPassword => 'Подтвердите новый пароль';

  @override
  String get submit => 'Отправить';
}
