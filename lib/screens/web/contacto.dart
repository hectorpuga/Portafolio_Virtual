import 'package:flutter/material.dart';

import '../../utils/responsive.dart';
import '../../widgets/baseform_usuario.dart';

class Contacto extends StatelessWidget {
  const Contacto({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseContacto(
      formulario: Form(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Nombre"),
          const SizedBox(height: 10),
          TextFormField(),
          const SizedBox(height: 20),
          const Text("Correo"),
          const SizedBox(height: 10),
          TextFormField(keyboardType: TextInputType.emailAddress),
          const SizedBox(height: 20),
          const Text("Mensaje"),
          const SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.multiline,
            maxLines: 10,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: Responsive.of(context).wm(13),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red)),
                    onPressed: () {},
                    child: const Text("Enviar")),
              ),
              SizedBox(
                width: Responsive.of(context).wm(13),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancelar")),
              )
            ],
          )
        ],
      )),
    );
  }
}
