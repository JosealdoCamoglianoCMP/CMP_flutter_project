import 'package:cmp_flutter_web/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'OoohBaby',
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                        SizedBox(height: 24),
                        ConstrainedBox(
                          constraints: BoxConstraints.tightFor(
                              width: MediaQuery.of(context).size.width / 3),
                          child: FloatingActionButton.extended(
                              backgroundColor: AppColors.buttonPinkColor,
                              onPressed: () {},
                              label: Text('LOGIN')),
                        ),
                        SizedBox(height: 40),
                        Text(
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
