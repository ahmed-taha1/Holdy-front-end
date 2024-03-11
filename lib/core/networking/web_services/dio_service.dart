import 'package:dio/dio.dart';

import '../urls.dart';

class DioService {
  static DioService? _instance;
  late Dio _dio;

  // Private constructor
  DioService._() {
    _dio = Dio(); // Initialize Dio instance
    BaseOptions baseOptions = BaseOptions(
      baseUrl: Urls.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Host': 'accountsprotector.somee.com'
      },
      followRedirects: true,
      maxRedirects: 100,
    );
    _dio.options = baseOptions;
  }

  // Static method to access the instance
  static DioService get instance {
    _instance ??= DioService._(); // Create instance if not exists
    return _instance!;
  }

  // Getter to access the Dio instance
  static Dio get dio => instance._dio;
}
