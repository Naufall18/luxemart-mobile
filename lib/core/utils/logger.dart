import 'dart:developer' as developer;

/// Custom logger utility for consistent logging across the app
class Logger {
  // Private constructor to prevent instantiation
  Logger._();

  /// Log debug messages (only in debug mode)
  static void debug(String message, {String? tag}) {
    _log(message, tag: tag, level: 'DEBUG');
  }

  /// Log info messages
  static void info(String message, {String? tag}) {
    _log(message, tag: tag, level: 'INFO');
  }

  /// Log warning messages
  static void warning(String message, {String? tag}) {
    _log(message, tag: tag, level: 'WARNING');
  }

  /// Log error messages
  static void error(String message, {String? tag, Object? error, StackTrace? stackTrace}) {
    _log(
      message,
      tag: tag,
      level: 'ERROR',
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Internal logging method
  static void _log(
    String message, {
    String? tag,
    required String level,
    Object? error,
    StackTrace? stackTrace,
  }) {
    final timestamp = DateTime.now().toIso8601String();
    final tagPrefix = tag != null ? '[$tag] ' : '';
    final logMessage = '$timestamp [$level] $tagPrefix$message';

    developer.log(
      logMessage,
      name: 'Velvoria',
      error: error,
      stackTrace: stackTrace,
    );
  }
}
