import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mydoctor/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HealthService extends StatefulWidget {
  const HealthService({Key? key}) : super(key: key);
 
  @override
  _HealthServiceState createState() => _HealthServiceState();
}

class _HealthServiceState extends State<HealthService> {
  bool is_loading=true;
   Future<List<ServiceCategory>> getServiceCategory() async {
      var url = Uri.parse('http://192.168.0.110/doctors/api/health_services');
      var response = await http.get(url);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

   // final response=await http.get(Uri.parse("http://192.168.0.110/doctors/api/health_services"));
     print(response.statusCode);
     var jsonData=json.decode(response.body);
     print(jsonData.length);
     List<ServiceCategory> lists=<ServiceCategory>[];
     for(var s in jsonData){
         ServiceCategory serviceCategory=ServiceCategory(s["id"].toString(), s["name"]);
         lists.add(serviceCategory);
      }
     return lists;
  }
  
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        centerTitle: true,
        backgroundColor: Color(0x44FAFAFA),
        elevation: 0,
        backwardsCompatibility: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () async {
            SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();
            var obtianId = sharedPreferences.getString('id') ?? '';
            if (obtianId.isNotEmpty) {
              Navigator.of(context).pop();
            } else {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => homepage(),
              ));
            }
          },
          padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
        ),
        actions: [
          IconButton(
            visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            icon: Icon(
              Icons.refresh,
              color: Colors.red,
            ),
            iconSize: 40,
            onPressed: () async {
                         var url = Uri.parse('http://192.168.0.110/doctors/api/health_services');
                          var response = await http.get(url);
                          print('Response status: ${response.statusCode}');
                       },
          ),
        ],
      ),
      body: FutureBuilder(
          future: getServiceCategory(),
          builder:  (BuildContext context, AsyncSnapshot snapshot)
          {
            if(snapshot.data==null)
            {
              return Center(child: CircularProgressIndicator(),);
            }
            else
            {
              return Items(list: snapshot.data);
            }
          }
        ),
    
    );
  }
}


// ignore: must_be_immutable
class Items extends StatelessWidget{
    List<ServiceCategory> list;

    Items( {required this.list});
   @override
   Widget build(BuildContext context)
   {
     print(list.length);
     return ListView.builder(
          // ignore: unnecessary_null_comparison
          itemCount: list.length,
          
          itemBuilder: (ctx,i){
            return ListTile(
                title: Text(list[i].name),
                subtitle: Text(list[i].id.toString()),
                tileColor: Colors.white60,
                onTap: (){
                  
                },
            );
          }
       );
   }
}

class ServiceCategory{
    final String id;
    final String name;
    ServiceCategory(this.id,this.name);
}