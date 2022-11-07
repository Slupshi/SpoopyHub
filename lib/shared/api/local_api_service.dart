import 'package:spoopy/features/logs/models/spoopy_logs.dart';
import 'package:spoopy/shared/api/api_service.dart';

final LocalApiService localApiService = LocalApiService(apiService: apiService);

class LocalApiService {
  final String baseURL;
  final ApiService apiService;
  LocalApiService(
      {required this.apiService, this.baseURL = "https://localhost:7057/api/"});

  Future<SpoopyLogs> getLogs() async {
    return await apiService.httpGet("") as SpoopyLogs;
  }
}
