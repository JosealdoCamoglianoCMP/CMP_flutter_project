import 'dart:developer';

import 'package:cmp_flutter_web/main.dart';
import 'package:cmp_flutter_web/models/strapi_user_model.dart';
import 'package:cmp_flutter_web/providers/auth_provider.dart';
import 'package:cmp_flutter_web/shared/routes/app_routes.dart';
import 'package:cmp_flutter_web/shared/theme/app_colors.dart';
import 'package:cmp_flutter_web/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  static const route = 'login_view';
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/login_background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  // width: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 64, vertical: 48),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset('assets/cmp_logo.png'),
                        const SizedBox(height: 32),
                        const Text(
                          'Welcome back!',
                          style: TextStyle(
                            color: AppColors.textBlue,
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(height: 16),
                        RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'It\'s great to see you ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textGrey,
                                ),
                              ),
                              TextSpan(
                                text: '👋🏻\n',
                                style: TextStyle(
                                  fontFamily: 'NotoEmoji',
                                ),
                              ),
                              TextSpan(
                                text: 'Log in to your account below',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textGrey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),
                        ConstrainedBox(
                          constraints: BoxConstraints.tightFor(
                              width: MediaQuery.of(context).size.width / 3),
                          child: TextFormField(
                            controller: userController,
                            cursorColor: AppColors.textBlue,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.textFieldBackColor,
                              contentPadding: const EdgeInsets.all(8),
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.person),
                              label: Text('Username'),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        ConstrainedBox(
                          constraints: BoxConstraints.tightFor(
                              width: MediaQuery.of(context).size.width / 3),
                          child: TextFormField(
                            obscureText: true,
                            controller: passwordController,
                            cursorColor: AppColors.textBlue,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.textFieldBackColor,
                              contentPadding: const EdgeInsets.all(8),
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.person),
                              label: Text('Password'),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        ConstrainedBox(
                          constraints: BoxConstraints.tightFor(
                              width: MediaQuery.of(context).size.width / 3),
                          child: FloatingActionButton.extended(
                              backgroundColor: AppColors.buttonPinkColor,
                              onPressed: () async {
                                await authProvider.login(
                                  userController.text,
                                  passwordController.text,
                                  context,
                                );
                                if (authProvider.user != null) {
                                  localStorage.setString(
                                      'user', authProvider.user!.toJson());
                                  Get.rootDelegate.toNamed(Routes.home);
                                }
                              },
                              label: Text('LOGIN')),
                        ),
                        const SizedBox(height: 40),
                        const Text(
                          'Reset password',
                          style: TextStyle(
                            color: AppColors.textGrey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Made with ',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: '❤️',
                        style: TextStyle(
                          fontFamily: 'NotoEmoji',
                        ),
                      ),
                      TextSpan(
                        text: ' by Cloud Media Pro',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
