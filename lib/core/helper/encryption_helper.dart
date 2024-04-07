import 'package:encrypt/encrypt.dart' as encrypt_lib;
import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';

class EncryptionHelper {
  static encrypt_lib.Key? _key;
  static encrypt_lib.IV? _iv;

  static String encrypt(String data) {
    try {
      _iv = encrypt_lib.IV.fromLength(16); // Generate IV for this encryption
      final encrypter = encrypt_lib.Encrypter(encrypt_lib.AES(_key!));
      final encrypted = encrypter.encrypt(data, iv: _iv!);
      // Save the IV with the encrypted data, for example as a base64 string
      return '${_iv!.base64}\$${encrypted.base64}';
    } catch (e) {
      throw Exception('Error encrypting data');
    }
  }

  static String decrypt(String encryptedDataWithIV) {
    try {
      // Extract the IV and encrypted data
      final parts = encryptedDataWithIV.split('\$');
      if (parts.length != 2) {
        throw Exception('Invalid encrypted data format');
      }
      _iv = encrypt_lib.IV.fromBase64(parts[0]);
      final encryptedData = parts[1];

      final decrypter = encrypt_lib.Encrypter(encrypt_lib.AES(_key!));
      final decrypted = decrypter.decrypt64(encryptedData, iv: _iv!);
      return decrypted;
    } catch (e) {
      throw Exception('Error decrypting data');
    }
  }

  static void setKey(String key) {
    _key = encrypt_lib.Key.fromUtf8(key);
  }

  static String hash({required String data}) {
    // Convert the input string to a list of bytes
    Uint8List bytes = Uint8List.fromList(utf8.encode(data));

    // Calculate the SHA-256 hash
    Digest digest = sha256.convert(bytes);

    // Convert the hash bytes to a hexadecimal string
    String hashed = digest.toString();

    return hashed;
  }


  static String generateKey({required String data}) {
    Uint8List bytes = Uint8List.fromList(utf8.encode(data));
    Digest digest = md5.convert(bytes);
    String hash = digest.toString();
    return hash;
  }
}