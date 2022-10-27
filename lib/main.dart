import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:insert_read_update_delete_mysql_flutter/pages/delete_page.dart';
import 'package:insert_read_update_delete_mysql_flutter/pages/insert_page.dart';
import 'package:insert_read_update_delete_mysql_flutter/pages/menu_page.dart';
import 'package:insert_read_update_delete_mysql_flutter/pages/read_page.dart';
import 'package:insert_read_update_delete_mysql_flutter/pages/update_page.dart';
import 'package:insert_read_update_delete_mysql_flutter/providers/crud_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => CRUDProvider(),child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: EasyLoading.init(),
    initialRoute: MenuPage.routeName,
      routes: {
        MenuPage.routeName :(context) => MenuPage(),
        InsertPage.routeName :(context) => InsertPage(),
        ReadPage.routeName :(context) => ReadPage(),
        UpdatePage.routeName :(context) => UpdatePage(),
        DeletePage.routeName :(context) => DeletePage(),

      },
    );
  }
}
