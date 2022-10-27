import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:insert_read_update_delete_mysql_flutter/providers/crud_provider.dart';
import 'package:provider/provider.dart';

import '../models/crud_model.dart';

class ReadPage extends StatelessWidget {
  static const routeName ='/read';
  const ReadPage({Key? key}) : super(key: key);

/*  List<CRUDModel> list = [];
  bool isloaded = false;
  @override
  void initState() {
   loadData();
    super.initState();
  }
  var url=Uri.parse('https://ecommerceprojectriday.000webhostapp.com/app/read.php');
  Future<void> loadData() async{
    var response = await http.get(url);
    var jsonData = response.body;
         list = crudModelFromJson(jsonData);
    if(list != null){
      setState((){
        isloaded=true;
        print(isloaded);
      });
  }
  }*/
  @override
  Widget build(BuildContext context) {
    Provider.of<CRUDProvider>(context,listen: false).getAll();
    return Scaffold(
      appBar: AppBar(title: Text('Read'),),
      body:Consumer<CRUDProvider>(
        builder: (context, provider, child) => provider.list.isEmpty ?
            Center(child: CircularProgressIndicator(),)
         :ListView.builder(
          itemCount: provider.list.length,
          itemBuilder: (context, index) {
          return ListTile(
            title: Text(provider.list![index].name),
            trailing: Text(provider.list[index].desc),
            leading: Text(provider.list[index].id.toString()),

          );
        },
        ),
      )
    );
  }
}
