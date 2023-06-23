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
            padding: const EdgeInsets.all(20),
            itemCount: info.opciones.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder: (context, i) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: SingleChildScrollView(
                    child: Container(
                        decoration: _createCardShape(),
                        child: Column(
                          children: [
                            Text(
                              info.opciones[i]["name"],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: Responsive.of(context).wp(3),
                                  fontWeight: FontWeight.bold),
                            ),
                            SvgPicture.asset(
                              info.opciones[i]["img"],
                              placeholderBuilder: (BuildContext context) =>
                                  Image.asset("assets/loading.gif",
                                      width: Responsive.of(context).wp(10),
                                      fit: BoxFit.cover),
                              width: Responsive.of(context).wp(25),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                info.opciones[i]["description"],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: Responsive.of(context).wp(1.3)),
                                textAlign: TextAlign.justify,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 10,
                              ),
                            ),
                          ],
                        )),
                  ),
                )));
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
