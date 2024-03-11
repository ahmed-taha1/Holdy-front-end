import 'dart:convert';

import 'package:accounts_protector/core/networking/urls.dart';
import 'package:dio/dio.dart';
import 'dio_service.dart';

class ApiService {
  final Dio _dio = DioService.dio;

  // Method to perform GET request
  Future<Response> get({required String path, bool? addAuth}) async {
    _dio.options.method = 'GET';
    _dio.options.headers['Authorization'] = 'Bearer ' + 'token';

    try {
      final response = await _dio.get(path);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Method to perform POST request
  Future<Response> post(
      {required String path, dynamic body, bool? addAuth}) async {
    _dio.options.method = 'POST';
    _dio.options.headers['Authorization'] = 'Bearer ' + 'token';

    String bodyJson = jsonEncode(body);
    try {
      final response = await _dio.post(path, data: bodyJson);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Method to perform PUT request
  Future<Response> put(
      {required String path, dynamic body, bool? addAuth}) async {
    _dio.options.method = 'PUT';
    _dio.options.headers['Authorization'] = 'Bearer ' + 'token';

    try {
      final response = await _dio.put(path, data: body);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Method to perform DELETE request
  Future<Response> delete(
      {required String path, dynamic body, bool? addAuth}) async {
    _dio.options.method = 'DELETE';
    _dio.options.headers['Authorization'] = 'Bearer ' + 'token';

    try {
      final response = await _dio.delete(path, data: body);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
