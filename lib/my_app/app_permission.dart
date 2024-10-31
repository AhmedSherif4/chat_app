import 'package:permission_handler/permission_handler.dart';

class AppPermissions {
  AppPermissions._privateConstructor();

  static final AppPermissions _instance = AppPermissions._privateConstructor();

  factory AppPermissions() {
    return _instance;
  }

  static const photosPermission =  Permission.photos;

  static Future<PermissionStatus> photosPermissionRequest() async {
    return await photosPermission.request();
  }

  static Future<bool> photosPermissionStatus() async {
    if(await photosPermission.isGranted){
      return true;
    }else{
      return false;
    }
  }

  static const storagePermission =  Permission.storage;

  static Future<PermissionStatus> storagePermissionRequest() async {
    return await storagePermission.request();
  }

  static Future<bool> storagePermissionStatus() async {
    if(await storagePermission.isGranted){
      return true;
    }else{
      return false;
    }
  }

  static const cameraPermission =  Permission.camera;

  static Future<PermissionStatus> cameraPermissionRequest() async {
    return await cameraPermission.request();
  }

  static Future<bool> cameraPermissionStatus() async {
    if(await cameraPermission.isGranted){
      return true;
    }else{
      return false;
    }
  }

}
