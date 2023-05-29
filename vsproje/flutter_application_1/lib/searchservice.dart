
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/detail_page.dart';

class SearchService {
  searchByName(String seachField) {
    return FirebaseFirestore.instance
        .collection('ilanBilgileri')
        .where('searchKey', isEqualTo: seachField.substring(0, 1).toUpperCase())
        .get();
  }
}


// ignore_for_file: prefer_const_constructors

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

var queryResultSet=[];
var tempSearchStore=[];

initiateSearch(value){
if(value.toString().isEmpty){
  setState(() {
  queryResultSet=[];
  tempSearchStore=[];

    
  });
}
var capitalizedValue= value!.toString().substring(0,1).toUpperCase()+value!.toString().substring(1);
if(queryResultSet.isEmpty && value.toString().length==1){
  SearchService().searchByName(value).then((QuerySnapshot docs)
  {
for(int i=0;i<docs.docChanges.length;++i)
{
queryResultSet.add(docs.docs[i].data());
}
  }
  );
}else{
  tempSearchStore=[];
  for (var element in queryResultSet) {
    if(element['position'].toString().startsWith(capitalizedValue)){
      setState(() {
        tempSearchStore.add(element);
      });
    }
  }
}

}


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFF6F6F6),
          body:ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child:  Row(
                            children: [
                              Expanded(child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),

                                ),
                                child: TextField(
                                  
                                  onChanged: (val) {
                initiateSearch(val);
              },
                                  cursorColor: Color(0xFF21202A),
                                 
              decoration: InputDecoration(
                  prefixIcon: IconButton(
                    color: Colors.black,
                    icon: Icon(Icons.arrow_back),
                    iconSize: 20.0,
                    onPressed: () {
                      Navigator.of(context).pop();}
                  ),
                 hintText:'İlan Aramak İçin Tıkla'  )
                                ),
                              ),
                              ),
                              Container(
                                  width: 50,
                                  height: 50,
                                  margin: EdgeInsets.only(left: 12),
                                  decoration:BoxDecoration(
                                    color: Color(0xFF21202A),
                                    borderRadius:BorderRadius.circular(12),
                                  ),
                                  child: Icon(Icons.sort_outlined,color: Colors.white,size: 20,),
                              ),

                            ],
                          ),
                          

          ),
          SizedBox(height: 10.0),
          Column(
          
              children: tempSearchStore.map((element) {
                return buildResultCard(element);
              }).toList()),
              
        ],
        ),
        ),
        );
  }






                                Widget buildResultCard(data) {
                          return Card(
                          elevation: 0,
                          margin: EdgeInsets.only(right: 18,top: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                          ),
                          
                          child: ListTile(
                            selectedTileColor: Colors.purple.shade900,
                            leading: Container(
                              width: 50,
                              height:50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(image: NetworkImage(data['image']),fit: BoxFit.cover),///buraya resim koy
                              ),
                            ),
                              title: Text(data['position'],style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color:Color(0xFF21202A) ),),
                              subtitle: Text("${data['name']}.${data['konum']}"),
                              trailing: Icon(Icons.more_vert,color: Color(0xFF21202A),),
                              onTap: () {
 Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailPage(
                                            ilandetay:
                                                data!.docs[data.toString()])));                              }
                            ),
                              );
                        
                      }





}




                 
                             