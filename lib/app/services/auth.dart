// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:queen/queen.dart' hide throwIfNot;
import 'package:quizhub/app/models/user_model.dart';
import 'package:quizhub/config/endpoints.dart';
import 'package:quizhub/helper/client.dart';

class AuthService {
  final ApiClient client;
  AuthService(
    this.client,
  );

  bool get isLoggedIn => Prefs.getString('token').isNotEmpty;

  bool get isLoggedOut => !isLoggedIn;

  UserModel? get cachedUser {
    final user = Prefs.getMap('auth.user');
    if (user.isEmpty) return null;
    return UserModel.fromMap(user);
  }

  UserModel get user => cachedUser ?? (throw 'user is not logged in !');

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    final res = await client.post(
      Endpoints.login,
      body: {
        'email': email,
        'password': password,
      },
    );
    throwIfNot(200, res);
    // save the token to shared preferences
    // ignore: avoid_dynamic_calls
    final token = (res.data as Map<String, dynamic>)['data']['token'] as String;
    await Prefs.setString('token', token);
  }

  Future<String> signUp({
    required String fName,
    required String lName,
    required String email,
    required String roleName,
    String? phone,
    String? image,
    required String password,
  }) async {
    final res = await client.post(
      Endpoints.register,
      body: {
        'fName': fName,
        'lName': lName,
        'email': email,
        'mobile': phone,
        'password': password,
        'roleName': roleName,
        'img': image
      },
    );
    throwIfNot(200, res);
    final userData =
        (res.data as Map<String, dynamic>)['data'] as Map<String, dynamic>;
    await Prefs.setMap('auth.user', userData);
    await signIn(email: email, password: password);
    return (res.data as Map)['message'] as String;
  }

  Future<void> signOut() async {
    await Prefs.removeMany(['token', 'auth.user']);
    // client.get('/logout');
  }

  // AuthService copyWith({
  //   ApiClient? client,
  // }) {
  //   return AuthService(
  //     client ?? this.client,
  //   );
  // }

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'client': client.toMap(),
  //   };
  // }

  // factory AuthService.fromMap(Map<String, dynamic> map) {
  //   return AuthService(
  //     ApiClient.fromMap(map['client'] as Map<String, dynamic>),
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory AuthService.fromJson(String source) =>
  //     AuthService.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AuthService(client: $client)';

  @override
  bool operator ==(covariant AuthService other) {
    if (identical(this, other)) return true;

    return other.client == client;
  }

  @override
  int get hashCode => client.hashCode;
}
