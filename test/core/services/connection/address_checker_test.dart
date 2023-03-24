import 'dart:io';

import 'package:flutter_clean_architecture/core/services/connection/address_checker.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should check internet access', () async {
    final ic = AddressChecker();
    expect(await ic.lookup("google.com"), isA<List<InternetAddress>>());
  });
}
