class SpoopyStatus {
  Duration uptime;
  bool isRunning;
  Duration runtime;
  int serverCount;
  SpoopyStatus(
      {required this.uptime,
      required this.isRunning,
      required this.runtime,
      required this.serverCount});
  SpoopyStatus.fromJson(Map<String, dynamic> json)
      : uptime = json['uptime'],
        isRunning = json['isRunning'],
        runtime = json['runtime'],
        serverCount = json['serverCount'];

  Map<String, dynamic> toJson() => {
        'uptime': uptime,
        'isRunning': isRunning,
        'runtime': runtime,
        'serverCount': serverCount,
      };
}
