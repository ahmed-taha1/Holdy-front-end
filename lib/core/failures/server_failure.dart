import 'package:dio/dio.dart';
import 'i_failure.dart';


class ServerFailure extends Failure{
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout with Api Server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout with Api Server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout with Api Server');
      case DioExceptionType.badCertificate:
        return ServerFailure('incorrect certificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request with Api Server caceled');
      case DioExceptionType.connectionError:
        return ServerFailure('Error conecting with Api Server');
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('NO internet Connection');
        }
        return ServerFailure('UNexpected Error, please try again');
      default:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 403) {
      List<dynamic> errors = response['errors'] ?? [];
      String errorMessage =
          errors.isNotEmpty ? errors.join('\n') : 'Unknown error';
      return ServerFailure(errorMessage);
    } else if (statusCode == 404) {
      return ServerFailure('Your Request Not found, please try again later!');
    } else if (statusCode == 500) {
      return ServerFailure('Server error, please try again later!');
    } else if (statusCode == 401) {
      return ServerFailure('Unauthorized, please try again later!');
    } else {
      return ServerFailure('Something Went Wrong, Please try again');
    }
  }
}