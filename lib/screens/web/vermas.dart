import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../utils/responsive.dart';

class VerMas extends StatelessWidget {
  final Map info;

  const VerMas({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          info['img'][0],
          height: Responsive.of(context).wm(25),
        ),
        Text(info['name']),
        Text(info['description']),
        Text("Tecnologias"),
        Row(
          children: [
            Logo("assets/logos/flutter.svg"),
          ],
        )
      ],
    );
  }
}
