import 'package:flutter/material.dart';

import '../db/db_helper.dart';
import '../models/crud_model.dart';


class CRUDProvider extends ChangeNotifier{
  List<CRUDModel> list = [];

  Future<Map> insert(CRUDModel crudModel)=> DBHelper.insert(crudModel);

  void getAll()async{
    list = await DBHelper.getAll();
    notifyListeners();
  }

  Future<Map> updateById(String? id,String column,dynamic value){
    return DBHelper.updateById(id, column, value);
  }

  Future<Map> deleteById(String? id) async{
  return await DBHelper.deleteById(id);

  }
}
