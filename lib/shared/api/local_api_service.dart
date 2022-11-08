import 'dart:convert';

import 'package:spoopy/features/logs/models/spoopy_logs.dart';
import 'package:spoopy/shared/api/api_service.dart';

final LocalApiService localApiService = LocalApiService(apiService: apiService);

class LocalApiService {
  final String baseURL;
  final ApiService apiService;
  LocalApiService(
      {required this.apiService, this.baseURL = "https://localhost:7057/api/"});

  Future<SpoopyLogs> getLogs() async {
    final result = await apiService.httpGet("");
    final Map<String, dynamic> data = jsonDecode(result.toString());
    return SpoopyLogs.fromJson(data);
  }

  Future<Iterable<SpoopyLogs>> getAllLogs() async {
    final result = await apiService.httpGet("");
    final List data = jsonDecode(result.toString());
    final List<SpoopyLogs> dataList =
        data.map((item) => SpoopyLogs.fromJson(item)).toList();
    return dataList;
  }
}
