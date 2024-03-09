import 'package:dio/dio.dart';
import '../urls.dart'; // Import your URL constants file
import 'dio_service.dart'; // Import the DioService class

class ApiService {
  final Dio _dio = DioService.dio; // Access Dio instance from DioService

  // Method to perform GET request
  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return response;
    } catch (e) {
      throw e;
    }
  }

  // Method to perform POST request
  Future<Response> post(String path, dynamic data) async {
    try {
      final response = await _dio.post(path, data: data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  // Method to perform PUT request
  Future<Response> put(String path, dynamic data) async {
    try {
      final response = await _dio.put(path, data: data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  // Method to perform DELETE request
  Future<Response> delete(String path) async {
    try {
      final response = await _dio.delete(path);
      return response;
    } catch (e) {
      throw e;
    }
  }
}