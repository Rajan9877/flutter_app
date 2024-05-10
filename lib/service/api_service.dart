import 'dart:async';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import '../data/config.dart';
import 'dart:convert';
import 'dart:io';
import '../data/session.dart';
import 'data.dart';

class APIService {
  final String url;
  Function(http.Response response) parse;
  APIService({required this.url, required this.parse});
}

class APIWeb {
  Session session = Session();
  Future getData(APIService resource) async {
    final response = await http.get(Uri.parse(resource.url));
    print("STATUS: " + response.statusCode.toString());
    if (response.statusCode == 200) {
      return resource.parse(response);
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future postData(APIService resource, String body) async {
    final username = Config.gsApiKey;
    final password = Config.gsApiPassword;
    final credentials = '$username:$password';
    final stringToBase64 = utf8.fuse(base64);
    final encodedCredentials = stringToBase64.encode(credentials);
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json", // or whatever
      HttpHeaders.authorizationHeader: "Basic $encodedCredentials",
    };
    print(resource.url);
    print(body);
    final response =
        await http.post(Uri.parse(resource.url), headers: headers, body: body);
    print("BODY: " + response.body);
    if (response.statusCode == 200) {
      return resource.parse(response);
    } else {
      print(response.body);
      throw Exception('Failed to load data!');
    }
  }

  postDataMultipart(
      String url, List<FileParams> files, List<DataParams> params) async {
    //postDataMultipartOld(url, files, params);

    Dio dio = Dio();
    // List uploadList = [];
    var formData = FormData();

    params.forEach((param) {
      formData.fields.add(MapEntry(param.label, param.value));
    });
    files.forEach((file) async {
      formData.files.add(MapEntry(
          file.fileName,
          await MultipartFile.fromFile(file.file.path,
              filename: file.file.path.split("/").last)));
    });

    final username = Config.gsApiKey;
    final password = Config.gsApiPassword;
    final credentials = '$username:$password';
    final stringToBase64 = utf8.fuse(base64);

    final encodedCredentials = stringToBase64.encode(credentials);
    Map<String, String> headers = {
      HttpHeaders.authorizationHeader: "Basic $encodedCredentials",
      "Content-Type": "multipart/form-data",
      "Connection": "Keep-Alive"
    };

    var response = await dio.post(Config.gsApiUrl + url,
        data: formData,
        options: Options(headers: headers),
        queryParameters: {
          'user_id': session.getUserID(),
          'app_token': session.getAppToken()
        }, onSendProgress: (int sent, int total) {
      final progress = sent / total;
      print('progress: $progress ($sent/$total)');
    });
    print(response);
    if (response.statusCode == 200) {
      return response;
    } else {
      print(response.statusCode);
      print(response.statusMessage);
      throw Exception('Failed to load data!');
    }

    /*
    final username = Config.gsApiKey;
    final password = Config.gsApiPassword;
    final credentials = '$username:$password';
    final stringToBase64 = utf8.fuse(base64);


    final encodedCredentials = stringToBase64.encode(credentials);
    Map<String, String> headers = {
      HttpHeaders.authorizationHeader: "Basic $encodedCredentials",
      "Content-Type": "multipart/form-data",
      "Connection": "Keep-Alive"
    };
    print(Uri.parse(Config.gsApiUrl+ url));

    final dio = Dio(BaseOptions(
      baseUrl: Config.gsApiUrl+ url,
      headers: headers,
    ));
    final uploader = ChunkedUploader(dio);

      final response = await uploader.uploadUsingFilePath(
        method: "POST",
        fileKey: 'file',
        fileName: files[0].fileName,
        filePath: files[0].file.path,
        maxChunkSize: 2000000,
        data: {
          'name': files[0].file.path.split("/").last
        },
        path: Config.gsApiUrl+ "upload_chunk_file.php",
        onUploadProgress: (progress) => print(progress),
      );

print(response);

    http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse(Config.gsApiUrl+ url));
    request.headers.addAll(headers);
    if(files.length>0){
      files.forEach((file){
        print(file.fileName + "  " + file.file.readAsBytes().asStream().toString());
        request.files.add(
            http.MultipartFile(
              file.fileName,
              file.file.readAsBytes().asStream(),
              file.file.lengthSync(),
              filename: file.file.path.split("/").last,
            )
        );

        print("Added");
      });
    }


    params.forEach((param){
      request.fields[param.label] = param.value;
    });

    print(request.fields.toString());

    http.StreamedResponse response = await request.send();
    print(response.toString());
    if (response.statusCode == 200) {
      return response;
    } else {
      print(response.statusCode);
      print(response.reasonPhrase);
      throw Exception('Failed to load data!');
    }

     */
  }

  Future<http.StreamedResponse> postDataMultipartOld(
      String url, List<FileParams> files, List<DataParams> params) async {
    final username = Config.gsApiKey;
    final password = Config.gsApiPassword;
    final credentials = '$username:$password';
    final stringToBase64 = utf8.fuse(base64);
    final encodedCredentials = stringToBase64.encode(credentials);
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json", // or whatever
      HttpHeaders.authorizationHeader: "Basic $encodedCredentials",
    };

    print(Uri.parse(Config.gsApiUrl + url));
    http.MultipartRequest request =
        http.MultipartRequest('POST', Uri.parse(Config.gsApiUrl + url));
    request.headers.addAll(headers);
    if (files.length > 0) {
      files.forEach((file) {
        print(file.fileName +
            "  " +
            file.file.readAsBytes().asStream().toString());
        request.files.add(http.MultipartFile(
          file.fileName,
          file.file.readAsBytes().asStream(),
          file.file.lengthSync(),
          filename: file.file.path.split("/").last,
        ));
        print("Added");
      });
    }

    params.forEach((param) {
      request.fields[param.label] = param.value;
    });

    print(request.fields.toString());

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return response;
    } else {
      print(response.statusCode);
      print(response.reasonPhrase);
      throw Exception('Failed to load data!');
    }
    return response;
  }
}
