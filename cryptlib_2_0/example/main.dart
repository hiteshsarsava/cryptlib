import 'package:cryptlib_2_0/cryptlib_2_0.dart';
import 'package:flutter/foundation.dart';

main() {
  const plainText = "Hello World!";

  final encryptText =
      CryptLib.instance.encryptPlainTextWithRandomIV(plainText, "Password");

  if (kDebugMode) {
    print("EecryptedText $encryptText");
  }

  final text =
      CryptLib.instance.decryptCipherTextWithRandomIV(encryptText, "Password");
  if (kDebugMode) {
    print("DecryptedText $text");
  }
}
