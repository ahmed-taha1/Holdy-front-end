import 'package:flutter_dotenv/flutter_dotenv.dart';

class Urls {
  static init() {
    baseUrl = dotenv.env['BASE_URL'] ?? '';
    host = dotenv.env['HOST'] ?? '';
    register = dotenv.env['REGISTER'] ?? '';
    login = dotenv.env['LOGIN'] ?? '';
    setPin = dotenv.env['SET_PIN'] ?? '';
    sendOtp = dotenv.env['SEND_OTP'] ?? '';
    verifyOtp = dotenv.env['VERIFY_OTP'] ?? '';
    resetPassword = dotenv.env['RESET_PASSWORD'] ?? '';
    getAllData = dotenv.env['GET_ALL_DATA'] ?? '';
    removeUserAccount = dotenv.env['REMOVE_USER_ACCOUNT'] ?? '';
    changePassword = dotenv.env['CHANGE_PASSWORD'] ?? '';
    createPlatform = dotenv.env['CREATE_PLATFORM'] ?? '';
    updatePlatform = dotenv.env['UPDATE_PLATFORM'] ?? '';
    deletePlatform = dotenv.env['DELETE_PLATFORM'] ?? '';
    createAccount = dotenv.env['CREATE_ACCOUNT'] ?? '';
    updateAccount = dotenv.env['UPDATE_ACCOUNT'] ?? '';
    deleteAccount = dotenv.env['DELETE_ACCOUNT'] ?? '';
    reportBug = dotenv.env['REPORT_BUG'] ?? '';

  }
  static String baseUrl = dotenv.env['BASE_URL'] ?? '';
  static String host = dotenv.env['HOST'] ?? '';
  static String register = dotenv.env['REGISTER'] ?? '';
  static String login = dotenv.env['LOGIN'] ?? '';
  static String setPin = dotenv.env['SET_PIN'] ?? '';
  static String sendOtp = dotenv.env['SEND_OTP'] ?? '';
  static String verifyOtp = dotenv.env['VERIFY_OTP'] ?? '';
  static String resetPassword = dotenv.env['RESET_PASSWORD'] ?? '';
  static String getAllData = dotenv.env['GET_ALL_DATA'] ?? '';
  static String removeUserAccount = dotenv.env['REMOVE_USER_ACCOUNT'] ?? '';
  static String changePassword = dotenv.env['CHANGE_PASSWORD'] ?? '';
  static String createPlatform = dotenv.env['CREATE_PLATFORM'] ?? '';
  static String updatePlatform = dotenv.env['UPDATE_PLATFORM'] ?? '';
  static String deletePlatform = dotenv.env['DELETE_PLATFORM'] ?? '';
  static String createAccount = dotenv.env['CREATE_ACCOUNT'] ?? '';
  static String updateAccount = dotenv.env['UPDATE_ACCOUNT'] ?? '';
  static String deleteAccount = dotenv.env['DELETE_ACCOUNT'] ?? '';
  static String reportBug = dotenv.env['REPORT_BUG'] ?? '';
}
