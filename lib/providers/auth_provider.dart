import 'package:cmp_flutter_web/models/strapi_user_model.dart';
import 'package:cmp_flutter_web/services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  StrapiUserModel? _user;
  StrapiUserModel? get user => _user;
  set user(StrapiUserModel? value) {
    _user = value;
    notifyListeners();
  }

  String _currentPage = 'orders';
  String get currentPage => _currentPage;
  set currentPage(String value) {
    _currentPage = value;
    notifyListeners();
  }

  Future<void> login(
      String username, String password, BuildContext context) async {
    //TODO: LOADING
    try {
      final result = await AuthService().login(username, password);
      if (result['success']) {
        StrapiUserModel user = result['data'];
        _user = user;
        notifyListeners();
      } else {
        //TODO: ERROR ? can be a independant class? ?
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
