import 'package:cryptlib_2_0/cryptlib_2_0.dart';

main() {
  const plainText = "Hello World!";

  final encryptText =
      CryptLib.instance.encryptPlainTextWithRandomIV(plainText, "Password");

  print("EecryptedText ${encryptText}");

  final text =
      CryptLib.instance.decryptCipherTextWithRandomIV(encryptText, "Password");
  print("DecryptedText ${text}");
}
