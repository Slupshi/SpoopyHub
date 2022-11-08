class SpoopyLogs {
  int id;
  String message;
  bool isError;
  DateTime time;

  SpoopyLogs(
      {required this.id,
      required this.message,
      required this.isError,
      required this.time});

  SpoopyLogs.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        message = json['message'],
        isError = json['isError'],
        time = json['time'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'message': message,
        'isError': isError,
        'time': time,
      };
}
