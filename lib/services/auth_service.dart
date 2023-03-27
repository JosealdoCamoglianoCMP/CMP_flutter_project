import 'dart:convert';

import 'package:cmp_flutter_web/models/strapi_user_model.dart';
import 'package:cmp_flutter_web/shared/constants/app_constants.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final app = AppConstants();

  Future<dynamic> login(String username, String password) async {
    final url = Uri.https(app.strapiUrl, '/api/auth/local');
    try {
      final response = await http.post(url,
          headers: app.headers,
          body: json.encode({
            'identifier': username,
            'password': password,
          }));
      if (response.statusCode == 200) {
        return {
          'success': true,
          'data': StrapiUserModel.fromJson(response.body),
        };
      } else {
        return {
          'success': false,
          'data': 'Usuario no encontrado', //TODO: Ver más validaciones
        };
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
