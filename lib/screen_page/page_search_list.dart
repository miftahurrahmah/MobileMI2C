import 'dart:js_interop';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:untitled/screen_page/page_column.dart';
import 'package:untitled/screen_page/page_passing_data.dart';

class PageSearchList extends StatefulWidget {
  const PageSearchList({super.key});

  @override
  State<PageSearchList> createState() => _PageSearchListState();
}

class _PageSearchListState extends State<PageSearchList> {
  //item array untuk data list
  List<String> ListDevice=[
    "Iphone",
    "Xiaomi",
    "Oppo",
    "Vivo",
    "Samsung",
    "Sony",
    "Ipad",
    "Twacth",
    "Mackbook",
    "Lenovo Thinkpad"
  ];

  bool isCari = true;
  List<String> filterDevice=[];
  TextEditingController txtCari = TextEditingController();

  _PageSearchListState(){
    txtCari.addListener(() {
      if(txtCari.text.isEmpty){
        setState(() {
          isCari = true;
          txtCari.text = "";
        });
      }else{
        setState(() {
          isCari = false;
          txtCari.text != "";
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Search List'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextFormField(
              controller: txtCari,
              decoration: InputDecoration(
                hintText: "Search..",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none
                ),
                filled: true,
                fillColor: Colors.grey.withOpacity(1)
              ),
            ),

            //kondisi untuk data list
            isCari ?  Expanded(
                child: ListView.builder(
                  itemCount: ListDevice.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      title: Text(ListDevice[index]),
                    );
                  },
                )
            )
                : CreateFilterList()
          ],
        ),
      ),
    );
  }

  Widget CreateFilterList(){
    filterDevice = [];
    for(int i = 0; i<ListDevice.length; i++){
      var item = ListDevice[i];
      if(item.toLowerCase().contains(txtCari.text.toLowerCase())){
        filterDevice.add(item);
      }
    }
    return HasilSearch();
  }

  Widget HasilSearch() {
    return Expanded(
      child: ListView.builder(
        itemCount: filterDevice.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(filterDevice[index]),
          );
        },
      ),
    );
  }
}




