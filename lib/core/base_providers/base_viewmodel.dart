import 'package:flutter/material.dart';

abstract class BaseViewModel extends ChangeNotifier {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late final BuildContext context;
  bool isDisposing = false;
  bool isLoading = false;
  bool isBackButtonEnabled = false;
  ThemeData get theme => Theme.of(context);
  bool isInited = false;

  TextTheme get textTheme => theme.textTheme;

  // String get accessToken =>
  //     userDataProvider.userData?.tokenModel?.accessToken ?? '';

  BaseViewModel({required this.context}) {
    initViewModel();
  }

  Future initViewModel() async {
    isDisposing = false;

    return Future.value();
  }

  void triggerNotify({bool force = false}) {
    if (!force && isDisposing) return;
    notifyListeners();
  }

  void showSnackBar(SnackBar content) {
    if (!isDisposing) {
      ScaffoldMessenger.maybeOf(context)?.hideCurrentSnackBar();
    }
    ScaffoldMessenger.maybeOf(context)?.showSnackBar(content);
  }

  @override
  void dispose() {
    isDisposing = true;
    super.dispose();
  }

  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
