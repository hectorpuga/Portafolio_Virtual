import 'package:flutter/material.dart';

class ContactoForm extends ChangeNotifier {
  String nombre = '';
  String email = '';
  String message = '';

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isValiForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
