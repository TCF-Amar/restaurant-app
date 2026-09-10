class ApiEndpoints {
  // Base URLs (can be swapped for dev/stage/prod environments)
  static const String baseUrl = 'https://api.example.com/v1';

  // Timeouts
  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 15);
  static const Duration sendTimeout = Duration(seconds: 15);

  // Auth endpoints
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String logout = '/auth/logout';
  static const String refreshToken = '/auth/refresh';

  // User endpoints
  static const String userProfile = '/user/profile';

  // Payment / Demo endpoints
  static const String payments = '/payments';
  static const String promos = '/promos';
  static const String notifications = '/notifications';
}
