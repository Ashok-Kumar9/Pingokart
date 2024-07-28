import 'dart:async';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';

class RemoteConfigProvider with ChangeNotifier {
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;
  bool _showDiscountedPrice = false;
  Timer? _periodicFetchTimer;

  bool get showDiscountedPrice => _showDiscountedPrice;

  RemoteConfigProvider() {
    _initializeRemoteConfig();
  }

  Future<void> _initializeRemoteConfig() async {
    await _remoteConfig.setDefaults({
      'show_discounted_price': false,
    });

    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(minutes: 30),
      ),
    );

    await _fetchAndActivate();

    _periodicFetchTimer =
        Timer.periodic(const Duration(hours: 1), (_) => _fetchAndActivate());
  }

  Future<void> _fetchAndActivate() async {
    try {
      await _remoteConfig.fetchAndActivate();
      _updateShowDiscountedPrice();
    } catch (e) {
      print('Error fetching remote config: $e');
    }
  }

  void _updateShowDiscountedPrice() {
    final newValue = _remoteConfig.getBool('show_discounted_price');
    if (newValue != _showDiscountedPrice) {
      _showDiscountedPrice = newValue;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _periodicFetchTimer?.cancel();
    super.dispose();
  }
}
