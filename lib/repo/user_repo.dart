import 'dart:convert';
import '../data/config.dart';
import '../model/user_model.dart';
import '../service/api_service.dart';

class UserRepo {
  static APIService sendRequest(String url) {
    return APIService(
        url: Config.gsApiUrl + url,
        parse: (response) {
          final parsed = json.decode(response.body);
          final dataJson = UserModel.fromJson(parsed);
          return dataJson;
        });
  }
}
