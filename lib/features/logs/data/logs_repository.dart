import 'package:spoopy/features/logs/models/spoopy_logs.dart';
import 'package:spoopy/shared/api/local_api_service.dart';

final LogsRepository logsRepository = LogsRepository();

class LogsRepository {
  Future<SpoopyLogs> getLogs() async {
    return await localApiService.getLogs();
  }
}
