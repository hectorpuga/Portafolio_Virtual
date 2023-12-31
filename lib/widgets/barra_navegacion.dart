import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

import '../theme/themebarra.dart';
import '../utils/responsive.dart';

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
      theme: ThemeNavigationBarra.buttonNavigation.copyWith(
        margin: EdgeInsets.symmetric(vertical: Responsive.of(context).hm(10)!),
      ),
      extendedTheme: const SidebarXTheme(
        width: 180,
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
          iconWidget: Tooltip(
            message: "Home",
            child: SizedBox(
                height: 30, width: 30, child: Image.asset("assets/inicio.png")),
          ),
          label: 'Inicio',
          onTap: () {},
        ),
        SidebarXItem(
            iconWidget: Tooltip(
              message: "Proyectos",
              child: SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset("assets/proyectos.png")),
            ),
            label: 'Proyectos',
            onTap: () {}),
        SidebarXItem(
            iconWidget: Tooltip(
              message: "Tecnologias",
              child: SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset("assets/tecnologias.png")),
            ),
            label: 'Tecnologias',
            onTap: () {}),
        SidebarXItem(
          iconWidget: Tooltip(
            // preferBelow: false,
            // verticalOffset: -18,
            message: "Acerca de mi",
            child: SizedBox(
                height: 30,
                width: 30,
                child: Image.asset("assets/acerca_de_mi.png")),
          ),
          label: 'Acerca de mi',
        ),
      ],
    );
  }
}
