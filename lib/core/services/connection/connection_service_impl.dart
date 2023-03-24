import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_clean_architecture/core/services/connection/address_checker.dart';
import 'package:flutter_clean_architecture/core/services/connection/connection_service.dart';

class ConnectionServiceImpl extends ConnectionService {
  final AddressChecker _addressChecker;
  final Connectivity _connectivity;
  final _connectionListerner = StreamController<ConnectionEvent>();

  final _events = {
    ConnectivityResult.bluetooth: ConnectionEvent.bluetooth,
    ConnectivityResult.ethernet: ConnectionEvent.ethernet,
    ConnectivityResult.mobile: ConnectionEvent.mobile,
    ConnectivityResult.none: ConnectionEvent.none,
    ConnectivityResult.other: ConnectionEvent.other,
    ConnectivityResult.wifi: ConnectionEvent.wifi,
    ConnectivityResult.vpn: ConnectionEvent.vpn,
  };

  StreamSubscription? _subscription;

  ConnectionServiceImpl(
      {required AddressChecker addressChecker,
      required Connectivity connectivity})
      : _addressChecker = addressChecker,
        _connectivity = connectivity;

  @override
  StreamController<ConnectionEvent> connectionListerner() {
    _subscription ??= _connectivity.onConnectivityChanged.listen((event) {
      _connectionListerner.sink.add(_events[event] ?? ConnectionEvent.none);
    });
    return _connectionListerner;
  }

  @override
  Future<bool> hasNetwork() async {
    try {
      final result = await _addressChecker.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _connectionListerner.close();
  }
}
