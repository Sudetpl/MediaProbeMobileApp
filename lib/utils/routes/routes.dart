import 'package:flutter/material.dart';
import 'package:media_probe_mobile_app/presentation/views/article_detail_view.dart';
import 'package:media_probe_mobile_app/presentation/views/home_view.dart';
import 'package:media_probe_mobile_app/presentation/views/splash_view.dart';

final routes = <String, WidgetBuilder>{
  '/splash': (BuildContext context) => const SplashPage(),
  '/home': (BuildContext context) => const MyHomePage(),
  '/articleDetail': (BuildContext context) => const DetailPage(),
};
