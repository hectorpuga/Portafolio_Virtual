import 'package:flutter/material.dart';
import 'package:portafolio_virtual/provider/contact.dart';
import 'package:portafolio_virtual/services/email.dart';
import 'package:provider/provider.dart';

import '../../utils/responsive.dart';
import '../../widgets/baseform_usuario.dart';

class Contacto extends StatelessWidget {
  const Contacto({super.key});

  @override
  Widget build(BuildContext context) {
    final formContacto = Provider.of<ContactoForm>(context);
    return BaseContacto(
      formulario: Form(
          key: formContacto.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Nombre"),
              const SizedBox(height: 10),
              TextFormField(
                onChanged: (value) => {formContacto.nombre = value},
              ),
              const SizedBox(height: 20),
              const Text("Correo"),
              const SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) => {formContacto.email = value},
              ),
              const SizedBox(height: 20),
              const Text("Mensaje"),
              const SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                textAlign: TextAlign.justify,
                onChanged: (value) => {formContacto.message = value},
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
                        onPressed: () async {
                          print("Hoa");
                          await Email.setEmail(formContacto.email,
                              formContacto.nombre, formContacto.message);
                        },
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
