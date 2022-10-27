
  import 'dart:convert';
const crudId = 'id';
const crudName = 'name';
const crudDesc = 'description';
  List<CRUDModel> crudModelFromJson(String str) => List<CRUDModel>.from(json.decode(str).map((x) => CRUDModel.fromMap(x)));

  String crudModelToJson(List<CRUDModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

  class CRUDModel {
    String? id;
    String name;
    String desc;

    CRUDModel({required this.name,required this.desc, this.id,});

    Map<String, dynamic> toMap() {
     final map= <String, dynamic>{
        crudName: name,
        crudDesc: desc
      };
     if(id != null){
       map[crudId] = id;
     }
     return map;
    }
    factory CRUDModel.fromMap(Map<String, dynamic> map) => CRUDModel(
        id: map[crudId],
        name: map[crudName],
        desc: map[crudDesc],
    );
  }
