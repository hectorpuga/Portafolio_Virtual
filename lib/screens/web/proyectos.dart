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
        child: GridView.builder(
            padding: EdgeInsets.symmetric(
                horizontal: Responsive.of(context).wp(4),
                vertical: Responsive.of(context).hm(8)!),
            itemCount: info.opciones.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.25,
                crossAxisCount: 2,
                crossAxisSpacing: Responsive.of(context).wp(5),
                mainAxisSpacing: Responsive.of(context).hm(5)!),
            itemBuilder: (context, i) => Container(
                decoration: _createCardShape(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          info.opciones[i]["img"],
                          fit: BoxFit.fill,
                          placeholderBuilder: (BuildContext context) =>
                              Image.asset(
                            "assets/loading.gif",
                          ),
                          width: Responsive.of(context).wp(40),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                info.opciones[i]["name"],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Responsive.of(context).wp(1.6)),
                              ),
                              Text(
                                info.opciones[i]["description"],
                                maxLines: 10,
                                softWrap: true,
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: Responsive.of(context).wp(1.3)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ))));
  }

  BoxDecoration _createCardShape() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 15, offset: Offset(0, 5))
        ]);
  }
}
