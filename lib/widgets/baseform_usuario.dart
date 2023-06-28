import 'package:flutter/material.dart';

class BaseContacto extends StatelessWidget {
  final Widget formulario;
  const BaseContacto({super.key, required this.formulario});

  @override
  Widget build(BuildContext context) {
    final sized = MediaQuery.of(context).size;
    return SizedBox(
      width: sized.width * 0.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Contactame!",
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          formulario
        ],
      ),
    );
  }
}
