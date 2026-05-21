import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sync_connectivity.g.dart';

@Riverpod(keepAlive: true)
Connectivity connectivity(Ref ref) => Connectivity();

@Riverpod(keepAlive: true)
InternetConnection internetConnection(Ref ref) => InternetConnection();

/// Verifies that sync HTTP requests are allowed under current network conditions.
final class SyncConnectivity {
  SyncConnectivity({
    required Connectivity connectivity,
    required InternetConnection internetConnection,
  })  : _connectivity = connectivity,
        _internetConnection = internetConnection;

  final Connectivity _connectivity;
  final InternetConnection _internetConnection;

  Future<bool> canSync({required bool wifiOnlySync}) async {
    if (!await _hasInternet()) return false;
    if (!wifiOnlySync) return true;
    return _isOnWifi();
  }

  Future<bool> _hasInternet() => _internetConnection.hasInternetAccess;

  Future<bool> _isOnWifi() async {
    final results = await _connectivity.checkConnectivity();
    return results.contains(ConnectivityResult.wifi);
  }
}

@Riverpod(keepAlive: true)
SyncConnectivity syncConnectivity(Ref ref) => SyncConnectivity(
      connectivity: ref.watch(connectivityProvider),
      internetConnection: ref.watch(internetConnectionProvider),
    );
