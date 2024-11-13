import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get welcome => 'O aplicativo de namoro tão esperado chegou!';

  @override
  String get welcomeSmallMessage => 'Namorar não precisa ser difícil.';

  @override
  String get letsGo => 'Vamos lá';

  @override
  String get menuFeaturedUsers => 'Usuários em Destaque';

  @override
  String get menuRandomUsers => 'Usuários Aleatórios';

  @override
  String get menuOnlineUsers => 'Usuários Online';

  @override
  String get menuNewestUsers => 'Usuários Mais Recentes';

  @override
  String get menuNearestUsers => 'Usuários Mais Próximos';

  @override
  String get menuCreditWallet => 'Carteira de Créditos';

  @override
  String get menuWhoLikesMe => 'Quem gosta de mim';

  @override
  String get menuMutualLikes => 'Curtidas Mútuas';

  @override
  String get menuMyLikes => 'Minhas Curtidas';

  @override
  String get menuMyDislikes => 'Minhas Descurtidas';

  @override
  String get menuVisitors => 'Visitantes';

  @override
  String get menuBlockedUsers => 'Usuários Bloqueados';

  @override
  String get menuChangePassword => 'Alterar Senha';

  @override
  String get menuChangeEmail => 'Alterar E-mail';

  @override
  String get menuSettings => 'Configurações';

  @override
  String get menuLogout => 'Sair';

  @override
  String get areYouSure => 'Você tem certeza?';

  @override
  String get profilePhoto => 'Foto do Perfil';

  @override
  String get uploadNewPhotos => 'Carregar Foto do Perfil';

  @override
  String get helloWorld => 'Olá Mundo!';

  @override
  String get bePremium => 'Seja Premium';

  @override
  String get aboutUs => 'Sobre nós';

  @override
  String get version => 'Versão';

  @override
  String get boostMyProfile => 'Impulsionar meu Perfil';

  @override
  String get yourProfileIsBoostedFor => 'Seu perfil está impulsionado por';

  @override
  String byBoostingYourProfileYouWillBeAPartOf(Object booster_price, Object booster_period) {
    return 'Ao impulsionar seu perfil, você fará parte dos usuários em destaque e receberá prioridade nas pesquisas e nos usuários aleatórios. Custa $booster_price créditos por $booster_period minutos imediatamente';
  }

  @override
  String get boostAgain => 'Impulsionar novamente';

  @override
  String get buyCredits => 'Comprar Créditos';

  @override
  String get yourDailyLimitForEncountersMayExceedOrThereAre => 'Seu limite diário para encontros pode ter sido excedido ou não há usuários para mostrar.';

  @override
  String get find => 'Encontrar';

  @override
  String get myProfile => 'Meu Perfil';

  @override
  String get encounter => 'Encontro';

  @override
  String get myPhotos => 'Minhas Fotos';

  @override
  String get messenger => 'Mensageiro';

  @override
  String get register => 'Registrar';

  @override
  String get youWantToDeleteThisImage => 'Você quer deletar esta imagem?';

  @override
  String get thereAreNoResultsToShow => 'Não há resultados para mostrar.';

  @override
  String get failed => 'Falhou';

  @override
  String get notifications => 'Notificações';

  @override
  String get noResultFound => 'Nenhum resultado encontrado';

  @override
  String get endOfResult => 'Fim dos resultados';

  @override
  String get premium => 'Premium';

  @override
  String get youArePremiumUser => 'Você é um usuário Premium';

  @override
  String get premiumMembershipExpiry => 'Expiração da Assinatura Premium';

  @override
  String itemPriceCredits(Object price) {
    return '$price Créditos';
  }

  @override
  String get selectPlan => 'Selecionar Plano';

  @override
  String get pleaseSelectAPlan => 'Por favor, selecione um plano';

  @override
  String get ok => 'OK';

  @override
  String get extendPremiumMembership => 'Estender Assinatura Premium';

  @override
  String get bePremiumNow => 'Seja Premium agora';

  @override
  String get gift => 'Presente';

  @override
  String get sendAGift => 'Enviar um Presente';

  @override
  String get privately => 'Privadamente';

  @override
  String get send => 'Enviar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get reportAbuse => 'Denunciar Abuso';

  @override
  String get block => 'Bloquear';

  @override
  String get userBlocked => 'Usuário Bloqueado';

  @override
  String get unblock => 'Desbloquear';

  @override
  String get totalLikes => 'Total de Curtidas';

  @override
  String get totalViews => 'Total de Visualizações';

  @override
  String get aboutMe => 'Sobre Mim';

  @override
  String get gender => 'Gênero';

  @override
  String get preferredLanguage => 'Língua Preferida';

  @override
  String get relationshipStatus => 'Estado Civil';

  @override
  String get education => 'Educação';

  @override
  String get mobileNumber => 'Número de Celular';

  @override
  String get location => 'Localização';

  @override
  String get workStatus => 'Status de Trabalho';

  @override
  String get birthday => 'Aniversário';

  @override
  String get updatePhoto => 'Atualizar Foto';

  @override
  String get profileCoverPhoto => 'Foto de Capa do Perfil';

  @override
  String get myProfileUpdate => 'Atualização do Meu Perfil';

  @override
  String get basicInformation => 'Informações Básicas';

  @override
  String get selectCountryCode => 'Selecionar Código do País';

  @override
  String get firstName => 'Primeiro Nome';

  @override
  String get lastName => 'Sobrenome';

  @override
  String get language => 'Idioma';

  @override
  String get countryPhoneCode => 'Código de Telefone do País';

  @override
  String errorError(Object error) {
    return 'Erro: $error';
  }

  @override
  String get yourBasicInformationFormWillComeHere => 'Seu formulário de informações básicas aparecerá aqui';

  @override
  String get purchaseCredits => 'Comprar Créditos';

  @override
  String get tryingToConnect => 'Tentando Conectar...';

  @override
  String get notConnected => 'Não Conectado';

  @override
  String get fetchingProducts => 'Buscando Produtos...';

  @override
  String get creditPackages => 'Pacotes de Créditos';

  @override
  String notFoundedProductsNotFound(Object notFoundedProducts) {
    return '$notFoundedProducts não encontrados';
  }

  @override
  String get packageNotFound => 'Pacote não encontrado';

  @override
  String creditsCredits(Object credits) {
    return '$credits Créditos';
  }

  @override
  String get fetchingConsumables => 'Buscando Consumíveis...';

  @override
  String get thisIsAPremiumFeatureToViewThisYouNeed => 'Esta é uma função Premium, para visualizá-la, você precisa primeiro comprar um plano Premium.';

  @override
  String get all => 'Todos';

  @override
  String get basic => 'Básico';

  @override
  String get name => 'Nome';

  @override
  String get username => 'Nome de Usuário';

  @override
  String get lookingFor => 'Procurando por';

  @override
  String get minimumAge => 'Idade Mínima';

  @override
  String get maximumAge => 'Idade Máxima';

  @override
  String distanceFromMyLocationDistanceUnit(Object distanceUnit) {
    return 'Distância da minha localização ($distanceUnit)';
  }

  @override
  String get personal => 'Pessoal';

  @override
  String get minimumHeight => 'Altura Mínima';

  @override
  String get maximumHeight => 'Altura Máxima';

  @override
  String get apply => 'Aplicar';

  @override
  String get home => 'Início';

  @override
  String get myCreditWallet => 'Minha Carteira de Créditos';

  @override
  String get buyMoreCredits => 'Comprar Mais Créditos';

  @override
  String get yourWalletBalance => 'Seu Saldo na Carteira';

  @override
  String walletBalanceCredits(int walletBalance) {
    return '$walletBalance Créditos';
  }

  @override
  String get financialTransaction => 'Transação Financeira';

  @override
  String get transaction => 'Transação';

  @override
  String get on => 'em';

  @override
  String get paymentMethod => 'Método de Pagamento';

  @override
  String get abuseReport => 'Relatório de Abuso';

  @override
  String get userHasBeenReportedSuccessfully => 'Usuário foi denunciado com sucesso';

  @override
  String get report => 'Relatar';

  @override
  String get reason => 'Razão';

  @override
  String get reportUser => 'Denunciar Usuário';

  @override
  String get goBack => 'Voltar';

  @override
  String get changeEmail => 'Alterar E-mail';

  @override
  String get activateYourNewEmailAddress => 'Ative seu novo endereço de e-mail';

  @override
  String get almostFinishedYouNeedToConfirmYourEmailAddressTo => 'Quase pronto... Você precisa confirmar seu endereço de e-mail. Para completar o processo de ativação, por favor, clique no link no e-mail que acabamos de enviar.';

  @override
  String get currentEmail => 'E-mail Atual';

  @override
  String get newEmail => 'Novo E-mail';

  @override
  String get password => 'Senha';

  @override
  String get changePassword => 'Alterar Senha';

  @override
  String get showVisitorNotifications => 'Mostrar Notificações de Visitantes';

  @override
  String get showGiftsNotifications => 'Mostrar Notificações de Presentes';

  @override
  String get showMessagesNotifications => 'Mostrar Notificações de Mensagens';

  @override
  String get showLoginNotificationsForYourLikedUsers => 'Mostrar Notificações de Login para Usuários que Você Curtiu';

  @override
  String get displayMobileNumber => 'Mostrar Número de Celular';

  @override
  String get updateSettings => 'Atualizar Configurações';

  @override
  String get allContentIncludingPhotosAndOtherDataWillBePermanently => 'Todo o conteúdo, incluindo fotos e outros dados, será permanentemente excluído!';

  @override
  String get confirmPassword => 'Confirmar Senha';

  @override
  String get yesDelete => 'Sim, Excluir';

  @override
  String get deleteAccount => 'Excluir Conta';

  @override
  String get alert => 'Alerta';

  @override
  String get error => 'Erro...';

  @override
  String get doYouWantToDeleteAllTheChatMessageOf => 'Você quer deletar todas as mensagens de chat deste usuário?';

  @override
  String get yes => 'Sim';

  @override
  String get no => 'Não';

  @override
  String get deleteAllChatHistory => 'Excluir Todo o Histórico de Chat';

  @override
  String get loadingMessages => 'Carregando Mensagens...';

  @override
  String get requestDenied => 'Pedido Negado';

  @override
  String get youHaveAlreadyDeclinedUserMessageRequest => 'Você já recusou a solicitação de mensagem deste usuário';

  @override
  String get youCanAcceptOrDenyUserMessageRequest => 'Você pode aceitar ou recusar a solicitação de mensagem deste usuário.';

  @override
  String youWantToPurchaseThisStickerItWillCostYou(Object stickerFormattedPrice) {
    return 'Você quer comprar este adesivo? Vai custar $stickerFormattedPrice';
  }

  @override
  String get loading => 'Carregando...';

  @override
  String get showLikesNotifications => 'Mostrar Notificações de Curtidas';

  @override
  String get settings => 'Configurações';

  @override
  String get selectLanguage => 'Selecionar Idioma';

  @override
  String get french => 'Francês';

  @override
  String get english => 'Inglês';

  @override
  String sendGiftToLocalUserProfileItemName(Object localUserProfileItemName) {
    return 'Enviar presente para $localUserProfileItemName';
  }

  @override
  String get signIn => 'Entrar';

  @override
  String get emailOrUsername => 'E-mail ou Nome de Usuário';

  @override
  String get login => 'Login';

  @override
  String get forgotPassword => 'Esqueceu a Senha?';

  @override
  String get failedToInitialize => 'Falha na Inicialização';

  @override
  String get goHome => 'IR PARA INÍCIO';

  @override
  String get email => 'E-mail';

  @override
  String get iAcceptAllThe => 'Eu aceito todos os ';

  @override
  String get and => ' e ';

  @override
  String get termsConditions => 'Termos e Condições';

  @override
  String get privacyPolicy => 'Política de Privacidade';

  @override
  String get accountCreatedSuccessfully => 'Conta criada com sucesso';

  @override
  String get goToLoginNow => 'Ir para Login agora';

  @override
  String get signInWithFacebook => 'Entrar com Facebook';

  @override
  String get signInWithGoogle => 'Entrar com Google';

  @override
  String get yourEmailAddress => 'Seu Endereço de E-mail';

  @override
  String get sendEmailOtp => 'Enviar OTP por E-mail';

  @override
  String get emailOtp => 'OTP por E-mail';

  @override
  String get newPassword => 'Nova Senha';

  @override
  String get confirmNewPassword => 'Confirmar Nova Senha';

  @override
  String get submit => 'Enviar';
}
