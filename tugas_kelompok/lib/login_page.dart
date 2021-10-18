import 'package:flutter/material.dart';
import 'package:tugas_kelompok/colors_config.dart';
import 'package:tugas_kelompok/provider/all_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(children: [
        Positioned(
          top: 80,
          child: Container(
            padding: const EdgeInsets.only(top: 40, left: 20),
            child: Container(
              height: 400,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: "Welcome to ",
                          style: TextStyle(
                            letterSpacing: 1,
                            fontSize: 24,
                            color: Colors.yellow[700],
                          ),
                          children: [
                            TextSpan(
                              text: "GITS Mobile",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.yellow[750],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Login to Continue",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ]),
            ),
          ),
        ),
        Positioned(
          top: 220,
          child: Container(
            padding: EdgeInsets.all(20),
            height: 260,
            width: MediaQuery.of(context).size.width - 40,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 15,
                    spreadRadius: 20,
                  ),
                ]),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(children: [
                      Text(
                        "LOGIN",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow[700],
                        ),
                      ),
                      Container(
                        height: 2,
                        width: 70,
                        color: Colors.yellow[700],
                      )
                    ]),
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(12),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        buildTextField(Icons.account_circle_outlined,
                            "Username", username),
                        buildTextField(
                            Icons.lock_outline, "Password", password),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 425,
          right: 0,
          left: 0,
          child: Center(
            child: GestureDetector(
              onTap: () {
                // validate form
                if (!(_formKey.currentState?.validate() ?? false)) return;
                // get provider read
                LoginProvider provider = context.read<LoginProvider>();
                provider.getLogin(username.text, password.text);
                // navigate back
                Navigator.pop(context);
              },
              child: Container(
                height: 90,
                width: 90,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.orange, Colors.red],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.3),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      )
                    ],
                  ),
                  child: Icon(Icons.arrow_forward, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget buildTextField(
      IconData icon, String hintText, TextEditingController textController) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        controller: textController,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Palette.iconColor),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette.textColor1),
            borderRadius: BorderRadius.all(
              Radius.circular(35.0),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette.textColor1),
            borderRadius: BorderRadius.all(
              Radius.circular(35.0),
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
        ),
      ),
    );
  }
}
