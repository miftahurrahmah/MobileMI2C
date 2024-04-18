import 'dart:convert';
import 'dart:html';
import 'dart:js_interop';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/model_users.dart';


class PageListUsers extends StatefulWidget {
  const PageListUsers({super.key});

  @override
  State<PageListUsers> createState() => _PageListUsersState();
}

class _PageListUsersState extends State<PageListUsers> {
  bool isLoading = false;
  List<ModelUsers> listUsers = [];

  Future getUsers() async{
    try{
      setState(() {
        isLoading = true;
      });
      http.Response response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
      var data = jsonDecode(response.body);
      setState(() {
        for(Map<String, dynamic> i in data){
          listUsers.add(ModelUsers.fromJson(i));
        }
      });
    }catch(e){
      setState(() {
        isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString()))
        );
      });
    }
  }

  @override
  void initState(){
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('List Users Api'),
      ),
     body: ListView.builder(
          itemCount: listUsers.length,
          itemBuilder: (context, index){
            return Padding(
              padding: EdgeInsets.all(10),
              child: Card(
                child: ListTile(
                  title: Text(
                    listUsers[index].name ?? "",
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                  ),
                  subtitle: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Company: ${listUsers[index].email}  """),
                      Text("City: ${listUsers[index].address.city}  """),
                      Text("Company: ${listUsers[index].company.name}  """),
                    ],
                  ),
                ),
              ),

    );
    },),
    );
  }
}


