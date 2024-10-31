import 'package:equatable/equatable.dart';

class AppVersionModel extends Equatable {
  final int appVersion;
  final bool appRepairing;
  final bool appRequiredUpdate;
  final bool appHaveUpdate;
  final bool enablePurchase;
  final String androidLink;
  final String iosLink;

  final bool isReview;
  final bool inReview2;
  final bool enableNafees;
  final bool invitationStatus;

  const AppVersionModel({
    required this.appVersion,
    required this.androidLink,
    required this.iosLink,
    required this.isReview,
    required this.inReview2,
    required this.appRepairing,
    required this.appRequiredUpdate,
    required this.appHaveUpdate,
    required this.enablePurchase,
    required this.enableNafees,
    required this.invitationStatus,
  });

  factory AppVersionModel.fromJson(Map<String, dynamic> json) {
    return AppVersionModel(
      appVersion: int.tryParse(json['version']) ?? 1,
      androidLink: json['apk_url'],
      iosLink: json['ios_url'],
      isReview: json['is_review'] == 0 ? false : true,
      inReview2: json['is_review2'] == 0 ? false : true,
      appRepairing: json['app_repairing'] == 0 ? false : true,
      appRequiredUpdate: json['app_required_update'] == 0 ? false : true,
      appHaveUpdate: json['app_have_update'] == 0 ? false : true,
      enablePurchase: json['enable_purchase'] == 0 ? false : true,
      enableNafees: json['enable_nafees'] == 0 ? false : true,
      invitationStatus: json['invitation_status'] == 0 ? false : true,

    );
  }

  @override
  List<Object> get props => [
        appVersion,
        appRepairing,
        appRequiredUpdate,
        appHaveUpdate,
        enablePurchase,
        androidLink,
        iosLink,
        isReview,
        inReview2,
        enableNafees,
        invitationStatus,
      ];
}


class InfoModel extends Equatable {
  final bool splashView;
  final String androidLink;
  final String iosLink;
  final String apkVersion;
  final String iosVersion;



  const InfoModel({
    required this.androidLink,
    required this.iosLink,
    required this.apkVersion,
    required this.iosVersion,
    required this.splashView,
  });

  factory InfoModel.fromJson(Map<String, dynamic> json) {
    return InfoModel(
      androidLink: json['apk_url'],
      iosLink: json['ios_url'],
      apkVersion: json['apk_version'],
      iosVersion: json['ios_version'],
      splashView: json['splash_view']== 0 ? false : true,
    );
  }

  @override
  List<Object> get props => [
    androidLink,
    iosLink,
    apkVersion,
    iosVersion,
    splashView,
  ];
}
