import 'dart:convert';
import '../model/Common_model.dart';
import '../data/config.dart';
import '../service/api_service.dart';

class CommonRepo {
  static APIService sendRequest(String url) {
    return APIService(
        url: Config.gsApiUrl + url,
        parse: (response) {
          final parsed = json.decode(response.body);
          final dataJson = CommonModel.fromJson(parsed);
          return dataJson;
        });
  }
}
