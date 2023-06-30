import 'package:flutter/material.dart';
import 'package:portafolio_virtual/provider/contacto.dart';
import 'package:portafolio_virtual/services/email.dart';
import 'package:provider/provider.dart';

import '../../utils/responsive.dart';

class Contacto extends StatelessWidget {
  const Contacto({super.key});

  @override
  Widget build(BuildContext context) {
    final sized = MediaQuery.of(context).size;

    final providerContacto = Provider.of<ContactoFormProvider>(context);
    List camposText = providerContacto.getCamposForm();
    TextStyle styleTextButtons = TextStyle(
        fontSize: Responsive.of(context).wp(1.5) < 14
            ? 14
            : Responsive.of(context).wp(1.4));
    return SizedBox(
      width: sized.width * 0.3,
      child: Form(
          key: providerContacto.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Contactame!",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              for (int i = 0; i < camposText.length; i++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(camposText[i]["name"]),
                    const SizedBox(height: 10),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: camposText[i]["keyboardType"],
                      maxLines: camposText[i]["maxline"],
                      validator: (value) => providerContacto.getValidation(
                              camposText[i]["validation"], value)
                          ? null
                          : camposText[i]["message"],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: Responsive.of(context).wm(13),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xFF3E3E61))),
                        onPressed: () async {
                          if (providerContacto.isValiForm()) {
                            int data = await Email.setEmail(
                                providerContacto.email,
                                providerContacto.nombre,
                                providerContacto.message);

                            print(data);
                          }
                        },
                        child: Text(
                          "Enviar",
                          style: styleTextButtons,
                        )),
                  ),
                  SizedBox(
                    width: Responsive.of(context).wm(13),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xFF3E3E61))),
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          "Cancelar",
                          style: styleTextButtons,
                        )),
                  )
                ],
              )
            ],
          )),
    );
  }
}
