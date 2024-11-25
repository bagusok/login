import 'package:belajar/dashboard.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Logo Ipsum',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Sign in to your accounts",
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.w600),
            ),
            Text('Enter your email dan password',
                style: TextStyle(fontSize: 14)),
            Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 16),
                child: const Text(
                  "Email",
                  style: TextStyle(fontSize: 14),
                )),
            form(),
            Padding(
                padding: const EdgeInsets.only(top: 16),
                child: const Text(
                  "Password",
                  style: TextStyle(fontSize: 14),
                )),
            TextField(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Dashboard();
                }));
              },
              child: const Text("Login"),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  fixedSize: Size(double.maxFinite, 50)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Align(
                alignment: Alignment.center,
                child: const Text("OR"),
              ),
            ),
            OutlinedButton.icon(
              icon: Icon(
                Icons.g_mobiledata,
                color: Colors.blue,
              ),
              onPressed: () {},
              label: const Text(
                'Sign in with Google',
                style: TextStyle(color: Colors.black),
              ),
              style: OutlinedButton.styleFrom(
                fixedSize: Size(double.maxFinite, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: OutlinedButton.icon(
                icon: Icon(
                  Icons.facebook,
                  color: Colors.blue,
                ),
                onPressed: () {},
                label: const Text(
                  'Sign in with Facebook',
                  style: TextStyle(color: Colors.black),
                ),
                style: OutlinedButton.styleFrom(
                  fixedSize: Size(double.maxFinite, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class form extends StatelessWidget {
  const form({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
