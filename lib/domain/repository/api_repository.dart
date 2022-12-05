import '../models/login_response.dart';

abstract class ApiRepository {
  Future<LoginResponse?> getToken(
      {required String login, required String password});
}