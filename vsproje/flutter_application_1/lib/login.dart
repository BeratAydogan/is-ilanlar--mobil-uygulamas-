// ignore_for_file: unnecessary_new, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, avoid_print, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_application_1/menu.dart';
import 'package:flutter_application_1/register.dart';
import 'package:flutter_application_1/services/auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailContoller = new TextEditingController();
  final TextEditingController passwordContoller = new TextEditingController();

  final _auth = FirebaseAuth.instance;
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      autofocus: false,
      controller: emailContoller,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        emailContoller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail, color: Colors.purple.shade400),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Email',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.purple.shade400)),
      ),
    );

    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordContoller,
      obscureText: true,
      onSaved: (value) {
        passwordContoller.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key, color: Colors.purple.shade400),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Şifre',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.purple.shade400)),
      ),
    );
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        child: Text('Giriş'),
        onPressed: () async{
           try {
        await _auth.signInWithEmailAndPassword( email: emailContoller.text, password: passwordContoller.text);
  await Navigator.of(context).push(
             MaterialPageRoute(
             builder: (contex) => MenuScreen(),
                ),
              );
   } on FirebaseAuthException catch (e) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
        title: Text("Oturuma Erişilemedi"),
        content: Text('${e.message}')));

        }
      },
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(36),
            color: Colors.white,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'İşBul',
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Sana',
                        style: TextStyle(
                            color: Colors.purple.shade400,
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  emailField,
                  SizedBox(
                    height: 25,
                  ),
                  passwordField,
                  SizedBox(
                    height: 35,
                  ),
                  loginButton,
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Hesabın yok mu?'),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterScreen()));
                        },
                        child: Text(
                          'Kayıt Ol',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Colors.purple.shade400),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
