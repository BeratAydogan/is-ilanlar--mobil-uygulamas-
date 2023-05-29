// ignore_for_file: prefer_const_constructors, unused_local_variable, unused_import, unused_field, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/profilepage.dart';
import 'package:flutter_application_1/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key}) : super(key: key);
  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
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
  var a1=0;
  var a2=0;
  var a3=0;
  var a4=0;
  var a5=0;
  var a6=0;
  var a7=0;
  var a8=0;
  var a9=0;


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
  bool vcek2=false;
  @override
 
  Widget build(BuildContext context) {
//isim alanı

    final isimField = TextFormField (
      autofocus: false,
      controller: isimEditingController,
      keyboardType: TextInputType.name,
      //  validator: () {},
      
      onSaved: (value) {
        isimEditingController.text = value!;
        a1=1;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: 'İsim',
        prefixIcon: Icon(
          Icons.account_circle,
          color: Colors.purple.shade400,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
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
        a2=1;
        soyisimEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: 'Soyisim',
        prefixIcon: Icon(Icons.account_circle, color: Colors.purple.shade400),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );


    final cinsiyetField = TextFormField(
      autofocus: false,
      controller: cinsiyetEditingController,
      obscureText: false, //  validator: () {},
      onSaved: (value) {
        a3=1;
        cinsiyetEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: 'Cinsiyet',
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        prefixIcon: Icon(Icons.person, color: Colors.purple.shade400),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    final yasField = TextFormField(
      autofocus: false,
      controller: yasEditingController,
      obscureText: false, //  validator: () {},
      onSaved: (value) {
        a4=1;
        yasEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: 'Doğum Tarihi',
        prefixIcon: Icon(Icons.date_range_outlined, color: Colors.purple.shade400),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

final meslekField = TextFormField(
      autofocus: false,
      controller: positionEditingController,
      obscureText: false, //  validator: () {},
      onSaved: (value) {
        a5=1;
        positionEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: 'Meslek',
        prefixIcon: Icon(Icons.work_outline_sharp, color: Colors.purple.shade400),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

final adresField = TextFormField(
      autofocus: false,
      controller: adresEditingController,
      obscureText: false, //  validator: () {},
      maxLines: 3,
      onSaved: (value) {
        a6=1;
        adresEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: 'Adres',
        prefixIcon: Icon(Icons.location_on_outlined, color: Colors.purple.shade400),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

final tecrubeField = TextFormField(
      autofocus: false,
      controller: tecrubeEditingController,
      obscureText: false, //  validator: () {},
      maxLines: 5,
      onSaved: (value) {
        a7=1;
        tecrubeEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: 'İş Tecrübesi',
        prefixIcon: Icon(Icons.card_travel_sharp, color: Colors.purple.shade400),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

final egitimField = TextFormField(
      autofocus: false,
      controller: egitimEditingController,
      obscureText: false, //  validator: () {},
      maxLines: 5,
      onSaved: (value) {
        a8=1;
        egitimEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: 'Eğitim',
        prefixIcon: Icon(Icons.school_outlined, color: Colors.purple.shade400),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
final ozetField = TextFormField(
      autofocus: false,
      controller: ozetEditingController,
      obscureText: false, //  validator: () {},
      maxLines: 5,
      onSaved: (value) {
        a9=1;
        ozetEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintText: 'Hakkınızda ',
        prefixIcon: Icon(Icons.summarize_outlined, color: Colors.purple.shade400),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );


    final kayitButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () async {///buraya kullanıcı id sine göre set yapıcaksın sonra tasarımı değişeceksin bu kadar...
          try {
            
                FirebaseFirestore.instance.collection('Person').doc(FirebaseAuth.instance.currentUser!.uid).update({
                  'userName':isimEditingController.text,
                  'userSurname':soyisimEditingController,
                  'position': positionEditingController.text,
                  'yas':yasEditingController.text,
                  'adres':adresEditingController.text,
                  'cinsiyet': cinsiyetEditingController.text,
                  'tecrube':tecrubeEditingController.text,
                  'egitim': egitimEditingController.text,
                  'ozet': ozetEditingController.text  

                });
            if (FirebaseAuth.instance.currentUser != null) {
            
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => ProfilePage())));
            }
          } on FirebaseAuthException catch (e) {
            showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                    title: Text("Profil Değiştirilemedi"),
                    content: Text('${e.message}')));
          }
        },
        child: Text('Kaydet'),
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
                children: [
                 
                        
                      
                    Column(
                children: [SizedBox(
                  height: 80,
                  child: Text('Profili Düzenle',
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
                ),],),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
