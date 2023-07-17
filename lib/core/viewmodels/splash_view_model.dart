import 'dart:async';

import 'package:flutter/material.dart';
import 'package:media_probe_mobile_app/core/base_providers/base_viewmodel.dart';
import 'package:media_probe_mobile_app/presentation/views/home_view.dart';

class SplashViewModel extends BaseViewModel {
  SplashViewModel({required super.context});

  @override
  Future initViewModel() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyHomePage()),
      );
    });
    return super.initViewModel();
  }
}
