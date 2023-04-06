// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter_clean_architecture/core/services/connection/address_checker.dart';
import 'package:flutter_clean_architecture/core/services/connection/connection_service.dart';
import 'package:flutter_clean_architecture/core/services/connection/connection_service_impl.dart';

import '../../../utils/mocks.dart';

void main() {
  late AddressChecker addressChecker;
  late ConnectionService connectionService;
  late Connectivity connectivity;

  setUpAll(() {
    addressChecker = MockAddressChecker();
    connectivity = MockConnectivity();
    connectionService = ConnectionServiceImpl(
      addressChecker: addressChecker,
      connectivity: connectivity,
    );
  });

  test('should create a default ConnectionService', () {
    ConnectionServiceImpl();
  });

  test('should be able to listen network changes', () async {
    List<ConnectionEvent> results = [];

    Stream<ConnectivityResult> stream() async* {
      await Future.delayed(const Duration(milliseconds: 400));
      yield ConnectivityResult.none;
      await Future.delayed(const Duration(milliseconds: 400));
      yield ConnectivityResult.wifi;
    }

    when(() => connectivity.onConnectivityChanged).thenAnswer(
      (invocation) => stream(),
    );

    connectionService.connectionListerner().stream.listen((event) {
      results.add(event);
    });

    await Future.delayed(const Duration(milliseconds: 900));

    expect(results, [ConnectionEvent.none, ConnectionEvent.wifi]);

    connectionService.dispose();
  });

  test('should return true when address checker returns results', () async {
    when(() => addressChecker.lookup("google.com")).thenAnswer(
      (invocation) async => [InternetAddress("8.8.8.8")],
    );

    final hasNetwork = await connectionService.hasNetwork();

    expect(hasNetwork, true);
  });

  test('should return false when address checker doesn\'t return results',
      () async {
    when(() => addressChecker.lookup("google.com")).thenAnswer(
      (invocation) async => [],
    );

    final hasNetwork = await connectionService.hasNetwork();

    expect(hasNetwork, false);
  });

  test('should return false when address checker throws a SocketException',
      () async {
    when(() => addressChecker.lookup("google.com")).thenThrow(
      const SocketException("Error"),
    );

    final hasNetwork = await connectionService.hasNetwork();

    expect(hasNetwork, false);
  });
}
