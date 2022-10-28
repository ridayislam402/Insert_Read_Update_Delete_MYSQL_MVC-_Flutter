import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import '../providers/crud_provider.dart';
import '../util/helper_function.dart';

class DeletePage extends StatefulWidget {
  static const routeName ='/delete';
  const DeletePage({Key? key}) : super(key: key);

  @override
  State<DeletePage> createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
  @override
  Widget build(BuildContext context) {
    Provider.of<CRUDProvider>(context, listen: false).getAll();
    return Scaffold(
        appBar: AppBar(
          title: Text('Delete'),
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
                      showDeleteDialog(
                          context: context,
                          onDelete: (val) {
                            EasyLoading.show(status: 'loading...');
                            if(val){
                              print('true');
                              provider.deleteById(provider.list[index].id).then((value) {
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
                            }else{
                              EasyLoading.dismiss();
                            }
                          });
                    },
                    icon: Icon(Icons.delete)),
              );
            },
          ),
        ));
  }
}
