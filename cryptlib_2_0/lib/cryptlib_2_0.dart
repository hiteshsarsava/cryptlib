library cryptlib_2_0;

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';

class CryptLib {
  CryptLib._privateConstructor();

  static final CryptLib _instance = CryptLib._privateConstructor();

  static CryptLib get instance => _instance;

  String _encryptDecrypt(String inputText, String encryptionKey,
      _EncryptMode mode, String initVector) {
    final key = Key.fromUtf8(encryptionKey);
    final iv = IV.fromUtf8(_generateRandomIV16());

    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));

    if (mode == _EncryptMode.decrypt) {
      final encrypted = Encrypted.fromBase64(inputText);
      final decrypted = encrypter.decrypt(encrypted, iv: iv);
      return decrypted;
    } else {
      final encrypted = encrypter.encrypt(inputText, iv: iv);

      return encrypted.base64;
    }
  }

  String _sha256key(String text, int length) {
    String resultString;

    var bytes = utf8.encode(text); // data being hashed
    resultString = sha256.convert(bytes).toString();

    if (length > resultString.length) {
      resultString = resultString.toString();
    } else {
      resultString = resultString.toString().substring(0, length);
    }
    return resultString;
  }

  /// Generate IV with 16 bytes
  /// @return String
  String _generateRandomIV16() {
    var result = IV.fromSecureRandom(16).base64;
    if (16 > result.length) {
      return result.toString();
    } else {
      return result.toString().substring(0, 16);
    }
  }

  String decryptCipherTextWithRandomIV(String cipherText, String password) {
    final decrypted = _encryptDecrypt(cipherText, _sha256key(password, 32),
        _EncryptMode.decrypt, _generateRandomIV16());
    return decrypted.substring(16, decrypted.length);
  }

  String encryptPlainTextWithRandomIV(String plainText, String password) {
    final encrypted = _encryptDecrypt(_generateRandomIV16() + plainText,
        _sha256key(password, 32), _EncryptMode.encrypt, _generateRandomIV16());
    return encrypted;
  }
}

/// Encryption mode enumeration
enum _EncryptMode { encrypt, decrypt }
