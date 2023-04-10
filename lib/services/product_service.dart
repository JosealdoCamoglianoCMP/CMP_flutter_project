import 'dart:convert';

import 'package:cmp_flutter_web/models/product.dart';
import 'package:cmp_flutter_web/shared/constants/app_constants.dart';
import 'package:http/http.dart' as http;

class ProductService {
  final app = AppConstants();

  Future<dynamic> getProducts(int page) async {
    final url = Uri.https(app.cmpUrl, '/wp-json/wc/v3/products', {
      'consumer_key': app.consumerKey,
      'consumer_secret': app.consumerSecret,
      'per_page': '60',
      'page': page.toString(),
    });
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return {
          'success': true,
          'status': response.statusCode,
          'message': 'Exito',
          'data': (json.decode(response.body) as List)
              .map((data) => Product.fromMap(data))
              .toList(),
        };
      } else {
        return {
          'success': false,
          'status': 400,
          'message': 'Error al traer productos',
          'data': [],
        };
      }
    } catch (e) {
      return {
        'success': false,
        'status': 500,
        'message': 'Error del servidor, vuelve a intentar en un momento.',
        'data': []
      };
    }
  }
}
