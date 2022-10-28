import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:insert_read_update_delete_mysql_flutter/models/crud_model.dart';
import 'package:provider/provider.dart';

import '../providers/crud_provider.dart';
import '../util/helper_function.dart';

class UpdatePage extends StatefulWidget {
  static const routeName = '/update';

  const UpdatePage({Key? key}) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  @override
  Widget build(BuildContext context) {
    Provider.of<CRUDProvider>(context, listen: false).getAll();
    return Scaffold(
        appBar: AppBar(
          title: Text('Update'),
        ),
        body: Consumer<CRUDProvider>(
          builder: (context, provider, child) => provider.list.isEmpty
              ? Center(
            child: CircularProgressIndicator(),
          )
              : ListView.builder(
            itemCount: provider.list.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(provider.list![index].name),
                trailing: Text(provider.list[index].desc),
                leading: IconButton(
                    onPressed: () {
                      showUpdateDialog(
                          context: context,
                          desc: 'Desc : ${provider.list[index].desc}',
                          onSave: (value) {
                            EasyLoading.show(status: 'loading...');
                            provider.updateById(provider.list[index].id, crudDesc, value).then((value) {
                              setState(() {
                                if(value != null){
                                  print('ok now $value');
                                  EasyLoading.dismiss();
                                  //  ponse = 'Data Inserted';
                                  //  Navigator.pushNamed(context, ReadPage.routeName);
                                }
                              });
                            }).catchError((error){
                              setState(() {
                                print('not ok : $error');
                                EasyLoading.dismiss();
                                // ponse = 'Data not Inserted';
                              });
                            });


                          });
                    },
                    icon: Icon(Icons.edit)),
              );
            },
          ),
        ));
  }
}

