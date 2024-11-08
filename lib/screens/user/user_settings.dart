import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:progress_loading_button/progress_loading_button.dart';
import 'package:form_validator/form_validator.dart';
import '../../common/services/auth.dart' as auth;
import '../../common/services/locale_model.dart';
import '../../common/services/utils.dart';
import '../../common/widgets/common.dart';
import '../../common/widgets/form_fields.dart';
import '../../common/services/data_transport.dart' as data_transport;
import '../../support/app_locales.dart';
import '../../support/app_theme.dart' as app_theme;
import '../landing.dart';

class UserSettingsPage extends StatefulWidget {
  const UserSettingsPage({
    super.key,
  });
  @override
  State<UserSettingsPage> createState() => _UserSettingsPageState();
}

class _UserSettingsPageState extends State<UserSettingsPage> {
  final _formKey = GlobalKey<FormState>();
  bool isLoadingInProcess = true;
  Map mobileNumberOptions = {};
  Map<String, dynamic> formInputData = {};
  Map<String, dynamic> accountDeleteInputData = {};
  List<DropdownMenuItem<String>> localesDropdownItems =
      <DropdownMenuItem<String>>[];
  String selectedLocale = getCurrentLocale().toString();

  @override
  initState() {
    data_transport.get(
      'notification/get-setting-data',
      onSuccess: (responseData) {
        setState(() {
          formInputData = getItemValue(responseData, 'data.userSettingData');
          mobileNumberOptions = getItemValue(responseData,
              'data.userSettingData.user_choice_display_mobile_number');
          isLoadingInProcess = false;
        });
      },
    );

    if (appLocales.isNotEmpty) {
      for (var element in appLocales) {
        localesDropdownItems.add(
          DropdownMenuItem(
            value: element['code'],
            child: Text(element['name']),
          ),
        );
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBarWidget(
        context: context,
        title: context.lwTranslate.settings,
        actionWidgets: [],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 32,
          right: 32,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        Text(context.lwTranslate.selectLanguage),
                        Consumer<LocaleModel>(
                          builder: (context, localeModel, child) =>
                              DropdownButton(
                            isExpanded: true,
                            value: selectedLocale,
                            items: localesDropdownItems,
                            onChanged: (String? value) {
                              if (value != null) {
                                localeModel.set(Locale(value));
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LandingPage()),
                                    (route) => false);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isLoadingInProcess) const AppItemProgressIndicator(),
                  if (!isLoadingInProcess)
                    Column(
                      children: [
                        StatefulBuilder(builder: (context, setState) {
                          return Column(
                            children: [
                              CheckboxListTile(
                                  title: Text(context
                                      .lwTranslate.showVisitorNotifications),
                                  activeColor: Theme.of(context).primaryColor,
                                  value: formInputData[
                                      'show_visitor_notification'],
                                  onChanged: (bool? value) {
                                    setState(
                                      () {
                                        formInputData[
                                                'show_visitor_notification'] =
                                            value;
                                      },
                                    );
                                  }),
                              CheckboxListTile(
                                  title: Text(context
                                      .lwTranslate.showLikesNotifications),
                                  activeColor: Theme.of(context).primaryColor,
                                  value:
                                      formInputData['show_like_notification'],
                                  onChanged: (bool? value) {
                                    setState(
                                      () {
                                        formInputData[
                                            'show_like_notification'] = value;
                                      },
                                    );
                                  }),
                              CheckboxListTile(
                                  title: Text(context
                                      .lwTranslate.showGiftsNotifications),
                                  activeColor: Theme.of(context).primaryColor,
                                  value:
                                      formInputData['show_gift_notification'],
                                  onChanged: (bool? value) {
                                    setState(
                                      () {
                                        formInputData[
                                            'show_gift_notification'] = value;
                                      },
                                    );
                                  }),
                              CheckboxListTile(
                                  title: Text(context
                                      .lwTranslate.showMessagesNotifications),
                                  activeColor: Theme.of(context).primaryColor,
                                  value: formInputData[
                                      'show_message_notification'],
                                  onChanged: (bool? value) {
                                    setState(
                                      () {
                                        formInputData[
                                                'show_message_notification'] =
                                            value;
                                      },
                                    );
                                  }),
                              CheckboxListTile(
                                  title: Text(context.lwTranslate
                                      .showLoginNotificationsForYourLikedUsers),
                                  activeColor: Theme.of(context).primaryColor,
                                  value: formInputData[
                                      'show_user_login_notification'],
                                  onChanged: (bool? value) {
                                    setState(
                                      () {
                                        formInputData[
                                                'show_user_login_notification'] =
                                            value;
                                      },
                                    );
                                  }),
                            ],
                          );
                        }),
                        if (mobileNumberOptions.isNotEmpty)
                          SelectField(
                            value: formInputData['display_user_mobile_number']
                                .toString(),
                            listItems: mobileNumberOptions,
                            labelText: context.lwTranslate.displayMobileNumber,
                            onChanged: (String? value) {
                              formInputData['display_user_mobile_number'] =
                                  value.toString();
                            },
                          ),
                        const Divider(
                          thickness: 0.1,
                          height: 80,
                        ),
                        LoadingButton(
                          defaultWidget: Text(
                            context.lwTranslate.updateSettings,
                          ),
                          color: app_theme.white,
                          onPressed: () async {
                            // Validate returns true if the form is valid, or false otherwise.
                            _formKey.currentState?.save();
                            if (_formKey.currentState!.validate()) {
                              await data_transport.post(
                                'notification/user-setting-store',
                                inputData: formInputData,
                                context: context,
                                onSuccess: (responseData) {},
                                onFailed: (responseData) {},
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          foregroundColor: app_theme.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          context.lwTranslate.goBack,
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 0.1,
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          foregroundColor: app_theme.white,
                          backgroundColor: app_theme.error,
                        ),
                        onPressed: () {
                          showActionableDialog(
                            context,
                            title: 'Delete Account',
                            description: Column(
                              children: [
                                Text(
                                  context.lwTranslate
                                      .allContentIncludingPhotosAndOtherDataWillBePermanently,
                                ),
                                InputField(
                                  labelText:
                                      context.lwTranslate.confirmPassword,
                                  password: true,
                                  onChanged: (String? value) {
                                    accountDeleteInputData['password'] = value;
                                  },
                                  validation:
                                      ValidationBuilder().minLength(3).build(),
                                ),
                              ],
                            ),
                            confirmActionText: context.lwTranslate.yesDelete,
                            cancelActionText: context.lwTranslate.cancel,
                            onConfirm: () {
                              if ((accountDeleteInputData['password'] == '') ||
                                  (accountDeleteInputData['password'] ==
                                      null)) {
                                return false;
                              }

                              data_transport.post(
                                'delete-account',
                                inputData: accountDeleteInputData,
                                secured: true,
                                onFailed: (responseData) {
                                  setState(() {
                                    accountDeleteInputData['password'] = '';
                                  });
                                  showErrorMessage(
                                    context,
                                    getItemValue(responseData, 'data.message'),
                                  );
                                },
                                onSuccess: (responseData) {
                                  data_transport.post(
                                    'user/logout',
                                  );
                                  showSuccessMessage(
                                      context,
                                      getItemValue(
                                          responseData, 'data.message'));
                                  auth.logout().then((response) {
                                    auth.redirectIfUnauthenticated(context);
                                  });
                                },
                              );
                            },
                          );
                        },
                        child: Text(
                          context.lwTranslate.deleteAccount,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
