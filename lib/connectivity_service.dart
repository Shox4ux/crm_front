import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkStatusService {
  NetworkStatusService._();
  static final instance = NetworkStatusService._();

  final _controller = StreamController<bool>.broadcast();
  bool _isOnline = true;

  Stream<bool> get stream => _controller.stream;
  bool get isOnline => _isOnline;

  void initialize() {
    Connectivity().onConnectivityChanged.listen((connectivityResult) async {
      final hasInternet = connectivityResult != ConnectivityResult.none;
      _isOnline = hasInternet;
      _controller.add(_isOnline);
    });
  }
}
