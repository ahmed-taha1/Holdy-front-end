import 'dart:convert';

import 'package:dio/dio.dart';
import 'dio_service.dart'; // Import the DioService class

class ApiService {
  final Dio _dio = DioService.dio; // Access Dio instance from DioService

  // Method to perform GET request
  Future<Response> get(String path, {Map<String, dynamic>? queryParameters, bool? addAuth}) async {
    _dio.options.headers['Authorization'] = 'Bearer ' + 'token'; // Add authorization header
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Method to perform POST request
  Future<Response> post(String path, dynamic data) async {
    _dio.options.method = 'POST';
    String bodyJson = jsonEncode(data);
    _dio.options.headers['Content-Length'] = '${utf8.encode(bodyJson).length}';
    try {
      final response = await _dio.post(path, data: bodyJson);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Method to perform PUT request
  Future<Response> put(String path, dynamic data) async {
    try {
      final response = await _dio.put(path, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Method to perform DELETE request
  Future<Response> delete(String path) async {
    try {
      final response = await _dio.delete(path);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}