abstract class Endpoints {
  static const host = 'http://192.168.1.103:3000';
  static const api = '$host/api';

  /// ! auth
  static const register = '/user/register';
  static const login = '/user/login';
  static const cities = '/school/getAllGovernorate';
  static const schools = '/school/getSchool';
}
