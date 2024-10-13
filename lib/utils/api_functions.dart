import 'dart:convert';

import 'package:http/http.dart';

Future<Response> post_(
  Uri url, {
  // Map<String, String>? headers,
  Object? body,
  Encoding? encoding,
  String? token,
}) {
  var header = {
    "accept": "application/json",
    "content-type": "application/json"
  };
  if (token != null) {
    header.addAll({
      'Authorization': 'Bearer $token',
    });
  }
  return post(
    url,
    headers: header,
    body: jsonEncode(body),
    encoding: encoding,
  );
}

Future<Response> patch_(
  Uri url, {
  Object? body,
  Encoding? encoding,
  String? token,
}) {
  Map<String, String> header = {
    "accept": "application/json",
    "content-type": "application/json"
  };
  if (token != null) {
    header.addAll({
      'Authorization': 'Bearer $token',
    });
  }
  return patch(
    url,
    headers: header,
    body: jsonEncode(body),
    encoding: encoding,
  );
}

Future<Response> put_(
  Uri url, {
  Object? body,
  Encoding? encoding,
  String? token,
}) {
  Map<String, String> header = {
    "accept": "application/json",
    "content-type": "application/json"
  };
  if (token != null) {
    header.addAll({
      'Authorization': 'Bearer $token',
    });
  }
  return put(
    url,
    headers: header,
    body: jsonEncode(body),
    encoding: encoding,
  );
}

Future<Response> get_(Uri url, {String? token}) {
  var header = {
    "accept": "application/json",
    "content-type": "application/json"
  };

  if (token != null) {
    header.addAll({
      'Authorization': 'Bearer $token',
    });
  }
  return get(url, headers: header);
}

Future<Response> delete_(
  Uri url, {
  // Map<String, String>? headers,
  String? token,
  Object? body,
  Encoding? encoding,
}) {
  var header = {
    "accept": "application/json",
    "content-type": "application/json"
  };
  if (token != null) {
    header.addAll({
      'Authorization': 'Bearer $token',
    });
  }
  return delete(
    url,
    headers: header,
    body: jsonEncode(body),
    encoding: encoding,
  );
}
