import 'package:flutter/material.dart';

import '../db/db_helper.dart';
import '../models/crud_model.dart';


class CRUDProvider extends ChangeNotifier{
  List<CRUDModel> list = [];

  Future<Map> insert(CRUDModel crudModel)=> DBHelper().insert(crudModel);

  void getAll()async{
    list = await DBHelper().getAll();
    notifyListeners();
  }

  Future<int> updateById(String id,String column,dynamic value){
    return DBHelper().updateById(id, column, value);
  }

}