import 'dart:convert';
import '../data/config.dart';
import '../model/student_model.dart';
import '../service/api_service.dart';

class StudentRepo {
  static APIService sendRequest(String url) {
    return APIService(
        url: Config.gsApiUrl + url,
        parse: (response) {
          final parsed = json.decode(response.body);
          final dataJson = StudentModel.fromJson(parsed);
          return dataJson;
        });
  }
}
