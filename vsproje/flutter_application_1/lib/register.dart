// ignore_for_file: prefer_const_constructors, unused_local_variable, unused_import, unused_field, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final isimEditingController = TextEditingController();
  final soyisimEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final positionEditingController = TextEditingController();
  final adresEditingController = TextEditingController();
  final yasEditingController = TextEditingController();
  final egitimEditingController = TextEditingController();
  final tecrubeEditingController = TextEditingController();
  final ozetEditingController = TextEditingController();
  final cinsiyetEditingController = TextEditingController();

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
//isim alanı
    final isimField = TextFormField(
      autofocus: false,
      controller: isimEditingController,
      keyboardType: TextInputType.name,
      //  validator: () {},
      onSaved: (value) {
        isimEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.account_circle,
          color: Colors.purple.shade400,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'İsim',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

//soyisim alanı
    final soyisimField = TextFormField(
      autofocus: false,
      controller: soyisimEditingController,
      keyboardType: TextInputType.name,
      //  validator: () {},
      onSaved: (value) {
        soyisimEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle, color: Colors.purple.shade400),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Soyisim',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

//email alanı
    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      //  validator: () {},
      onSaved: (value) {
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail, color: Colors.purple.shade400),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Email',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

//şifre alanı
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true, //  validator: () {},
      onSaved: (value) {
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key, color: Colors.purple.shade400),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Şifre',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );


    final cinsiyetField = TextFormField(
      autofocus: false,
      controller: cinsiyetEditingController,
      obscureText: false, //  validator: () {},
      onSaved: (value) {
        cinsiyetEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        prefixIcon: Icon(Icons.person, color: Colors.purple.shade400),
        hintText: 'Cinsiyet',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    final yasField = TextFormField(
      autofocus: false,
      controller: yasEditingController,
      obscureText: false, //  validator: () {},
      onSaved: (value) {
        yasEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.date_range_outlined, color: Colors.purple.shade400),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Doğum Tarihi',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

final meslekField = TextFormField(
      autofocus: false,
      controller: positionEditingController,
      obscureText: false, //  validator: () {},
      onSaved: (value) {
        positionEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.work_outline_sharp, color: Colors.purple.shade400),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Meslek',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

final adresField = TextFormField(
      autofocus: false,
      controller: adresEditingController,
      obscureText: false, //  validator: () {},
      maxLines: 3,
      onSaved: (value) {
        adresEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.location_on_outlined, color: Colors.purple.shade400),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Adres',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

final tecrubeField = TextFormField(
      autofocus: false,
      controller: tecrubeEditingController,
      obscureText: false, //  validator: () {},
      maxLines: 5,
      onSaved: (value) {
        tecrubeEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.card_travel_sharp, color: Colors.purple.shade400),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Tecrübeleriniz',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

final egitimField = TextFormField(
      autofocus: false,
      controller: egitimEditingController,
      obscureText: false, //  validator: () {},
      maxLines: 5,
      onSaved: (value) {
        egitimEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.school_outlined, color: Colors.purple.shade400),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Egitim',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
final ozetField = TextFormField(
      autofocus: false,
      controller: ozetEditingController,
      obscureText: false, //  validator: () {},
      maxLines: 5,
      onSaved: (value) {
        ozetEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.summarize_outlined, color: Colors.purple.shade400),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Hakkınızda Kısa Bilgi',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );


//kayıt ol butonu
    final kayitButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () async {
          try {
            final user = await _authService.createUser(
                isimEditingController.text,
                soyisimEditingController.text,
                emailEditingController.text,
                passwordEditingController.text,
                positionEditingController.text,
               yasEditingController.text,
                 adresEditingController.text,
                cinsiyetEditingController.text,
                tecrubeEditingController.text,
                egitimEditingController.text,
                ozetEditingController.text           );
            if (user != null) {
              FirebaseAuth.instance.currentUser!
                  .updateDisplayName(isimEditingController.text);
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => LoginScreen())));
            }
          } on FirebaseAuthException catch (e) {
            showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                    title: Text("Hesap Oluşturulamadı"),
                    content: Text('${e.message}')));
          }
        },
        child: Text('Kayıt Ol'),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.purple.shade400,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
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
                  SizedBox(
                    height: 80,
                    child: Text('İşBulSana',
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  isimField,
                  SizedBox(
                    height: 25,
                  ),
                  soyisimField,
                  SizedBox(
                    height: 25,
                  ),
                  emailField,
                  SizedBox(
                    height: 25,
                  ),
                  passwordField,
                  SizedBox(
                    height: 25,
                  ),
                  yasField,
                  SizedBox(
                    height: 25,
                  ),
                   cinsiyetField,
                  SizedBox(
                    height: 25,
                  ),
                   meslekField,
                  SizedBox(
                    height: 25,
                  ),
                  adresField,
                  SizedBox(
                    height: 25,
                  ),
                   tecrubeField,
                  SizedBox(
                    height: 25,
                  ),
                   egitimField,
                  SizedBox(
                    height: 25,
                  ),
                   ozetField,
                  SizedBox(
                    height: 25,
                  ),
                  kayitButton,
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
