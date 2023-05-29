// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, unused_import
///BU SAYFAYA PROFİL SAYFASI EKLE VE BU KADAR SONRA DETAY SAYFASI VE LİSTELEMEYİ YAP
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/editpage.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/menu.dart';
import 'package:flutter_application_1/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final AuthService _authService = AuthService();
  String isim = '';
  String soyisim = '';
  String yas = '';
  String adres = '';
  String cinsiyet = '';
  String position = '';
  String tecrube = '';
  String egitim = '';
  String ozet = '';
  String email = '';
  bool vcek = true;
  bool vcek2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Color(0xFFF6F6F6),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Profil Sayfası'),
        actions: [
          Visibility(
            visible: vcek2,
            child: IconButton(
                onPressed: () {
                  _authService.signOut();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => MenuScreen())));
                },
                icon: Icon(Icons.exit_to_app)),
          )
        ],
      ),
      body: ListView(
        
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: vcek,
                child: TextButton(
                    onPressed: () async {
                      if (FirebaseAuth.instance.currentUser != null) {
                        dynamic infos =
                            await AuthService().getCurrentUserData();
                        if (infos != null) {
                          vcek = false;
                          vcek2 = true;

                          setState(() {
                            isim = infos[0];
                            soyisim = infos[1];
                            adres = infos[2];
                            cinsiyet = infos[3];
                            egitim = infos[4];
                            email = infos[5];
                            ozet = infos[6];
                            position = infos[7];
                            tecrube = infos[8];
                            yas = infos[9];
                          });
                        }
                      } else {
                        showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                                title: Text("Kayıtlı Değilsiniz"),
                                content: TextButton(
                                  child: Text(
                                      'Kayıt ekranına gitmek için tıklayınız'),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (contex) =>
                                                LoginScreen()));
                                  },
                                )));
                      }
                    },
                    child: Center(
                        child: Text(
                      'Profilinizi Görmek İçin Tıklayınız',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ))),
              ),
              Visibility(
                visible: vcek2,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 350),
                      child: IconButton(
                        color: Colors.purple.shade400,
                        icon:Icon(Icons.edit),onPressed: (){
Navigator.of(context).push(MaterialPageRoute(builder: ((context) => EditScreen())));
                      },),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: CircleAvatar(
                      backgroundColor: Colors.purple.shade400,
                      maxRadius: 70,
                    )),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text(isim + ' ' + soyisim + ' - ' + position,
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          email,
                          
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                  padding: EdgeInsets.all(40),
                                  child: Column(
                                    children: [
                                      Text('Doğum Tarihi',
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                             )),
                                      Text(
                                        yas,
                                        style: TextStyle(
                                            fontSize: 20,),
                                      ),
                                    ],
                                  )),
                            ),
                            Expanded(
                              child: Container(
                                
                                  padding: EdgeInsets.all(40),
                                  child: Column(
                                    children: [
                                      Text('Cinsiyet',
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,color: Colors.black
                                              )),
                                      Text(
                                        cinsiyet,
                                        style: TextStyle(
                                            fontSize: 20,color: Colors.black),
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                        Container(
                            padding: EdgeInsets.all(40),
                            child: Column(
                              children: [
                                TextFormField(
                                  readOnly: true,
                                  initialValue: adres,
                                  decoration: InputDecoration(
                                      labelText: 'Adres',
                                      labelStyle: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,color: Colors.black
                                        ),
                                      ),
                                ),
                              ],
                            )),
                        Container(
                            padding: EdgeInsets.all(40),
                            child: Column(
                              children: [
                                
                                TextFormField(
                                  initialValue: tecrube,
                                  readOnly: true,
                                  autofocus: false,
                                  decoration: InputDecoration(
                                      labelText: 'iş Tecrübesi',
                                      labelStyle: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,color: Colors.black
                                          ),
                                      ),
                                ),
                              ],
                            )),
                        Container(
                            padding: EdgeInsets.all(40),
                            child: Column(
                              children: [
                                TextFormField(
                                  readOnly: true,
                                  autofocus: false,
                                  initialValue: egitim,
                                  decoration: InputDecoration(
                                      labelText: 'Eğitim',
                                      labelStyle: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,color: Colors.black
                                        ),
                                         ),
                                ),
                              ],
                            )),
                        Container(
                            padding: EdgeInsets.all(40),
                            child: Column(
                              children: [
                                TextFormField(
                                  readOnly: true,
                                  initialValue: ozet,
                                  decoration: InputDecoration(
                                      labelText: 'Hakkında',
                                    
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          ),
                                     ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

check() {
  bool vc;
  if (FirebaseAuth.instance.currentUser != null) {
    vc = true;
  } else {
    vc = false;
  }

  return vc;
}
