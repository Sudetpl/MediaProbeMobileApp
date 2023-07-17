import 'dart:async';

import 'package:flutter/material.dart';
import 'package:media_probe_mobile_app/core/theme/light_theme.dart';
import 'package:media_probe_mobile_app/utils/routes/route_names.dart';
import 'package:media_probe_mobile_app/utils/routes/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runZonedGuarded(
    () => runApp(const MyApp()),
    (error, stack) {
      debugPrint('runZonedGuarded: Caught error in my root zone.');
      debugPrint(error.toString());
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: const [
        Locale('en'),
        Locale('tr'),
      ],
      debugShowCheckedModeBanner: false,
      title: AppLocalizations.of(context)?.appTitle ?? '',
      theme: themeData,
      initialRoute: RouteNames.splash,
      routes: routes,
    );
  }
}
