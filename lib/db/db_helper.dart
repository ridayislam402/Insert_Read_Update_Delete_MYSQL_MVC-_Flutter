import 'dart:convert';

import 'package:insert_read_update_delete_mysql_flutter/models/crud_model.dart';
import 'package:http/http.dart' as http;

final insertUrl = Uri.parse("https://ecommerceprojectriday.000webhostapp.com/app/insert.php");
final readUrl=Uri.parse('https://ecommerceprojectriday.000webhostapp.com/app/read.php');
final updateUrl=Uri.parse('https://ecommerceprojectriday.000webhostapp.com/app/update.php');
final deleteUrl = Uri.parse('https://ecommerceprojectriday.000webhostapp.com/app/delete.php');
class DBHelper{



 static Future<Map> insert(CRUDModel crudModel)async {
    final res = await http.post(insertUrl, body: crudModel.toMap());
    return jsonDecode(res.body);
  }
 static Future<List<CRUDModel>> getAll()async{
    final response = await http.get(readUrl);
    final jsonData = response.body;
    final list = crudModelFromJson(jsonData);
    return list;
  }

 static Future<Map> updateById(String? id,String column,dynamic value)async{
    final res = await http.post(updateUrl, body: {crudId : id, crudDesc : value});
    return jsonDecode(res.body);
  }

 static Future<Map> deleteById(String? id) async{
    final res = await http.post(deleteUrl, body: {crudId : id});
    return jsonDecode(res.body);
  }

}
//Riday