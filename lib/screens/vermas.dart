import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icons_plus/icons_plus.dart';

import '../utils/responsive.dart';

class VerMas extends StatelessWidget {
  final Map info;

  const VerMas({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SvgPicture.asset(
          info['img'][0],
          height: Responsive.of(context).wm(25),
        ),
        Text(info['name']),
        SizedBox(
          height: Responsive.of(context).hm(2),
        ),
        Text(
          info['description'],
          style: TextStyle(fontWeight: FontWeight.normal),
          textAlign: TextAlign.justify,
        ),
        SizedBox(
          height: Responsive.of(context).hm(2),
        ),
        Text("Tecnologias"),
        SizedBox(
          height: Responsive.of(context).hm(2),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < info['tecnologias_img'].length; i++)
              Tooltip(
                  message: info['tecnologias_name'][i],
                  child: Logo(info['tecnologias_img'][i])),
          ],
        ),
        SizedBox(
          height: Responsive.of(context).hm(6),
        ),
        SizedBox(
          height: Responsive.of(context).hm(7),
          width: Responsive.of(context).wm(50),
          child: ElevatedButton(onPressed: () {}, child: Text("Github")),
        )
      ],
    );
  }
}
