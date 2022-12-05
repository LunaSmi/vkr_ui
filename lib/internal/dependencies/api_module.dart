import 'package:vkr_ui/data/clients/auth_client.dart';
import 'package:dio/dio.dart';

String baseUrl = "http://192.168.1.208:5050/";

class ApiModule {
  static AuthClient? _authClient;

  static AuthClient auth() =>
      _authClient ??
      AuthClient(
        Dio(),
        baseUrl: baseUrl,
      );
}