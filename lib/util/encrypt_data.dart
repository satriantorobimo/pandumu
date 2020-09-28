import 'dart:convert';

import 'package:crypto/crypto.dart';

class EncryptData {
  passwordEncrypt(String value) {
    var bytes = utf8.encode(value);
    var digest = sha256.convert(bytes);

    print("Digest as bytes: ${digest.bytes}");
    print("Digest as hex string: $digest");

    return digest.toString();
  }
}
