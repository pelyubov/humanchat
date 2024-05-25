import 'dart:io';

Future<bool> checkNetwork() async {
  try {
    final result = await InternetAddress.lookup('example.com');
    return result.isNotEmpty && result.isNotEmpty;
  } catch (e) {
    return false;
  }
}
