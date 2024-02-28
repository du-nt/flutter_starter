import 'package:fl_query/fl_query.dart';
import 'package:flutter/material.dart';

class WithIndicatorScaffold<DataType, ErrorType> extends StatelessWidget {
  final Query<DataType, ErrorType> query;
  final Widget child;
  final Color? backgroundColor;
  final Widget? floatingActionButton;
  final PreferredSizeWidget? appBar;

  const WithIndicatorScaffold(
      {Key? key,
      required this.query,
      required this.child,
      this.backgroundColor,
      this.floatingActionButton,
      this.appBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        floatingActionButton: floatingActionButton,
        appBar: appBar,
        body: Visibility(
          visible: query.isLoading,
          replacement: RefreshIndicator(
            onRefresh: query.refresh,
            child: child,
          ),
          child: const Center(child: CircularProgressIndicator()),
        ));
  }
}
