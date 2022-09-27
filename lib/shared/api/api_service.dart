import 'package:dio/dio.dart';

class Api {
  late Dio _apiService;
  Api() {
    _apiService = Dio();
  }

  Future<Object> httpGet(String url) async {
    return await _apiService.get(url);
  }

  Future<void> httpPost(String url, Object model) async {
    await _apiService.post(url, data: model);
  }
}
