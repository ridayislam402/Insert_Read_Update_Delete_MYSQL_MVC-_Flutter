import 'package:flutter/material.dart';
import 'package:insert_read_update_delete_mysql_flutter/pages/delete_page.dart';
import 'package:insert_read_update_delete_mysql_flutter/pages/insert_page.dart';
import 'package:insert_read_update_delete_mysql_flutter/pages/read_page.dart';
import 'package:insert_read_update_delete_mysql_flutter/pages/update_page.dart';

class MenuPage extends StatelessWidget {
  static const routeName ='/menu';
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menu'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('CRUD with MYSQL',style: TextStyle(fontSize: 30),),
            SizedBox(height: 50,),
            ElevatedButton(onPressed: () {
            Navigator.pushNamed(context, InsertPage.routeName);
            }, child: Text('Insert')
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, ReadPage.routeName);
            }, child: Text('Read')
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, UpdatePage.routeName);
            }, child: Text('Update')
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, DeletePage.routeName);
            }, child: Text('Delete')
            ),
          ],
        ),
      ),
    );
  }
}
