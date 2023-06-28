import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Email extends ChangeNotifier {
  static setEmail(String email, String name, String message) async {
    var url =
        Uri.https('deploy-api-portafolio.onrender.com', 'api/usuarios/email');
    var response = await http
        .post(url, body: {"email": email, "name": name, "message": message});
    print('Response status: ${response.statusCode}');
  }
}
