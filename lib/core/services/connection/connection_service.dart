import 'dart:async';

enum ConnectionEvent {
  bluetooth,
  wifi,
  ethernet,
  mobile,
  none,
  vpn,
  other,
}

abstract class ConnectionService {
  StreamController<ConnectionEvent> connectionListerner();

  Future<bool> hasNetwork();

  void dispose();
}
