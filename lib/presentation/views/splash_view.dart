import 'package:flutter/material.dart';
import 'package:media_probe_mobile_app/core/base_providers/view_model_provider.dart';
import 'package:media_probe_mobile_app/core/base_view_operations/screen_base_view.dart';
import 'package:media_probe_mobile_app/core/viewmodels/splash_view_model.dart';
import 'package:media_probe_mobile_app/presentation/widgets/splash_animated_logo_widget.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenBaseWidget(
      scaffoldBackgroundColor: Colors.deepPurple,
      body: ViewModelProvider<SplashViewModel>(
        model: SplashViewModel(context: context),
        builder: (model) {
          return const AnimatedLogo();
        },
      ),
    );
  }
}
