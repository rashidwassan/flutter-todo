import 'package:flutter/material.dart';
import 'package:todo/pages/data_input_screen.dart';

import '../constants/images.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToDataInputPage();
  }

  void navigateToDataInputPage() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, DataInputScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          Images.logo,
          height: 150,
        ),
      ),
    );
  }
}
