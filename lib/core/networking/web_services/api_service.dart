import 'dart:convert';

import 'package:accounts_protector/core/services/cache_service.dart';
import 'package:accounts_protector/core/services/spam_detection_service.dart';
import 'package:dio/dio.dart';
import '../../failures/server_failure.dart';
import 'dio_service.dart';

class ApiService {
  final Dio _dio = DioService.dio;

  // Method to perform GET request
  Future<Response> get({required String path, bool? addAuth, String? token}) async {
    _dio.options.method = 'GET';
    if(addAuth == true){
      _dio.options.headers['Authorization'] = 'Bearer ${CacheHelper.getData(key: 'token')}';
    }
    if(token != null) {
      _dio.options.headers['Authorization'] = 'Bearer $token';
    }

    try {
      SpamDetector.isSpam(path);
      final response = await _dio.get(path);
      SpamDetector.clearSpam(path);
      return response;
    } catch (dioError) {
      SpamDetector.addFailure(path);
      if (dioError is DioException) {
        throw ServerFailure.fromDioError(dioError);
      } else {
        rethrow;
      }
    }
  }

  // Method to perform POST request
  Future<Response> post(
      {required String path, dynamic body, bool? addAuth, String? token}) async {
    _dio.options.method = 'POST';
    if(addAuth == true){
      _dio.options.headers['Authorization'] = 'Bearer ${CacheHelper.getData(key: 'token')}';
    }
    if(token != null) {
      _dio.options.headers['Authorization'] = 'Bearer $token';
    }

    String bodyJson = jsonEncode(body);
    try {
      SpamDetector.isSpam(path);
      final response = await _dio.post(path, data: bodyJson);
      SpamDetector.clearSpam(path);
      return response;
    } catch (dioError) {
      if (dioError is DioException) {
        SpamDetector.addFailure(path);
        throw ServerFailure.fromDioError(dioError);
      } else {
        rethrow;
      }
    }
  }

  // Method to perform PUT request
  Future<Response> put(
      {required String path, dynamic body, bool? addAuth, String? token}) async {
    _dio.options.method = 'PUT';
    if(addAuth == true){
      _dio.options.headers['Authorization'] = 'Bearer ${CacheHelper.getData(key: 'token')}';
    }
    if(token != null) {
      _dio.options.headers['Authorization'] = 'Bearer $token';
    }

    try {
      SpamDetector.isSpam(path);
      final response = await _dio.put(path, data: body);
      SpamDetector.clearSpam(path);
      return response;
    } catch (dioError) {
      SpamDetector.addFailure(path);
      if (dioError is DioException) {
        throw ServerFailure.fromDioError(dioError);
      } else {
        rethrow;
      }
    }
  }

  // Method to perform DELETE request
  Future<Response> delete(
      {required String path, dynamic body, bool? addAuth, String? token}) async {
    _dio.options.method = 'DELETE';
    if(addAuth == true){
      _dio.options.headers['Authorization'] = 'Bearer ${CacheHelper.getData(key: 'token')}';
    }
    if(token != null) {
      _dio.options.headers['Authorization'] = 'Bearer $token';
    }

    try {
      SpamDetector.isSpam(path);
      final response = await _dio.delete(path, data: body);
      SpamDetector.clearSpam(path);
      return response;
    } catch (dioError) {
      SpamDetector.addFailure(path);
      if (dioError is DioException) {
        throw ServerFailure.fromDioError(dioError);
      } else {
        rethrow;
      }
    }
  }
}