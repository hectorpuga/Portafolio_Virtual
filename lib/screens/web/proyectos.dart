import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portafolio_virtual/provider/info.dart';
import 'package:provider/provider.dart';

import '../../utils/responsive.dart';

class Proyectos extends StatelessWidget {
  const Proyectos({super.key});

  @override
  Widget build(BuildContext context) {
    final info = Provider.of<Information>(context);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: DefaultTabController(
          length: 4,
          child: Column(
            children: [
              ButtonsTabBar(
                contentPadding: const EdgeInsets.symmetric(horizontal: 40),
                backgroundColor: const Color(0xFF3E3E61),
                unselectedBackgroundColor: Colors.grey[300],
                unselectedLabelStyle: const TextStyle(color: Colors.black),
                labelStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                tabs: const [
                  Tab(
                    text: "  All  ",
                  ),
                  Tab(
                    text: "Mobile",
                  ),
                  Tab(
                    text: "Desktop",
                  ),
                  Tab(
                    text: "Web",
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    CardWidgetProyect(info: info.all),
                    CardWidgetProyect(info: info.mobile),
                    CardWidgetProyect(info: info.desktop),
                    CardWidgetProyect(info: info.web),
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

class CardWidgetProyect extends StatelessWidget {
  final List info;

  const CardWidgetProyect({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.symmetric(
            horizontal: Responsive.of(context).wp(4),
            vertical: Responsive.of(context).hm(8)!),
        itemCount: info.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.5,
            crossAxisCount: 2,
            crossAxisSpacing: Responsive.of(context).wp(3),
            mainAxisSpacing: Responsive.of(context).hm(5)!),
        itemBuilder: (context, indexGrid) => ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Tooltip(
                message: "Ver mas",
                child: Stack(
                  children: [
                    Swiper(
                      autoplay: true,
                      itemBuilder: (c, i) {
                        return SvgPicture.asset(
                          info[indexGrid]["img"][i],
                          fit: BoxFit.fill,
                          placeholderBuilder: (BuildContext context) =>
                              Image.asset(
                            "assets/loading.gif",
                            fit: BoxFit.fill,
                            height: Responsive.of(context).wp(33),
                          ),
                          width: Responsive.of(context).wp(41),
                        );
                      },
                      pagination:
                          SwiperPagination(margin: EdgeInsets.all(10.0)),
                      itemCount: info[indexGrid]["img"].length,
                    ),
                    Text(info[indexGrid]["name"])
                  ],
                ),
              ),
            ));
  }
}
