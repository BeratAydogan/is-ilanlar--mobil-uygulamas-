// ignore_for_file: sized_box_for_whitespace
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/detail_page.dart';
import 'package:flutter_application_1/searchservice.dart';

// ignore_for_file: prefer_const_constructors

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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

                  ///AppBar sayılır bu
                  Container(
                margin: EdgeInsets.only(left: 18),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///Bura üst kısım appbar altı
                        Container(
                          width: double.infinity,
                          height: 120,
                          margin: EdgeInsets.only(right: 18),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Merhaba,\nHayalinin İşini Bulmana \nYardımcı Olmak İçin\nBurdayız',
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF21202A),
                                      wordSpacing: 2.5),
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                margin: EdgeInsets.only(left: 12),
                                decoration: BoxDecoration(
                                  color: Color(0xFF21202A),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: IconButton(
                                    icon: Icon(Icons.search),
                                    color: Colors.white,
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SearchPage()));
                                    }),
                              )
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 30,
                        ),
                        Text('Popüler İlanlar',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF21202A))),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: double.infinity,
                          height: 190,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                DocumentSnapshot populerilan =
                                    asyncSnapShot.data!.docs[index];
                                return Container(
                                  width: 280,
                                  margin: EdgeInsets.only(right: 18),
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Color(0xFF21202A)),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DetailPage(
                                                  ilandetay: asyncSnapShot
                                                      .data!.docs[index])));
                                    },
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                height: 70,
                                                width: 90,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            populerilan[
                                                                'image']),
                                                        fit: BoxFit.fill)),
                                              ),
                                              Spacer(),
                                              Text(
                                                populerilan['türü'],
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            populerilan['position'],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                              populerilan['name'] +
                                                  '-' +
                                                  populerilan['konum'],
                                              style: TextStyle(
                                                color: Colors.white,
                                              )),
                                        ]),
                                  ),
                                );
                              }),
                        ),

                        SizedBox(
                          height: 35,
                        ),
                        Text('Güncel İlanlar',
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
                              return Card(
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
                            })
                      ]),
                ),
              );
            }),
      ),
    );
  }
}
