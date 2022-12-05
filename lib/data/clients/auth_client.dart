import 'package:vkr_ui/domain/models/login_request.dart';
import 'package:vkr_ui/domain/models/login_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_client.g.dart';

@RestApi()
abstract class AuthClient {
  factory AuthClient(Dio dio, {String? baseUrl}) = _AuthClient;

  @POST("/api/Auth/Login")
  Future<LoginResponse?> getToken(@Body() LoginRequest body);

}