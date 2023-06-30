import 'dart:ui';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portafolio_virtual/provider/info.dart';
import 'package:provider/provider.dart';

import '../../utils/responsive.dart';

class Tecnologias extends StatelessWidget {
  const Tecnologias({super.key});

  @override
  Widget build(BuildContext context) {
    final info = Provider.of<Information>(context);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: <Widget>[
              ButtonsTabBar(
                contentPadding: EdgeInsets.symmetric(horizontal: 40),
                backgroundColor: Colors.red,
                unselectedBackgroundColor: Colors.grey[300],
                unselectedLabelStyle: TextStyle(color: Colors.black),
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
            childAspectRatio: 1.25,
            crossAxisCount: 3,
            crossAxisSpacing: Responsive.of(context).wp(5),
            mainAxisSpacing: Responsive.of(context).hm(5)!),
        itemBuilder: (context, i) => ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: 10, sigmaY: 10, tileMode: TileMode.repeated),
                child: Container(
                  height: 180,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: SvgPicture.asset(
                    info[i]["img"],
                    placeholderBuilder: (BuildContext context) => Image.asset(
                      "assets/loading.gif",
                      fit: BoxFit.fill,
                      height: Responsive.of(context).wp(25),
                      width: Responsive.of(context).wp(25),
                    ),
                  ),
                ),
              ),
            ));
  }
}
