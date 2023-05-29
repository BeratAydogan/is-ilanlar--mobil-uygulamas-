// ignore_for_file: sized_box_for_whitespace
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/detail_page.dart';

// ignore_for_file: prefer_const_constructors

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);
  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    var ilandetay = _firestore.collection('ilanBilgileri');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFF6F6F6),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFFF6F6F6),
          elevation: 0,
          title: Text(
            'işBulSana',
            style: TextStyle(color: Color(0xFF21202A)),
          ),
        ),
        body: StreamBuilder(
            stream: ilandetay.snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot> asyncSnapShot) {
              if (asyncSnapShot.hasError) {
                return Text('Error:${asyncSnapShot.error}');
              }
              if (asyncSnapShot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Text('Loading....',
                      style: TextStyle(fontSize: 25, color: Colors.black)),
                );
              }

              return

                  Container(
                margin: EdgeInsets.only(left: 18),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
        
                        SizedBox(
                          height: 35,
                        ),
                        Text('Başvurulan İlanlar',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF21202A))),

                        ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: ScrollPhysics(),
                            itemCount: asyncSnapShot.data!.docs.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot documentSnapshot =
                                  asyncSnapShot.data!.docs[index];
                                  if(documentSnapshot['favList'].contains(FirebaseAuth.instance.currentUser!.uid)){
  return  Card(
                                elevation: 0,
                                margin: EdgeInsets.only(right: 18, top: 15),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                child: ListTile(
                                    selectedTileColor: Colors.purple.shade400,
                                    leading: Container(
                                      width: 70,
                                      height: 90,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                documentSnapshot['image']),
                                            fit: BoxFit.fill),

                                        ///buraya resim koy
                                      ),
                                    ),
                                    title: Text(
                                      documentSnapshot['position'],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF21202A)),
                                    ),
                                    subtitle: Text(
                                        "${documentSnapshot['name']}-${documentSnapshot['konum']}"),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      color: Color(0xFF21202A),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DetailPage(
                                                  ilandetay: asyncSnapShot
                                                      .data!.docs[index])));
                                    }),
                              );


                                  } else {
                                    return Center(child: Text('Başvurulan İlanları Listelemek İçin Giriş Yapmalısınız...'));
                                  }
                             
                            })
                      
                
             ]) ));
            }),
      ),
    );
  }
}


