import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../common/services/auth.dart';
import '../common/widgets/upload.dart';
import './../common/services/auth.dart' as auth;
import '../common/services/utils.dart';

class ProfileImageUpdatePage extends StatelessWidget {
  const ProfileImageUpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.lwTranslate.updatePhoto),
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: const Icon(
            CupertinoIcons.back,
            size: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            UploadWidget(
              label: context.lwTranslate.profilePhoto,
              uploadUrl: 'upload-profile-image',
              placeholderNetworkImage: auth.getAuthInfo('profile_picture_url'),
              buttonLabel: 'Upload New Profile Photo',
              onSuccess: (data) {
                auth.setUserInfo(
                    'profile_picture_url', data['data']['image_url']);
              },
            ),
            UploadWidget(
                label: context.lwTranslate.profileCoverPhoto,
                uploadUrl: 'upload-cover-image',
                placeholderNetworkImage: getAuthInfo('cover_picture_url'),
                buttonLabel: 'Upload New Cover Photo',
                onSuccess: (data) {
                  auth.setUserInfo(
                      'cover_picture_url', data['data']['image_url']);
                }),
          ],
        ),
      ),
    );
  }
}
