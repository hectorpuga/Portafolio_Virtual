import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

import '../theme/themebarra.dart';

class BarraDeNavegacion extends StatelessWidget {
  const BarraDeNavegacion({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    final sized = MediaQuery.of(context).size;

    return SidebarX(
      controller: _controller,
      theme: ThemeNavigationBarra.buttonNavigation,
      extendedTheme: const SidebarXTheme(
        width: 140,
        decoration: BoxDecoration(
          color: canvasColor,
        ),
      ),
      footerDivider: divider,
      headerDivider: SizedBox(
        height: sized.height * 0.1,
      ),
      items: [
        SidebarXItem(
          iconWidget: SizedBox(
              height: 30, width: 30, child: Image.asset("assets/inicio.png")),
          label: 'Inicio',
          onTap: () {
            debugPrint('Home');
          },
        ),
        SidebarXItem(
            iconWidget: SizedBox(
                height: 30,
                width: 30,
                child: Image.asset("assets/proyectos.png")),
            label: 'Proyectos',
            onTap: () {
              _controller.selectIndex(2);

              print(_controller.selectedIndex);
            }),
        SidebarXItem(
          iconWidget: SizedBox(
              height: 30,
              width: 30,
              child: Image.asset("assets/tecnologias.png")),
          label: 'Tecnologias',
        ),
        SidebarXItem(
          iconWidget: SizedBox(
              height: 30,
              width: 30,
              child: Image.asset("assets/acerca_de_mi.png")),
          label: 'Acerca demi',
        ),
      ],
    );
  }
}
