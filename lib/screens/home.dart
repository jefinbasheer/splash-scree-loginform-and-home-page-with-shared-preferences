import 'package:demoproject/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: () {
              signout(context);
            },
            icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: const Center(
        child: SafeArea(
          child: Text(
            'this home screen',
            style: TextStyle(color: Colors.amberAccent),
          ),
        ),
      ),
    );
  }

  void signout(BuildContext ctx) async {
    final sharedprefs = await SharedPreferences.getInstance();
    await sharedprefs.clear();

    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => ScreeLogin()), (route) => false);
  }
}
