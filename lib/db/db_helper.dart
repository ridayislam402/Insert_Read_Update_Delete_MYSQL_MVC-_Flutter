import 'dart:convert';

import 'package:insert_read_update_delete_mysql_flutter/models/crud_model.dart';
import 'package:http/http.dart' as http;

class DBHelper{
  final insertUrl = Uri.parse("https://ecommerceprojectriday.000webhostapp.com/app/insert.php");
  var readUrl=Uri.parse('https://ecommerceprojectriday.000webhostapp.com/app/read.php');
  var updateUrl=Uri.parse('https://ecommerceprojectriday.000webhostapp.com/app/update.php');
  var deleteUrl = Uri.parse('https://ecommerceprojectriday.000webhostapp.com/app/delete.php');


  Future<Map> insert(CRUDModel crudModel)async {
    final res = await http.post(insertUrl, body: crudModel.toMap());
    return jsonDecode(res.body);
  }
  Future<List<CRUDModel>> getAll()async{
    final response = await http.get(readUrl);
    final jsonData = response.body;
    final list = crudModelFromJson(jsonData);
    return list;
  }

  Future<Map> updateById(String? id,String column,dynamic value)async{
    final res = await http.post(updateUrl, body: {crudId : id, crudDesc : value});
    return jsonDecode(res.body);
  }

  Future<Map> deleteById(String? id) async{
    final res = await http.post(deleteUrl, body: {crudId : id});
    return jsonDecode(res.body);
  }

}
