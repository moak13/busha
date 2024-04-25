import 'dart:io';

import 'package:busha/app/app.logger.dart';
import 'package:busha/enums/http_verbs.dart';
import 'package:busha/exception/busha_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioService {
  final Dio _dio = Dio();
  final _logger = getLogger('DioService');

  DioService() {
    if (kDebugMode) {
      _dio.interceptors.addAll([
        LogInterceptor(
          responseBody: true,
          requestHeader: true,
          responseHeader: false,
          request: false,
          requestBody: true,
        ),
      ]);
    }
  }

  Future makeHttpRequest({
    required HttpVerbs verb,
    required String path,
    Map<String, dynamic> queryParameters = const {},
    Map<String, dynamic> body = const {},
  }) async {
    try {
      final response = await _sendRequest(
        verb: verb,
        path: path,
        queryParameters: queryParameters,
        body: body,
      );

      return response.data;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.unknown && e.error is SocketException) {
        _logger.e(
          'This seems to be a network issue. Please check your network and try again.',
        );
        throw BushaException(
          message: 'No Internet Connection',
        );
      }

      if (e.type == DioExceptionType.connectionTimeout) {
        _logger.e(
          'This seems to be a network issue. Please check your network and try again.',
        );
        throw BushaException(
          message: 'Request took too long to deliver',
        );
      }

      if (e.type == DioExceptionType.connectionError) {
        _logger.e(
          'This seems to be a network issue. Please check your network and try again.',
        );
        throw BushaException(
          message:
              'Seems like we lost connection along the way. It\'s not you, it\'s us.',
        );
      }

      _logger.e(
        'A response error occurred. ${e.response?.statusCode}\nERROR: ${e.message}',
      );
      throw BushaException(
        message: 'Unknown Error Has Ocurred!',
      );
    } catch (e, s) {
      _logger.wtf('Could not make a request to this path: $path', e, s);

      rethrow;
    }
  }

  Future<Response> _sendRequest({
    required HttpVerbs verb,
    required String path,
    Map<String, dynamic> queryParameters = const {},
    Map<String, dynamic> body = const {},
  }) async {
    Response response;

    switch (verb) {
      case HttpVerbs.get:
      default:
        response = await _dio.get(
          path,
          queryParameters: queryParameters,
          data: body,
        );
    }

    return response;
  }
}
