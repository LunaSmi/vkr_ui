import 'dart:io';
import 'package:dio/dio.dart';
import 'package:vkr_ui/internal/config/shared_prefs.dart';
import 'package:vkr_ui/internal/config/token_storage.dart';
import '../../domain/repository/api_repository.dart';
import '../../internal/dependencies/repository_module.dart';



class AuthService {
  final ApiRepository _api = RepositoryModule.apiRepository();
  
  Future auth(String? login, String? password) async {
    if (login != null && password != null) {
      try{
        var token = await _api.getToken(login: login, password: password);
        if(token !=null){
          await TokenStorage.setStoredToken(token);
          var user = await _api.getUser();
          if (user != null) {
            SharedPrefs.setStoredUser(user);
          }
        }
      } on DioError catch (e) {
        if (e.error is SocketException){
          throw NoNetworkException();
        }
        else if (<int>[401].contains(e.response?.statusCode)) {
          throw WrongCredentionalException();
        }
        else if (<int>[500].contains(e.response?.statusCode)) {
          throw ServerException();
        }

      }
    }
  }

  Future<bool> checkAuth() async {
     return ((await TokenStorage.getAccessToken()) != null &&
        (await SharedPrefs.getStoredUser()) != null);
  }

  Future logout() async {
    await TokenStorage.setStoredToken(null);
  }

  Future<bool> tryGetUser() async {
    try {
      var user = await _api.getUser();
      return true;
    } catch (e) {
      return false;
    }
  }
}

class WrongCredentionalException implements Exception {}
class NoNetworkException implements Exception {}
class ServerException implements Exception {}