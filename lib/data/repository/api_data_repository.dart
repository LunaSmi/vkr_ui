import 'package:vkr_ui/data/clients/auth_client.dart';
import 'package:vkr_ui/domain/models/login_request.dart';
import 'package:vkr_ui/domain/models/login_response.dart';
import 'package:vkr_ui/domain/models/user.dart';
import 'package:vkr_ui/domain/repository/api_repository.dart';

import '../../domain/models/refresh_token_request.dart';
import '../clients/api_client.dart';

class ApiDataRepository extends ApiRepository {
  final AuthClient _auth;
  final ApiClient _api;
  ApiDataRepository(this._auth,this._api);

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

  @override
  Future<User?> getUser() => _api.getUser();

  @override
  Future<LoginResponse?> refreshToken(String refreshToken) async =>
      await _auth.refreshToken(RefreshTokenRequest(
        refreshToken: refreshToken,
      ));
}