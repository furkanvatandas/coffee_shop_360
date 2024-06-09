import 'dart:async';
import 'dart:convert';

import 'package:coffee_shop_360/core/managers/network/models/failure_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'network_model.dart';
import 'network_result.dart';

enum HttpMethods { get, post, put, delete }

const cs360BaseNetworkManager = NetworkManager(
  baseUrl: 'apimocha.com',
  failureModel: FailureModel(),
);

class NetworkManager<F extends INetworkModel> {
  final String baseUrl;
  final F failureModel;

  const NetworkManager({
    required this.failureModel,
    required this.baseUrl,
  });

  Future<NetworkResult<S, F>> request<S, P extends INetworkModel>({
    required P parseModel,
    required String path,
    required HttpMethods httpMethod,
    bool isHttps = true,
    Map<String, String>? headers,
    Map<String, dynamic>? bodyParameters,
    Map<String, String>? queryParameters,
  }) async {
    var body = _cleanMap(bodyParameters);
    var query = _cleanMap(queryParameters);
    var header = _cleanMap(headers);

    Uri uri = isHttps ? Uri.https(baseUrl, path, query) : Uri.http(baseUrl, path, query);
    debugPrint('${httpMethod.methodName} $uri Headers: $header');

    try {
      var response = await _sendRequest(httpMethod, uri, header, body);
      return _handleResponse(response, parseModel);
    } catch (e, stacktrace) {
      debugPrint('$path => $e\n$stacktrace');
      return NetworkResultException('An error occurred while processing your process.');
    }
  }

  Future<http.Response> _sendRequest(
    HttpMethods httpMethod,
    Uri uri,
    Map<String, String>? header,
    Map<String, dynamic>? body,
  ) {
    switch (httpMethod) {
      case HttpMethods.get:
        return http.get(uri, headers: header);
      case HttpMethods.post:
        return http.post(uri, headers: header, body: jsonEncode(body));
      case HttpMethods.put:
        return http.put(uri, headers: header, body: jsonEncode(body));
      case HttpMethods.delete:
        return http.delete(uri, headers: header);
    }
  }

  Map<String, T>? _cleanMap<T>(Map<String, T>? map) {
    return map?..removeWhere((key, value) => value == null || value.toString().isEmpty);
  }

  NetworkResult<S, F> _handleResponse<S, P extends INetworkModel>(
    http.Response response,
    P parseModel,
  ) {
    if (response.reasonPhrase == 'No Content') {
      return NetworkResultSuccess(parseModel.fromJson({'status': 'ok'}) as S);
    }

    var responseJson = json.decode(utf8.decode(response.bodyBytes));
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      debugPrint('Response: $responseJson');

      if (responseJson is List) {
        return NetworkResultSuccess(
          List<P>.from(responseJson.map((e) => parseModel.fromJson(e)).toList()) as S,
        );
      } else if (responseJson is Map<String, dynamic>) {
        return NetworkResultSuccess(parseModel.fromJson(responseJson) as S);
      } else {
        return NetworkResultSuccess(responseJson as S);
      }
    } else {
      debugPrint('Response: $responseJson');
      return NetworkResultFailure(failureModel.fromJson(responseJson));
    }
  }
}

extension HttpMethodsExtension on HttpMethods {
  String get methodName {
    switch (this) {
      case HttpMethods.get:
        return 'GET';
      case HttpMethods.post:
        return 'POST';
      case HttpMethods.put:
        return 'PUT';
      case HttpMethods.delete:
        return 'DELETE';
    }
  }
}
