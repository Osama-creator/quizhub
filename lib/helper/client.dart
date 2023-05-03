import 'package:dio/dio.dart';
import 'package:laravel_exception/laravel_exception.dart';
import 'package:queen/queen.dart';

class ApiMessage implements Exception {
  final String msg;

  ApiMessage(this.msg);
  @override
  String toString() => msg;
}

Object? extractError(dynamic data, int httpStatus) {
  if (httpStatus == 412 && data is List) {
    if (data.isNotEmpty && data.first is String) {
      throw data.first as String;
    }
    throw (((data.first as Map).entries.first).value as List).first as String;
  }
  if (httpStatus == 401 && data is Map) {
    if (data['message'] != null) {
      throw ApiMessage(data['message'] as String);
    }
    final error = data['error'] as Map;
    throw (error[error.keys.first] as List).first as String;
  }

  if (httpStatus == 422 && data is Map<String, dynamic>) {
    throw LValidationException(data);
  } else if (httpStatus == 500 && data is Map<String, dynamic>) {
    throw LServerException.parse(data);
  } else if (httpStatus == 404 && data is Map<String, dynamic>) {
    if (data['error'] is String) {
      throw data['error'] as String;
    }
    throw LNotFoundException.parse(data);
  }
  if (data is Map) {
    return data['error'];
  }
  return null;
}

void throwIfNot(int httpStatus, Response response) {
  if (response.statusCode != httpStatus) {
    final err = extractError(response.data, response.statusCode!) ??
        response.data as Object;
    throw err;
  }
}

/// wrapper around dio to handlers api calls
class ApiClient {
  final Dio dio;

  ApiClient(this.dio);

  Response _validate(Response res) {
    final badCodes = [
      400,
      401,
      404,
      422,
      500,
    ];
    if (badCodes.contains(res.statusCode)) {
      throw extractError(res.data, res.statusCode!) ?? res.data as Object;
    }
    return res;
  }

  /// sends a [GET] request to the given [url]
  Future<Response> get(
    String path, {
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
    bool attachToken = true,
  }) async {
    final res = await dio.get(
      path,
      queryParameters: query,
      options: Options(
        headers: {
          'accept-lang': Lang.current.languageCode,
          if (attachToken)
            'authorization': 'Bearer ${Prefs.getString('token')}',
          ...headers,
        },
      ),
    );
    return _validate(res);
  }

  /// sends a [GET] request to the given [url]
  Future<Response> customGet(
    String path, {
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> body = const {},
    Map<String, dynamic> query = const {},
    bool attachToken = true,
  }) async {
    final res = await dio.request(
      path,
      queryParameters: query,
      data: body,
      options: Options(
        headers: {
          'method': 'GET',
          'accept-lang': Lang.current.languageCode,
          if (attachToken)
            'authorization': 'Bearer ${Prefs.getString('token')}',
          ...headers,
        },
      ),
    );
    return _validate(res);
  }

  Future<Response> post(
    String path, {
    Object body = const {},
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
    String? contentType,
    bool attachToken = true,
  }) async {
    final res = await dio.post(
      path,
      data: body,
      queryParameters: query,
      options: Options(
        headers: {
          'accept-lang': Lang.current.languageCode,
          if (attachToken)
            'authorization': 'Bearer ${Prefs.getString('token')}',
          ...headers,
        },
        contentType: contentType,
      ),
    );
    return _validate(res);
  }

  Future<Response> patch(
    String path, {
    Object body = const {},
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
    String? contentType,
    bool attachToken = true,
  }) async {
    final res = await dio.patch(
      path,
      data: body,
      queryParameters: query,
      options: Options(
        headers: {
          'accept-lang': Lang.current.languageCode,
          if (attachToken)
            'authorization': 'Bearer ${Prefs.getString('token')}',
          ...headers,
        },
        contentType: contentType,
      ),
    );
    return _validate(res);
  }

  Future<Response> delete(
    String path, {
    Object body = const {},
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
    String? contentType,
    bool attachToken = true,
  }) async {
    final res = await dio.delete(
      path,
      data: body,
      queryParameters: query,
      options: Options(
        headers: {
          'accept-lang': Lang.current.languageCode,
          if (attachToken)
            'authorization': 'Bearer ${Prefs.getString('token')}',
          ...headers,
        },
        contentType: contentType,
      ),
    );
    return _validate(res);
  }

  Future<Response> put(
    String path, {
    Object body = const {},
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
    String? contentType,
    bool attachToken = true,
  }) async {
    final res = await dio.put(
      path,
      data: body,
      queryParameters: query,
      options: Options(
        headers: {
          'accept-lang': Lang.current.languageCode,
          if (attachToken)
            'authorization': 'Bearer ${Prefs.getString('token')}',
          ...headers,
        },
        contentType: contentType,
      ),
    );
    return _validate(res);
  }
}
