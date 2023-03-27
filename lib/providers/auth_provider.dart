import 'package:cmp_flutter_web/models/strapi_user_model.dart';
import 'package:cmp_flutter_web/services/auth_service.dart';
import 'package:cmp_flutter_web/shared/helpers/snack_bar_helper.dart';
import 'package:floating_snackbar/floating_snackbar.dart';
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
    try {
      await AuthService().login(username, password).then((value) {
        if (value['success']) {
          StrapiUserModel user = value['data'];
          _user = user;
          notifyListeners();
        } else {
          SnackBarHelper().errorSnackBar(value['data'], context);
        }
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
