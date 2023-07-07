import 'dart:ui';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:portafolio_virtual/provider/changeapp.dart';
import 'package:portafolio_virtual/provider/info.dart';
import 'package:portafolio_virtual/screens/web/vermas.dart';
import 'package:provider/provider.dart';

import '../../utils/responsive.dart';
import 'contacto.dart';

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
                    icon: Icon(LineIcons.github),
                  ),
                  Tab(
                    text: "Mobile",
                    icon: Icon(LineIcons.mobilePhone, size: 17),
                  ),
                  Tab(
                    text: "Desktop",
                    icon: Icon(LineIcons.desktop),
                  ),
                  Tab(
                    text: "Web",
                    icon: Icon(LineIcons.chrome),
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
    final changeApp = Provider.of<ChangeApp>(context);

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
        itemBuilder: (context, indexGrid) {
          changeApp.opacity.add(1.0);
          return GestureDetector(
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (PointerEnterEvent event) {
                info2.isText = indexGrid;
                changeApp.opacitySet(indexGrid, 0.1);
              },
              onExit: (event) {
                info2.isText = -1;
                changeApp.opacitySet(indexGrid, 1.0);
              },
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Opacity(
                      opacity: changeApp.opacity[
                          indexGrid], // Nivel de opacidad deseado (0.0 a 1.0)
                      child: Swiper(
                        onTap: (value) {
                          _mostrarAlert(context, info[indexGrid]);
                        },
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
                  ),
                  if (info2.isText == indexGrid)
                    const Center(
                      child: Text("Ver mas",
                          style: TextStyle(color: Colors.indigo)),
                    ),
                  if (info2.isText == indexGrid)
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
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
                                  style: const TextStyle(color: Colors.black)),
                            ),
                          ),
                        ],
                      ),
                    ])
                ],
              ),
            ),
          );
        });
  }

  void _mostrarAlert(BuildContext context, Map info) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: 10,
                sigmaY: 10), // Configura la intensidad del desenfoque(
            child: AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                content: SizedBox(
                  width: Responsive.of(context).wm(40),
                  height: Responsive.of(context).hm(70),
                  child: SingleChildScrollView(
                    child: VerMas(
                      info: info,
                    ),
                  ),
                )),
          );
        });
  }
}
