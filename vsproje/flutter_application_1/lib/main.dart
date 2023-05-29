// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_application_1/listpage.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/menu.dart';
import 'package:flutter_application_1/profilepage.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();  

  runApp( MaterialApp(
   debugShowCheckedModeBanner: false,
theme: ThemeData(
  primarySwatch: Colors.purple
  
  ),
  home: MenuScreen()));
}



