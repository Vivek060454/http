import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:htttp/deatials.dart';
import 'dart:convert';
import 'package:htttp/modelm.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
String? stringresponse;
List? listresponse;
Map? mapresponse;
List? listfact;
Map? mapres;
Map? mapress;

  Future fetchdata()async{
    var url =
  Uri.parse("https://dummy.restapiexample.com/api/v1/employees");
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    // http.StreamedResponse response = await request.send();
    print(response.statusCode);
    // print(await response.stream.bytesToString());
  //  var responseString = await response.body;
  if(response.statusCode==200){
   print(response.body);
    setState(() {
mapresponse= json.decode(response.body);
  print(listfact);
  //listfact=json.decode(response.stream.bytesToString());
  // mapres=mapresponse!['mobile'];
  //  mapress=mapresponse!['time'];
  //  listfact=mapresponse!['Payload'];

    });
  }
  }
  @override
  void initState() {
    fetchdata();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),

body: mapresponse==null?Container():SingleChildScrollView(
  scrollDirection: Axis.vertical,
  child:   Column(

    children: [
//Text(mapresponse!['status'].toString()),
      Text("hi"),


      ListView.builder(

        shrinkWrap: true,
scrollDirection: Axis.vertical,
        itemBuilder: (context,index){

        return Container(


          child: Column(

            children: [
Text(mapresponse!['data'][index]['employee_name'].toString())


            ],

          ),

        );

      },

      itemCount:mapresponse!['data']==null? 0:mapresponse!['data'].length,)

    ],

  ),
),
    );
  }
}
//child: Text(postList[index].category.toString()),
// Text('User ID:${userdetails[index].id}'),
// Text('ID: ${userdetails[index].email}'),
// Text('Title: ${userdetails[index].address}'),
// Text('Body: ${userdetails[index].phone}',maxLines: 1,),