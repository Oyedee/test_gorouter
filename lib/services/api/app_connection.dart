import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionStatus {
  static Future<bool> isConnected() async {
    final connectionResult = await Connectivity().checkConnectivity();

    if (connectionResult == ConnectivityResult.mobile || connectionResult == ConnectivityResult.bluetooth) {
      return true;
    } else if (connectionResult == ConnectivityResult.wifi || connectionResult == ConnectivityResult.ethernet) {
      return true;
    } else if (connectionResult == ConnectivityResult.vpn) {
      return true;
    } else {
      return false;
    }
  }
}
