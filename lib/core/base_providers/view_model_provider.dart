import 'package:flutter/material.dart';
import 'package:media_probe_mobile_app/core/base_providers/base_viewmodel.dart';
import 'package:provider/provider.dart';

class ViewModelProvider<T extends BaseViewModel> extends StatelessWidget {
  final BaseViewModel model;
  final Widget Function(T model) builder;

  const ViewModelProvider({
    super.key,
    required this.model,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
        lazy: true,
        create: (BuildContext context2) => model as T,
        child: Consumer<T>(
          builder: (
            BuildContext context,
            T value,
            Widget? child,
          ) =>
              builder(value),
        ));
  }
}
