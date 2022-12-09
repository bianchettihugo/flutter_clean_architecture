import 'package:flutter_clean_architecture/modules/user/data/datasources/user_remote_datasource_mock.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should call user remote datarouce mock methods', () async {
    final datasource = UserRemoteDatasourceMock();
    datasource.signIn(email: '', password: '');
    datasource.signUp(name: '', email: '', password: '');
  });
}
