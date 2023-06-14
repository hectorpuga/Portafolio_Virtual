import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

class ChangeApp extends ChangeNotifier {
  final _controller = SidebarXController(selectedIndex: 0, extended: false);

  get controllerSideNav => _controller;
}
