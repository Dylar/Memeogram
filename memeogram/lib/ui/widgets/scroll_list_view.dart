import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollListView<T> extends StatelessWidget {
  ScrollListView({
    @required this.items,
    @required this.buildItemWidget,
    this.footerWidget,
    this.emptyWidget,
    ScrollController scrollController,
  }) : scrollController = scrollController ?? ScrollController();

  final ScrollController scrollController;

  final List<T> items;
  final Widget footerWidget, emptyWidget;
  final Widget Function(int index, T item) buildItemWidget;

  Widget get _loadingIndicator =>
      const Center(child: CircularProgressIndicator());

  int get itemCount => items.length + (footerWidget == null ? 0 : 1);

  @override
  Widget build(BuildContext context) {
    if (items == null) {
      return _loadingIndicator;
    }

    if (items.isEmpty) {
      return emptyWidget ?? Container();
    }

    return CupertinoScrollbar(
      isAlwaysShown: true,
      controller: scrollController,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ListView.builder(
            controller: scrollController,
            shrinkWrap: true,
            itemCount: itemCount,
            itemBuilder: (BuildContext context, int position) {
              if (footerWidget != null && position == items.length) {
                return footerWidget;
              } else {
                return buildItemWidget(position, items[position]);
              }
            }),
      ),
    );
  }
}
