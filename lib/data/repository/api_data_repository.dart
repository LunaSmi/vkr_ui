import 'package:vkr_ui/data/clients/auth_client.dart';
import 'package:vkr_ui/domain/models/login_request.dart';
import 'package:vkr_ui/domain/models/login_response.dart';
import 'package:vkr_ui/domain/repository/api_repository.dart';

class ApiDataRepository extends ApiRepository {
  final AuthClient _auth;
  ApiDataRepository(this._auth);

  @override
  Future<LoginResponse?> getToken({
    required String login,
    required String password,
  }) async {
    return await _auth.getToken(LoginRequest(
      login: login,
      password: password,
    ));
  }
}