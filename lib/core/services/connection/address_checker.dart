import 'dart:io';

class AddressChecker {
  Future<List<InternetAddress>> lookup(String host,
      {InternetAddressType type = InternetAddressType.any}) async {
    return await InternetAddress.lookup(host, type: type);
  }
}
