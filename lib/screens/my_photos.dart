import 'dart:math';
import 'package:animations/animations.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../common/services/data_transport.dart' as data_transport;
import '../common/services/utils.dart';
import '../common/widgets/common.dart';
import 'user_common.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> requestStoragePermission() async {
  if (await Permission.storage.request().isGranted) {
    print("Storage permission granted");
  } else {
    print("Storage permission denied");
    throw Exception("Storage permission is required to pick files");
  }
}

class MyPhotosPage extends StatefulWidget {
  const MyPhotosPage({super.key});

  @override
  State<MyPhotosPage> createState() => _MyPhotosPageState();
}

class _MyPhotosPageState extends State<MyPhotosPage> {
  int present = 0;
  int totalCount = 0;
  String uploadedImageName = '';
  bool isLoading = true;
  List<Widget> photosItems = [];
  List photosItemIds = [];
  List photosData = [];

  @override
  void initState() {
    if (mounted) {
      data_transport.get('uploaded-photos').then((dataReceived) {
        if (mounted) {
          setState(() {
            photosData = getItemValue(dataReceived, 'data.userPhotos');
            isLoading = false;
          });
        }
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          mini: true,
          heroTag: 'myPhotosUpdate',
          child: const Icon(CupertinoIcons.cloud_upload),
          onPressed: () {
            pickAndUploadFile(context, 'upload-photos', allowMultiple: true,
                onStart: (imageSelected) {
              setState(() {
                uploadedImageName = imageSelected;
                isLoading = true;
              });
            }, onSuccess: (value, data) {
              setState(() {
                isLoading = false;
                uploadedImageName = data['data']['image_url'];
              });
            }, onError: (error) {
              setState(() {
                isLoading = false;
              });
            });
          }),
      body: (photosData.isNotEmpty
          ? LayoutBuilder(builder: (context, constraints) {
              return GridView.builder(
                shrinkWrap: true,
                itemCount: photosData.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  crossAxisCount: MediaQuery.of(context).size.width ~/ 180,
                ),
                itemBuilder: (BuildContext context, index) {
                  Map element = photosData[index];
                  if (element['image_url'] == '') {
                    return const Card(
                      color: Colors.transparent,
                      // alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: AppItemProgressIndicator(
                          size: 20,
                        ),
                      ),
                    );
                  } else {
                    return OpenContainer<bool>(
                      openColor: Theme.of(context).scaffoldBackgroundColor,
                      closedColor: Theme.of(context).scaffoldBackgroundColor,
                      transitionType: ContainerTransitionType.fade,
                      openBuilder:
                          (BuildContext _, VoidCallback openContainer) {
                        return ProfileImageView(
                          imageUrl: element['image_url'],
                        );
                      },
                      closedShape: const RoundedRectangleBorder(),
                      closedElevation: 0.0,
                      closedBuilder:
                          (BuildContext _, VoidCallback openContainer) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: AppCachedNetworkImage(
                                imageUrl: element['image_url'],
                                height: 220,
                              ),
                            ),
                            if ((element['is_processing'] != true))
                              Align(
                                alignment: Alignment.topRight,
                                child: TextButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                    ),
                                    onPressed: () {
                                      showActionableDialog(context,
                                          confirmActionText: 'Yes',
                                          cancelActionText: 'No',
                                          description: Text(context.lwTranslate
                                              .youWantToDeleteThisImage),
                                          onConfirm: (() {
                                        setState(() {
                                          photosData[index]['is_processing'] =
                                              true;
                                        });
                                        data_transport
                                            .post(
                                                element['_uid'] +
                                                    '/delete-photos',
                                                context: context)
                                            .then((dataReceived) {
                                          setState(() {
                                            photosData.removeWhere((item) {
                                              return item['_uid'] ==
                                                  getItemValue(dataReceived,
                                                      'data.photoUid');
                                            });
                                          });
                                        });
                                      }));
                                    },
                                    child: const Icon(
                                      CupertinoIcons.trash,
                                      size: 20,
                                    )),
                              ),
                            if (element['is_processing'] == true)
                              const SizedBox(
                                height: 150,
                                width: double.infinity,
                                child: AppItemProgressIndicator(
                                  size: 20,
                                ),
                              )
                          ]),
                        );
                      },
                    );
                  }
                },
              );
            })
          : Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isLoading)
                    const AppItemProgressIndicator()
                  else
                    Text(context.lwTranslate.thereAreNoResultsToShow),
                ],
              ),
            )),
    );
  }


  void pickAndUploadFile(context, url,
      {Function? onSuccess,
        Function? thenCallback,
        Function? onError,
        Function? onStart,
        FileType pickingType = FileType.image,
        bool allowMultiple = false,
        String? allowedExtensions = ''}) async {
    try {
      print("Start picking files");

      // اختيار الصور باستخدام ImagePicker
      final ImagePicker picker = ImagePicker();
      XFile? pickedFile;

      if (pickingType == FileType.image) {
        pickedFile = await picker.pickImage(
          source: ImageSource.gallery, // يمكن تغييره إلى الكاميرا
        );
      } else {
        throw Exception('Unsupported FileType: Only image files are supported');
      }

      if (pickedFile == null) {
        print("No file selected");
        setState(() {
          isLoading = false;
        });
        return;
      }

      String uploadedImageName = pickedFile.path;
      print("Selected file path: $uploadedImageName");

      if (uploadedImageName.isEmpty) {
        print("No file path provided");
        setState(() {
          isLoading = false;
        });
        return;
      }

      if (onStart != null) {
        onStart(uploadedImageName);
      }

      // blank loader container
      var randomNumberId = Random().nextInt(99999);
      photosData.add({'image_url': '', 'randomNumberId': randomNumberId});

      data_transport.uploadFile(uploadedImageName, url, context: context,
          onError: (error) {
            setState(() {
              photosData.removeWhere((item) => item['image_url'] == '');
            });
            if (onError != null) {
              onError(error);
            }
          }, thenCallback: (data) {
            if (getItemValue(data, 'reaction') != 1) {
              setState(() {
                photosData.removeWhere((item) => item['image_url'] == '');
              });
            }
            if (thenCallback != null) {
              thenCallback(data);
            }
          }, onSuccess: (data) {
            setState(() {
              // remove loading container
              photosData
                  .removeWhere((item) => item['randomNumberId'] == randomNumberId);
              photosData.add(data?['data']['stored_photo']);
            });
          });
    } on PlatformException catch (e) {
      print("PlatformException occurred: $e");
      setState(() {
        photosData.removeWhere((item) => item['image_url'] == '');
        isLoading = false;
      });
      if (onError != null) {
        onError(e);
      }
      showToastMessage(context, context.lwTranslate.failed, type: 'error');
    } catch (e) {
      print("Error occurred: $e");
      setState(() {
        isLoading = false;
      });
      if (onError != null) {
        onError(e);
      }
      showToastMessage(context, context.lwTranslate.failed, type: 'error');
    }}
}
