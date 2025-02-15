import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portail_salarie/GBSystem_X_Developpement/packages/popup_package/popup_menu_plus.dart';
import 'package:portail_salarie/GBSystem_X_Developpement/packages/popup_package/src/menu_layout.dart';

import 'menu_item_widget.dart';

/// Grid menu layout
class GridMenuLayout implements MenuLayout {
  final MenuConfig config;
  final List<PopUpMenuItemProvider> items;
  final VoidCallback onDismiss;
  final BuildContext context;
  final MenuClickCallback? onClickMenu;

  GridMenuLayout({
    required this.config,
    required this.items,
    required this.onDismiss,
    required this.context,
    this.onClickMenu,
  }) {
    _calculateRowAndCol();
  }

  /// row count
  int _row = 1;

  /// col count
  int _col = 1;

  /// The max column count, default is 4.
  final int _maxColumn = 4;

  /// calculate the menu row and col count
  void _calculateRowAndCol() {
    _col = _calculateColCount();
    _row = _calculateRowCount();
  }

  double menuWidth() {
    return config.itemWidth * _col * 1.5;
  }

  // This height exclude the arrow
  double menuHeight() {
    return config.itemHeight * _row * 1.5;
  }

  // 创建行
  List<Widget> _createRows() {
    List<Widget> rows = [];
    for (int i = 0; i < _row; i++) {
      Color color =
          (i < _row - 1 && _row != 1) ? config.lineColor : Colors.transparent;
      Widget rowWidget = Container(
        decoration:
            BoxDecoration(border: Border(bottom: BorderSide(color: color))),
        height: config.itemHeight * 1.5,
        child: Row(
          children: _createRowItems(i),
        ),
      );

      rows.add(rowWidget);
    }

    return rows;
  }

  // 创建一行的item,  row 从0开始算
  List<Widget> _createRowItems(int row) {
    List<PopUpMenuItemProvider> subItems =
        items.sublist(row * _col, min(row * _col + _col, items.length));
    List<Widget> itemWidgets = [];
    int i = 0;
    for (var item in subItems) {
      itemWidgets.add(_createMenuItem(
        item,
        i < (_col - 1),
      ));
      i++;
    }

    return itemWidgets;
  }

  // calculate row count
  int _calculateRowCount() {
    if (items.isEmpty) {
      debugPrint('error menu items can not be null');
      return 0;
    }

    int itemCount = items.length;

    if (_calculateColCount() == 1) {
      return itemCount;
    }

    int row = (itemCount - 1) ~/ _calculateColCount() + 1;

    return row;
  }

  // calculate col count
  int _calculateColCount() {
    assert(items.isNotEmpty, 'error: menu items can not be null');

    int itemCount = items.length;
    if (_maxColumn != 4 && _maxColumn > 0) {
      return _maxColumn;
    }

    if (itemCount == 4) {
      // 4个显示成两行
      return 2;
    }

    if (itemCount <= _maxColumn) {
      return itemCount;
    }

    if (itemCount == 5) {
      return 3;
    }

    if (itemCount == 6) {
      return 3;
    }

    return _maxColumn;
  }

  Widget _createMenuItem(PopUpMenuItemProvider item, bool showLine) {
    return MenuItemWidget(
      item: item,
      showLine: showLine,
      clickCallback: itemClicked,
      lineColor: config.lineColor,
      backgroundColor: config.backgroundColor,
      highlightColor: config.highlightColor,
    );
  }

  void itemClicked(PopUpMenuItemProvider item) {
    onClickMenu?.call(item);
    onDismiss();
  }

  @override
  Widget build() {
    return SizedBox(
      width: menuWidth(),
      height: menuHeight(),
      child: Column(
        children: <Widget>[
          ClipRRect(
              borderRadius: config.borderRadius ?? BorderRadius.zero,
              child: Container(
                width: menuWidth(),
                height: menuHeight(),
                decoration: BoxDecoration(
                  color: config.backgroundColor,
                  border: config.border != null
                      ? Border.all(
                          color: config.border!.color,
                          width: config.border!.width,
                        )
                      : null,
                  borderRadius: config.borderRadius,
                ),
                child: Column(
                  children: _createRows(),
                ),
              )),
        ],
      ),
    );
  }

  @override
  double get height => menuHeight();

  @override
  double get width => menuWidth();
}
