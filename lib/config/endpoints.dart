abstract class Endpoints {
  static const host = 'http://192.168.1.106:4500/Node.js';
  static const api = '$host/api';

  /// ! auth
  static const register = '/v6/use/signUP';
  static const login = '/v6/use/login';
  static const cities = '/v6/use/getallGovernorates';
  static const grades = '/v6/use/getallgrades';
  static const schools = '/v6/use/getallschool';
}
