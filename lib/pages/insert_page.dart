import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:insert_read_update_delete_mysql_flutter/pages/read_page.dart';
import 'package:provider/provider.dart';

import '../db/db_helper.dart';
import '../models/crud_model.dart';
import '../providers/crud_provider.dart';

class InsertPage extends StatefulWidget {
  static const routeName = '/insert';

  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
 // const InsertPage({Key? key}) : super(key: key);
  final name = TextEditingController();
  final description = TextEditingController();
  final _globalKey = GlobalKey<FormState>();
  String ponse = '';
  @override
  void dispose() {
    name.dispose();
    description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Insert'),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Center(
          child: Form(
            key: _globalKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    label: Text('Name'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return 'The field must not be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: description,
                  decoration: InputDecoration(
                    label: Text('Description'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return 'The field must not be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: () {
                  _insertlogic();
                  EasyLoading.show(status: 'loading...');
                }, child: Text('Insert')
                ),
                SizedBox(height: 20,),
                Text(ponse!,style: TextStyle(color: Colors.black),)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _insertlogic() async{
    if(_globalKey.currentState!.validate()){
      try{
        final response = CRUDModel(
            name: name.text,
            desc: description.text
        );
        //insert(response);
        Provider.of<CRUDProvider>(context,listen: false).insert(response).then((value){
            if(value != null){
              EasyLoading.dismiss();
              ponse = 'Data Inserted';
              Navigator.pushNamed(context, ReadPage.routeName);
            }

        }).catchError((error)
            {
              setState(() {
                EasyLoading.dismiss();
                ponse = 'Data not Inserted';
              });
            });
      }catch(e){
        print(e);
      }

    }
  }
}
