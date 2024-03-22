import 'package:demoproject/main.dart';
import 'package:demoproject/screens/home.dart';
import 'package:demoproject/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    checkuserloggedin();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/download.jpeg',
          height: 300,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  void gotologin() async {
    await Future.delayed(const Duration(seconds: 5));

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (ctx) => ScreeLogin()),
    );
  }

  checkuserloggedin() async {
    final sharedprefs = await SharedPreferences.getInstance();
    final userloggedin = sharedprefs.getBool(SAVE_KEY_NAME);
    if (userloggedin == null || userloggedin == false) {
      gotologin();
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) => ScreenHome()));
    }
  }
}
