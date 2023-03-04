import 'package:flutter/material.dart';
import 'package:webview_app/view/input_page.dart';

// Widget for LoginPage
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String infoText = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // for email
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                onChanged: (String value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              // for password
              TextFormField(
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                onChanged: (String value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              Container(
                padding: const EdgeInsets.all(8),
                // メッセージ表示
                child: Text(infoText),
              ),
              SizedBox(
                width: double.infinity,
                // Login Button
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () async {
                    try {
                      // ====================
                      // @todo Execute login method
                      // final FirebaseAuth auth = FirebaseAuth.instance;
                      // await auth.signInWithEmailAndPassword(
                      //   email: email,
                      //   password: password,
                      // )
                      // ====================
                      // If the login succeeds
                      await Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) {
                          return const InputPage();
                        }),
                      );
                    } catch (e) {
                      // If login fails
                      setState(() {
                        infoText = "Login failed.：${e.toString()}";
                      });
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
