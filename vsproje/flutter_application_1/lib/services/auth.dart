// ignore_for_file: unused_field, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class AuthService{

final FirebaseAuth _auth= FirebaseAuth.instance;
final FirebaseFirestore _firestore= FirebaseFirestore.instance;

Future<Object?> signIn(String email,String password)async{

var user =await _auth.signInWithEmailAndPassword(email: email, password: password);
 return user.user;

}



signOut()async{
return await _auth.signOut();

}
 

Future<User?> createUser(String name,String surname, String email,String password,String position,String adres,String yas,String cinsiyet,String tecrube,String egitim,String ozet)async{

  var user= await _auth.createUserWithEmailAndPassword(email: email, password: password);
  await _firestore.collection('Person').doc(user.user?.uid).set({
    'userName':name,
    'userSurname':surname,
    'email':email,
    'sifre':password,
    'position':position,
    'adres':adres,
    'yas':yas,
    'cinsiyet':cinsiyet,
    'tecrube':tecrube,
    'egitim':egitim,
    'ozet':ozet,
  });
return user.user;
  
}


Future getCurrentUserData() async{
    final CollectionReference userCollection=FirebaseFirestore.instance.collection('Person');
var userid=_auth.currentUser?.uid;
    
      DocumentSnapshot ds = await userCollection.doc(userid).get();
      String  firstname = ds.get('userName');
      String lastname = ds.get('userSurname');
      String email = ds.get('email');
      String position = ds.get('position');
      String adres = ds.get('adres');
      String yas = ds.get('yas');
      String cinsiyet = ds.get('cinsiyet');
      String tecrube = ds.get('tecrube');
      String egitim = ds.get('egitim');
      String ozet = ds.get('ozet');



      return [firstname,lastname,adres,cinsiyet,egitim,email,ozet,position,tecrube,yas];
    
  }

}