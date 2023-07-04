import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/gestures.dart';
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
    final info2 = Provider.of<Information>(context);

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
        itemBuilder: (context, indexGrid) => GestureDetector(
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                onEnter: (PointerEnterEvent event) {
                  info2.isText = indexGrid;
                },
                onExit: (event) {
                  info2.isText = -1;
                },
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Swiper(
                        onTap: (value) {},
                        autoplay: true,
                        itemBuilder: (c, i) {
                          return SvgPicture.asset(
                            info[indexGrid]["img"][i],
                            fit: BoxFit.fill,
                            width: Responsive.of(context).wp(41),
                          );
                        },
                        pagination: const SwiperPagination(
                            margin: EdgeInsets.all(10.0)),
                        itemCount: info[indexGrid]["img"].length,
                      ),
                    ),
                    if (info2.isText == indexGrid)
                      const Center(
                        child: Text("Ver mas",
                            style: TextStyle(color: Colors.indigo)),
                      ),
                    if (info2.isText == indexGrid)
                      Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: Responsive.of(context).hm(5),
                                  decoration: BoxDecoration(
                                      color: Colors.lightBlueAccent,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Center(
                                    child: Text(info[indexGrid]["name"],
                                        style: const TextStyle(
                                            color: Colors.black)),
                                  ),
                                ),
                              ],
                            ),
                          ])
                  ],
                ),
              ),
            ));
  }
}
