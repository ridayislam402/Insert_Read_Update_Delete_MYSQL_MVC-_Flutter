import 'package:flutter/material.dart';
import 'package:insert_read_update_delete_mysql_flutter/models/crud_model.dart';
import 'package:provider/provider.dart';

import '../providers/crud_provider.dart';
import '../util/helper_function.dart';

class UpdatePage extends StatelessWidget {
  static const routeName = '/update';

  const UpdatePage({Key? key}) : super(key: key);

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
                                  provider.updateById(provider.list[index].id, crudDesc, value);
                                });
                          },
                          icon: Icon(Icons.edit)),
                    );
                  },
                ),
        ));
  }


}
