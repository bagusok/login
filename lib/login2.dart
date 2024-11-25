import 'package:flutter/material.dart';

class Login2 extends StatelessWidget {
  const Login2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("Logo Ipsum"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sign in to your accounts",
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 32),
                  child: Text(
                    "Enter your email and password to login",
                    style: TextStyle(fontSize: 14, color: Colors.black45),
                  ),
                ),
                Text(
                  "Email",
                  style: TextStyle(fontSize: 14),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      focusColor: Colors.blue,
                      fillColor: Colors.red,
                      hoverColor: Colors.blue,
                      hintText: "John@mail.com",
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(14)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(14)),
                    ),
                  ),
                ),
                Text(
                  "Password",
                  style: TextStyle(fontSize: 14),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 14),
                      suffix: Icon(
                        Icons.remove_red_eye_outlined,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(14)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(14)),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forgot Password",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.blueAccent),
                      )),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: MediaQuery.of(context).size.width),
                          borderRadius: BorderRadius.circular(12)),
                      backgroundColor: Colors.blueAccent,
                      fixedSize: Size(MediaQuery.of(context).size.width, 60),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Log in",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Align(
                    alignment: Alignment.center,
                    child: const Text(
                      "Or",
                      style: TextStyle(color: Colors.black38),
                    ),
                  ),
                ),
                CustomOutlineButton(
                  title: "Login With Google",
                  icon: Icon(Icons.g_mobiledata),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomOutlineButton(
                  title: "Login With Facebook",
                  icon: Icon(Icons.facebook),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomOutlineButton extends StatelessWidget {
  String title;
  Icon icon;

  CustomOutlineButton({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {},
      label: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
      ),
      icon: icon,
      style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.black12, width: 1),
          fixedSize: Size(MediaQuery.of(context).size.width, 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
    );
  }
}
