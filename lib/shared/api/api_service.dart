import 'package:dio/dio.dart';

final ApiService apiService = ApiService();

class ApiService {
  late Dio _apiService;
  ApiService() {
    _apiService = Dio();
  }

  Future<Object> httpGet(String url) async {
    return await _apiService.get(url);
  }

  Future<void> httpPost(String url, Object model) async {
    await _apiService.post(url, data: model);
  }

  Future<void> httpPut(String url, Object model) async {
    await _apiService.put(url);
  }

  Future<void> httpDelete(String url) async {
    await _apiService.delete(url);
  }
}
