import 'package:vkr_ui/domain/models/user.dart';
import '../models/login_response.dart';

abstract class ApiRepository {
  Future<LoginResponse?> getToken(
      {required String login, required String password});

  Future<User?> getUser();

  Future<LoginResponse?> refreshToken(String refreshToken);
  
}