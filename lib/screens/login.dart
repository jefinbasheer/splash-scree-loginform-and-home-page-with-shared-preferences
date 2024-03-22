import 'package:demoproject/main.dart';
import 'package:demoproject/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreeLogin extends StatefulWidget {
  const ScreeLogin({super.key});

  @override
  State<ScreeLogin> createState() => _ScreeLoginState();
}

class _ScreeLoginState extends State<ScreeLogin> {
  final usernamecontroller = TextEditingController();

  final passwordcontroller = TextEditingController();
  bool ismatched = true;
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              TextFormField(
                controller: usernamecontroller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Username"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Fill this Field';
                  } else {
                    return null;
                  }

                  /*if (ismatched) {
                 return null;
                  } else {
                    return 'error';
                  }*/
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passwordcontroller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "PassWord"),
                obscureText: true,
                validator: (value) {
                  /*if (ismatched) {
                    return null;
                  } else {
                    return 'error';
                  }*/

                  if (value == null || value.isEmpty) {
                    return 'Please Fill this Field';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: !ismatched,
                    child: const Text(
                      'username password doesnot match',
                      style: TextStyle(color: Color.fromARGB(255, 234, 73, 4)),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        checklogin(context);
                      } else {
                        // ignore: avoid_print
                        print('empty');
                      }
                    },
                    icon: const Icon(Icons.check),
                    label: const Text('Login'),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }

  void checklogin(BuildContext ctx) async {
    final username = usernamecontroller.text;
    final password = passwordcontroller.text;
    if (username == password) {
      //go to home
      // ignore: avoid_print
      print('username and password matches');
      final sharedprefs = await SharedPreferences.getInstance();
      await sharedprefs.setBool(SAVE_KEY_NAME, true);
      Navigator.of(ctx)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) => ScreenHome()));
    } else {
      // ignore: avoid_print
      print("usrname and password doesnot match");
    }
  }
}
