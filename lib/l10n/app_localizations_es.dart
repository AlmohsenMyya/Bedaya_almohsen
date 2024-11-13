import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get welcome => '¡La aplicación de citas más esperada está aquí!';

  @override
  String get welcomeSmallMessage => 'Las citas no tienen por qué ser difíciles.';

  @override
  String get letsGo => '¡Vamos!';

  @override
  String get menuFeaturedUsers => 'Usuarios destacados';

  @override
  String get menuRandomUsers => 'Usuarios aleatorios';

  @override
  String get menuOnlineUsers => 'Usuarios en línea';

  @override
  String get menuNewestUsers => 'Usuarios más recientes';

  @override
  String get menuNearestUsers => 'Usuarios más cercanos';

  @override
  String get menuCreditWallet => 'Cartera de crédito';

  @override
  String get menuWhoLikesMe => 'A quienes les gusto';

  @override
  String get menuMutualLikes => 'Me gustas mutuos';

  @override
  String get menuMyLikes => 'Mis Me gustas';

  @override
  String get menuMyDislikes => 'Mis No me gustas';

  @override
  String get menuVisitors => 'Visitantes';

  @override
  String get menuBlockedUsers => 'Usuarios bloqueados';

  @override
  String get menuChangePassword => 'Cambiar contraseña';

  @override
  String get menuChangeEmail => 'Cambiar email';

  @override
  String get menuSettings => 'Configuración';

  @override
  String get menuLogout => 'Cerrar sesión';

  @override
  String get areYouSure => '¿Estás seguro?';

  @override
  String get profilePhoto => 'Foto de perfil';

  @override
  String get uploadNewPhotos => 'Subir nuevas fotos';

  @override
  String get helloWorld => '¡Hola Mundo!';

  @override
  String get bePremium => 'Ser Premium';

  @override
  String get aboutUs => 'Acerca de nosotros';

  @override
  String get version => 'Versión';

  @override
  String get boostMyProfile => 'Impulsa mi perfil';

  @override
  String get yourProfileIsBoostedFor => 'Tu perfil está impulsado por';

  @override
  String byBoostingYourProfileYouWillBeAPartOf(Object booster_price, Object booster_period) {
    return 'Al impulsar tu perfil, serás parte de los usuarios destacados y tendrás prioridad en la búsqueda y usuarios aleatorios. Te costará $booster_price créditos por $booster_period minutos';
  }

  @override
  String get boostAgain => 'Impulsar de nuevo';

  @override
  String get buyCredits => 'Comprar créditos';

  @override
  String get yourDailyLimitForEncountersMayExceedOrThereAre => 'Tu límite diario para encuentros puede excederse o no hay usuarios para mostrar.';

  @override
  String get find => 'Buscar';

  @override
  String get myProfile => 'Mi perfil';

  @override
  String get encounter => 'Encuentro';

  @override
  String get myPhotos => 'Mis fotos';

  @override
  String get messenger => 'Mensajero';

  @override
  String get register => 'Registrarse';

  @override
  String get youWantToDeleteThisImage => '¿Quieres eliminar esta imagen?';

  @override
  String get thereAreNoResultsToShow => 'No hay resultados para mostrar.';

  @override
  String get failed => 'Fallido';

  @override
  String get notifications => 'Notificaciones';

  @override
  String get noResultFound => 'No se encontraron resultados';

  @override
  String get endOfResult => 'Fin de los resultados';

  @override
  String get premium => 'Premium';

  @override
  String get youArePremiumUser => 'Eres usuario Premium';

  @override
  String get premiumMembershipExpiry => 'Caducidad de la membresía Premium';

  @override
  String itemPriceCredits(Object price) {
    return '$price créditos';
  }

  @override
  String get selectPlan => 'Seleccionar Plan';

  @override
  String get pleaseSelectAPlan => 'Por favor selecciona un plan';

  @override
  String get ok => 'Aceptar';

  @override
  String get extendPremiumMembership => 'Extender Membresía Premium';

  @override
  String get bePremiumNow => 'Ser Premium Ahora';

  @override
  String get gift => 'Regalo';

  @override
  String get sendAGift => 'Enviar un Regalo';

  @override
  String get privately => 'Privadamente';

  @override
  String get send => 'Enviar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get reportAbuse => 'Reportar Abuso';

  @override
  String get block => 'Bloquear';

  @override
  String get userBlocked => 'Usuario bloqueado';

  @override
  String get unblock => 'Desbloquear';

  @override
  String get totalLikes => 'Total de Me gusta';

  @override
  String get totalViews => 'Total de Vistas';

  @override
  String get aboutMe => 'Acerca de mí';

  @override
  String get gender => 'Género';

  @override
  String get preferredLanguage => 'Idioma Preferido';

  @override
  String get relationshipStatus => 'Estado Civil';

  @override
  String get education => 'Educación';

  @override
  String get mobileNumber => 'Número de Teléfono Móvil';

  @override
  String get location => 'Ubicación';

  @override
  String get workStatus => 'Estado Laboral';

  @override
  String get birthday => 'Cumpleaños';

  @override
  String get updatePhoto => 'Actualizar Foto';

  @override
  String get profileCoverPhoto => 'Foto de Portada del Perfil';

  @override
  String get myProfileUpdate => 'Actualización de mi Perfil';

  @override
  String get basicInformation => 'Información Básica';

  @override
  String get selectCountryCode => 'Seleccionar Código de País';

  @override
  String get firstName => 'Nombre';

  @override
  String get lastName => 'Apellido';

  @override
  String get language => 'Idioma';

  @override
  String get countryPhoneCode => 'Código de País';

  @override
  String errorError(Object error) {
    return 'Error: $error';
  }

  @override
  String get yourBasicInformationFormWillComeHere => 'Tu formulario de información básica aparecerá aquí';

  @override
  String get purchaseCredits => 'Comprar Créditos';

  @override
  String get tryingToConnect => 'Intentando conectar...';

  @override
  String get notConnected => 'No conectado';

  @override
  String get fetchingProducts => 'Obteniendo productos...';

  @override
  String get creditPackages => 'Paquetes de Crédito';

  @override
  String notFoundedProductsNotFound(Object notFoundedProducts) {
    return '$notFoundedProducts no encontrado';
  }

  @override
  String get packageNotFound => 'Paquete no encontrado';

  @override
  String creditsCredits(Object credits) {
    return '$credits créditos';
  }

  @override
  String get fetchingConsumables => 'Obteniendo consumibles...';

  @override
  String get thisIsAPremiumFeatureToViewThisYouNeed => 'Esta es una función premium, necesitas comprar un plan premium primero para ver esto.';

  @override
  String get all => 'Todos';

  @override
  String get basic => 'Básico';

  @override
  String get name => 'Nombre';

  @override
  String get username => 'Nombre de usuario';

  @override
  String get lookingFor => 'Buscando';

  @override
  String get minimumAge => 'Edad Mínima';

  @override
  String get maximumAge => 'Edad Máxima';

  @override
  String distanceFromMyLocationDistanceUnit(Object distanceUnit) {
    return 'Distancia desde mi ubicación ($distanceUnit)';
  }

  @override
  String get personal => 'Personal';

  @override
  String get minimumHeight => 'Altura Mínima';

  @override
  String get maximumHeight => 'Altura Máxima';

  @override
  String get apply => 'Aplicar';

  @override
  String get home => 'Inicio';

  @override
  String get myCreditWallet => 'Mi Billetera de Crédito';

  @override
  String get buyMoreCredits => 'Comprar más Créditos';

  @override
  String get yourWalletBalance => 'Saldo de tu Billetera';

  @override
  String walletBalanceCredits(int walletBalance) {
    return '$walletBalance Créditos';
  }

  @override
  String get financialTransaction => 'Transacción Financiera';

  @override
  String get transaction => 'Transacción';

  @override
  String get on => 'en';

  @override
  String get paymentMethod => 'Método de Pago';

  @override
  String get abuseReport => 'Reporte de Abuso';

  @override
  String get userHasBeenReportedSuccessfully => 'El usuario ha sido reportado exitosamente';

  @override
  String get report => 'Reportar';

  @override
  String get reason => 'Motivo';

  @override
  String get reportUser => 'Reportar Usuario';

  @override
  String get goBack => 'Volver';

  @override
  String get changeEmail => 'Cambiar Correo Electrónico';

  @override
  String get activateYourNewEmailAddress => 'Activar tu nueva dirección de correo electrónico';

  @override
  String get almostFinishedYouNeedToConfirmYourEmailAddressTo => 'Casi terminado... Necesitas confirmar tu dirección de correo electrónico. Para completar el proceso de activación, por favor haz clic en el enlace que te acabamos de enviar por correo electrónico.';

  @override
  String get currentEmail => 'Correo Electrónico Actual';

  @override
  String get newEmail => 'Nuevo Correo Electrónico';

  @override
  String get password => 'Contraseña';

  @override
  String get changePassword => 'Cambiar Contraseña';

  @override
  String get showVisitorNotifications => 'Mostrar Notificaciones de Visitantes';

  @override
  String get showGiftsNotifications => 'Mostrar Notificaciones de Regalos';

  @override
  String get showMessagesNotifications => 'Mostrar Notificaciones de Mensajes';

  @override
  String get showLoginNotificationsForYourLikedUsers => 'Mostrar Notificaciones de Inicio de Sesión para Tus Usuarios Favoritos';

  @override
  String get displayMobileNumber => 'Mostrar Número de Teléfono Móvil';

  @override
  String get updateSettings => 'Actualizar Configuración';

  @override
  String get allContentIncludingPhotosAndOtherDataWillBePermanently => '¡Todo el contenido incluyendo fotos y otros datos será eliminado permanentemente!';

  @override
  String get confirmPassword => 'Confirmar Contraseña';

  @override
  String get yesDelete => 'Sí, eliminar';

  @override
  String get deleteAccount => 'Eliminar Cuenta';

  @override
  String get alert => 'Alerta';

  @override
  String get error => '¡Error!';

  @override
  String get doYouWantToDeleteAllTheChatMessageOf => '¿Quieres eliminar todos los mensajes de chat de este usuario?';

  @override
  String get yes => 'Sí';

  @override
  String get no => 'No';

  @override
  String get deleteAllChatHistory => 'Eliminar Todo el Historial de Chat';

  @override
  String get loadingMessages => 'Cargando mensajes...';

  @override
  String get requestDenied => 'Solicitud Denegada';

  @override
  String get youHaveAlreadyDeclinedUserMessageRequest => 'Ya has declinado la solicitud de mensaje del usuario';

  @override
  String get youCanAcceptOrDenyUserMessageRequest => 'Puedes aceptar o rechazar la solicitud de mensaje del usuario.';

  @override
  String youWantToPurchaseThisStickerItWillCostYou(Object stickerFormattedPrice) {
    return '¿Deseas comprar este sticker? Costará $stickerFormattedPrice';
  }

  @override
  String get loading => 'Cargando...';

  @override
  String get showLikesNotifications => 'Mostrar Notificaciones de Me Gusta';

  @override
  String get settings => 'Configuración';

  @override
  String get selectLanguage => 'Seleccionar Idioma';

  @override
  String get french => 'Francés';

  @override
  String get english => 'Inglés';

  @override
  String sendGiftToLocalUserProfileItemName(Object localUserProfileItemName) {
    return 'Enviar Regalo a $localUserProfileItemName';
  }

  @override
  String get signIn => 'Iniciar Sesión';

  @override
  String get emailOrUsername => 'Correo Electrónico o Nombre de Usuario';

  @override
  String get login => 'Iniciar Sesión';

  @override
  String get forgotPassword => '¿Olvidaste tu Contraseña?';

  @override
  String get failedToInitialize => 'Error al Inicializar';

  @override
  String get goHome => 'Ir a Inicio';

  @override
  String get email => 'Correo Electrónico';

  @override
  String get iAcceptAllThe => 'Acepto todos los ';

  @override
  String get and => ' y ';

  @override
  String get termsConditions => 'términos y condiciones';

  @override
  String get privacyPolicy => 'política de privacidad';

  @override
  String get accountCreatedSuccessfully => 'Cuenta Creada Exitosamente';

  @override
  String get goToLoginNow => 'Ir a Iniciar Sesión Ahora';

  @override
  String get signInWithFacebook => 'Iniciar Sesión con Facebook';

  @override
  String get signInWithGoogle => 'Iniciar Sesión con Google';

  @override
  String get yourEmailAddress => 'Tu dirección de correo electrónico';

  @override
  String get sendEmailOtp => 'Enviar OTP por Correo Electrónico';

  @override
  String get emailOtp => 'OTP por Correo Electrónico';

  @override
  String get newPassword => 'Nueva Contraseña';

  @override
  String get confirmNewPassword => 'Confirmar Nueva Contraseña';

  @override
  String get submit => 'Enviar';
}
