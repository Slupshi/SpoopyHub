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
}
