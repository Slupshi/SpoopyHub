class Utilities {
  static String durationFormat(Duration duration) {
    int hour = duration.inHours;
    int minute = duration.inMinutes.remainder(60);
    int second = duration.inSeconds.remainder(60);

    return "${hour < 10 ? '0' : ''}$hour:${minute < 10 ? '0' : ''}$minute:${second < 10 ? '0' : ''}$second";
  }
}
