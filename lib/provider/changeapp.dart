import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

class ChangeApp extends ChangeNotifier {
  final _controller = SidebarXController(selectedIndex: 0, extended: false);

  SidebarXController get controllerSideNav => _controller;

  set selectIndex(int i) {
    _controller.selectIndex(i);
    notifyListeners();
  }
}
