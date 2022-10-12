import 'dart:developer' as dev;

class AppLogger {
  AppLogger._();

  static bool _showPrettyLogs = false;
  static bool get showPrettyLogs => _showPrettyLogs;

  static bool _showLogs = false;
  static bool get showLogs => _showLogs;

  static void setLogger({
    required bool showLogs,
    bool showPrettyLogs = false,
  }) {
    _showLogs = showLogs;
    _showPrettyLogs = showPrettyLogs;
  }

  static void log(Object? e) {
    if (_showLogs) dev.log("$e");
  }
}
