import 'dart:convert';
import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main(){
  runApp(MaterialApp(home: MyApp(),debugShowCheckedModeBanner: false,));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var data;
  Future getData()async{
    var response= await http.get(Uri.parse('https://webhook.site/d24f9761-dfba-4759-bcda-f42f3dd539b7?fbclid=IwAR16bLs9WQcolxx2Y8sTH7So5QoWK4CvPj5CFPJ7Ez9mC3CF6ZiE_dPk1uY'));
    setState(() {
      var decode=json.decode(response.body);
      data=decode['data'];
      print(data);
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getData();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping App'),
        centerTitle: true,
      ),

      // body: GridView.builder(
      //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //         crossAxisCount: 1,
      //     ),
      //     itemCount: data==null?0:data.length,
      //     itemBuilder: (context,index){
      //       return Card(
      //         // child: Column(
      //         //   children: [
      //         //     Container(
      //         //       width: 100,
      //         //       height: 100,
      //         //       child: Image.network(data[index]['image']),
      //         //     ),
      //         //     Text(data[index]['type']),
      //         //   ],
      //         // ),
      //         child: Text(data[index]['type']),
      //       );
      //     }
      // ),
      body: ListView.builder(
        itemCount: data==null?0:data.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text(data[index]['name']),
            );
          }
      ),
    );
  }
}
