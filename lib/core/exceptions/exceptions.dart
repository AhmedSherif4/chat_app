import 'package:chat/config/resources/app_strings.dart';
import 'package:equatable/equatable.dart';

import '../api/network_info.dart';
import '../services/services_locator.dart';

class ServerException extends Equatable implements Exception {
  final String message;

  const ServerException({required this.message});

  @override
  List<Object?> get props => [message];
}

class NoInternetConnectionException extends ServerException {
  const NoInternetConnectionException()
      : super(message: AppStrings.noInternetConnection);

  Future<void> checkNetworkConnection() async {
    if (!await getIt<NetworkInfo>().isConnected) {
      throw this;
    }
  }
}
