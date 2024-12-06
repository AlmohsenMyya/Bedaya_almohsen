import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'data_transport.dart' as data_transport;
import 'utils.dart';

typedef OnCallbackType = Function? Function(Map<String, dynamic>? responseData);

class UploadService {
  void pickAndUploadFile(context, url,
      {OnCallbackType? onSuccess,
        OnCallbackType? thenCallback,
        Function? onError,
        Function? onStart,
        FileType pickingType = FileType.image,
        bool allowMultiple = false,
        String? allowedExtensions = ''}) async
  {
    try {
      final ImagePicker picker = ImagePicker();
      XFile? pickedFile;

      if (pickingType == FileType.image) {
        pickedFile = await picker.pickImage(
          source: ImageSource.gallery,
        );
      } else {
        throw Exception('Unsupported FileType: Only image files are supported');
      }

      if (pickedFile == null) {
        return;
      }

      String uploadedImageName = pickedFile.path;
      if (onStart != null) {
        onStart(uploadedImageName);
      }
      data_transport.uploadFile(
        uploadedImageName,
        url,
        context: context,
        onSuccess: (responseData) {
          onSuccess!(responseData);
          return;
        },
        onError: onError,
        thenCallback: (responseData) {
          thenCallback!(responseData);
          return;
        },
      );
    } on PlatformException catch (e) {
      if (onError != null) {
        onError(e);
      }
      pr('Unsupported operation ${e.toString()}');
      showToastMessage(context, 'Failed', type: 'error');
    } catch (e) {
      pr(e.toString());
      if (onError != null) {
        onError(e);
      }
      showToastMessage(context, 'Failed', type: 'error');
    }
  }
}
