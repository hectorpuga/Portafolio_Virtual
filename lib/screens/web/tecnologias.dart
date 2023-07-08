import 'dart:ui';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:portafolio_virtual/provider/info.dart';
import 'package:provider/provider.dart';

import '../../utils/responsive.dart';

class Tecnologias extends StatelessWidget {
  const Tecnologias({super.key});

  @override
  Widget build(BuildContext context) {
    final info = Provider.of<Information>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            ButtonsTabBar(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: Responsive.of(context).wm(3)!),
              backgroundColor: Colors.red,
              unselectedBackgroundColor: Colors.grey[300],
              unselectedLabelStyle: const TextStyle(color: Colors.black),
              labelStyle: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
              tabs: const [
                Tab(
                  text: "Lenguajes",
                ),
                Tab(
                  text: "Frameworks",
                ),
                Tab(
                  text: "Herramientas",
                  icon: Icon(LineIcons.tools),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  CardWidgetTecnology(info: info.tecnologias),
                  CardWidgetTecnology(info: info.frameworks),
                  CardWidgetTecnology(info: info.herramientas),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardWidgetTecnology extends StatelessWidget {
  final List info;

  const CardWidgetTecnology({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.symmetric(
            horizontal: Responsive.of(context).wp(5),
            vertical: Responsive.of(context).hm(8)!),
        itemCount: info.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 2,
            crossAxisCount: Responsive.of(context).wp(100) < 600 ? 1 : 3,
            crossAxisSpacing: Responsive.of(context).wp(2),
            mainAxisSpacing: Responsive.of(context).hm(1)!),
        itemBuilder: (context, i) => SvgPicture.asset(
              info[i]["img"],
              placeholderBuilder: (BuildContext context) => Image.asset(
                "assets/loading.gif",
                fit: BoxFit.fill,
              ),
            ));
  }
}
