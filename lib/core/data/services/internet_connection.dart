
  import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

Future<bool> checkConnection() async {
    bool connection = await InternetConnectionCheckerPlus().hasConnection;
    final listener = InternetConnectionCheckerPlus()
        .onStatusChange
        .listen((InternetConnectionStatus status) {
      if (status == InternetConnectionStatus.connected) {
        print('connected');
        connection = true;
      } else if (status == InternetConnectionStatus.disconnected) {
        print('disconnected');
        connection = false;
      }
    });

    return connection;
  }
