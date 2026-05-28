/// Environment configuration for the app
enum Environment { dev, staging, production }

class AppConfig {
  AppConfig._();

  static Environment _environment = Environment.dev;

  static void init(Environment env) {
    _environment = env;
  }

  static Environment get environment => _environment;

  static String get baseUrl {
    switch (_environment) {
      case Environment.dev:
        return const String.fromEnvironment(
          'API_BASE_URL',
          defaultValue: 'http://10.0.2.2:8000/api', // Android emulator → localhost
        );
      case Environment.staging:
        return 'https://staging-api.velvoria.com/api';
      case Environment.production:
        return 'https://api.velvoria.com/api';
    }
  }

  static bool get isDebug => _environment == Environment.dev;
}
