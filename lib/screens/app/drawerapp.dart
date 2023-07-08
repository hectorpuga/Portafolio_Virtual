import 'package:flutter/material.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFF3E3E61),
      child: ListView(
        children: [
          ListTile(
            leading: SizedBox(
                height: 30, width: 30, child: Image.asset("assets/inicio.png")),
            title: Text('Home'),
            onTap: () {},
          ),
          ListTile(
            leading: SizedBox(
                height: 30,
                width: 30,
                child: Image.asset("assets/proyectos.png")),
            title: Text('Proyectos'),
            onTap: () {},
          ),
          ListTile(
            leading: SizedBox(
                height: 30,
                width: 30,
                child: Image.asset("assets/tecnologias.png")),
            title: Text('Tecnologias'),
            onTap: () {},
          ),
          ListTile(
            leading: SizedBox(
                height: 30,
                width: 30,
                child: Image.asset("assets/acerca_de_mi.png")),
            title: Text('Acerca de mi'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
