/// başvuru butonu elevatedbutton ile yap
// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';

// ignore_for_file: prefer_const_constructors

class DetailPage extends StatefulWidget {
  final DocumentSnapshot ilandetay;
  DetailPage({required this.ilandetay});
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int kontrol=0;
final refref =FirebaseFirestore.instance.collection('Person').doc(FirebaseAuth.instance.currentUser?.uid).get(); 
  @override
  Widget build(BuildContext context) {
final basvuruButton = Material(color: Colors.purple.shade400,
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () 
       async{
         if(FirebaseAuth.instance.currentUser!=null)
         {
             if (kontrol==0) {
          FirebaseFirestore.instance
                                .collection('ilanBilgileri')
                                .doc(widget.ilandetay.id,)
                                .update({
                                'favList': FieldValue.arrayUnion([FirebaseAuth.instance.currentUser?.uid])});
kontrol++;
showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                    title: Text("Başvurunuz Alınmıştır"),
                    content: Text('Başvuru İptali İçin Tekrar Tıklayınız')));
       }
  else{
    
                            FirebaseFirestore.instance
                                .collection('ilanBilgileri')
                                .doc(widget.ilandetay.id ,)
                                .update({
                                'favList': FieldValue.arrayRemove([
                                FirebaseAuth.instance.currentUser!.uid])
                            });
                          kontrol=0;
                          showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                    title: Text("Başvurunuz İptal Edilmiştir"),
                    content: Text('Başvuru İçin Tekrar Tıklayınız')));

  }
         }
         else{
             showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                    title: Text("Giriş Sayfasına Yönlendiriliyorsunuz"),
                    content: Text('Başvuru Yapabilmek İçin Giriş Yapmanız Gerekmektedir')));
                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (contex) =>
                                                LoginScreen()));
         }
       
        },

        child: Text('Başvur',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
      ),
    ));

    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFF6F6F6),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF21202A),
            )),
        title: Text(
          widget.ilandetay['position'],
          style: TextStyle(color: Color(0xFF21202A)),
        ),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 2,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 15,
          ),
          decoration: BoxDecoration(
              color: Color(0xFFF6F6F6),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40))),
          child: Column(
            children: [
              Container(
                constraints: BoxConstraints(maxHeight: 250),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: NetworkImage(widget.ilandetay['image']),
                                fit: BoxFit.fill)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.ilandetay['name'],
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      widget.ilandetay['konum'],
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 5.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                                color: Color(0xFF21202A).withOpacity(.5)),
                          ),
                          child: Text(widget.ilandetay['türü']),
                        ),
                         Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 5.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                                color: Color(0xFF21202A).withOpacity(.5)),
                          ),
                          child: Text(widget.ilandetay['departman']),
                        ),
                      ],
                    ),
                    SizedBox(height: 25.0),
                    Material(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                              color: Color(0xFF21202A).withOpacity(.2))),
                      child: TabBar(
                          unselectedLabelColor: Color(0xFF21202A),
                          indicator: BoxDecoration(
                            color: Colors.purple.shade400,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          tabs: [
                            Tab(
                              text: 'İlan Hakkında',
                            ),
                            Tab(
                              text: 'Şirket Hakkında',
                            ),
                          ]),
                    )
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(children: [
                  Container(
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          'İlan Hakkında',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          widget.ilandetay['tanım'],
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              height: 1.5,
                              color: Color(0xFF5B5B5B)),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'İş Gereksinimleri',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Column(
                          children: [
                            Text(widget.ilandetay['kriter1']),
                            Text(widget.ilandetay['kriter2']),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          'Şirket Hakkında',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          widget.ilandetay['workab'],
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              height: 1.5,
                              color: Color(0xFF5B5B5B)),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Container(
          
          color: Colors.white,
          child: Row(
            children: [
            
              Expanded(
                child: SizedBox(height: 50,width: 300,
                child: InkWell(
                  onTap: () {
                    
                  },
                  child: basvuruButton,
                  ),
                ),
                
                ),
              
              
            ],
          ),
        ),
      ),
    );
  }
}
