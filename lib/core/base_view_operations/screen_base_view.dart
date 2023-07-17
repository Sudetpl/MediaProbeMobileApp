import 'package:flutter/material.dart';

class ScreenBaseWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final Widget body;
  final Widget? title;
  final String? searchAreaTitle;
  final VoidCallback? searchAreaFunction;
  final List<Widget>? actionButtons;
  final List<Widget>? leadingButtons;
  final bool? floatingButtonExists;
  final VoidCallback? floatingButtonAction;
  final Color? floatingActionButtonBackground;
  final Widget? floatingActionButtonContent;
  final EdgeInsetsGeometry? floatingActionButtonMargin;
  final Widget? appbarExtraContent;
  final bool appbarExists;
  final VoidCallback? backButtonFunction;
  final Widget? bottomBar;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  final bool? displayTitleMultiline;
  final PreferredSizeWidget? appBarWidget;
  final bool? resizeToAvoidBottomInset;
  final Color? scaffoldBackgroundColor;
  final Color? safeAreaColor;
  final Widget? drawer;
  final String? floatActionButtonContent;

  const ScreenBaseWidget(
      {Key? key,
      required this.body,
      this.scaffoldKey,
      this.title,
      this.displayTitleMultiline = false,
      this.actionButtons,
      this.searchAreaTitle,
      this.appbarExtraContent,
      this.appbarExists = true,
      this.backButtonFunction,
      this.leadingButtons,
      this.bottomBar,
      this.searchAreaFunction,
      this.floatingButtonAction,
      this.floatingActionButtonBackground,
      this.floatingActionButtonContent,
      this.floatingButtonExists,
      this.floatingActionButtonMargin,
      this.floatingActionButtonLocation =
          FloatingActionButtonLocation.centerDocked,
      this.floatActionButtonContent,
      this.appBarWidget,
      this.resizeToAvoidBottomInset,
      this.scaffoldBackgroundColor,
      this.drawer,
      this.safeAreaColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isFirst = ModalRoute.of(context)?.isFirst ?? false;

    return ColoredBox(
      color: safeAreaColor ??
          scaffoldBackgroundColor ??
          Theme.of(context).primaryColor,
      child: SafeArea(
        top: false,
        bottom: false,
        child: ColoredBox(
          color: Theme.of(context).primaryColor,
          child: WillPopScope(
            onWillPop: isFirst ? () => Future.value(false) : null,
            child: Theme(
              data: Theme.of(context),
              child: Scaffold(
                drawer: drawer,
                resizeToAvoidBottomInset: resizeToAvoidBottomInset,
                key: scaffoldKey,
                bottomNavigationBar: bottomBar,
                appBar: appBarWidget,
                body: GestureDetector(
                  onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                  child: Stack(
                    children: [
                      SizedBox.expand(
                        child: ColoredBox(
                          color: scaffoldBackgroundColor ??
                              const Color(0xffffffff),
                          child: body,
                        ),
                      ),
                    ],
                  ),
                ),
                floatingActionButtonLocation: floatingActionButtonLocation,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
