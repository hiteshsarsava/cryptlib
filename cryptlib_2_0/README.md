This package is interfacing Cryptlib library in dart. It can also be used in flutter applications.
Using companion framework libraries, you should be able to encrypt/decrypt between node, iOS,
Android and Windows platforms.

## Features

- Encrypt String using SHA256 algorithm.
- Can be used along with other platforms. More
  info : https://github.com/Pakhee/Cross-platform-AES-encryption

## Getting started

Add as dependency in pubspec.yaml file

```dart
dependencies:
  flutter:
    sdk: flutter
  cryptlib_2_0: ^0.0.1
```

## Usage

```dart
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
```

```dart
Result for above 
EecryptedText dkLSCeGtcDVrBtiFsNPG08I76MQRlMOugkI6tsQR36Q= 
DecryptedText Hello World!
```

## Additional information

Supported Platforms
```dart
platforms:
  android:
  ios:
  linux:
  macos:
  web:
  windows:
```