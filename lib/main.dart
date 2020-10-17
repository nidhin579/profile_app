import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'homepage.dart';
import 'editpage.dart';
import 'package:provider/provider.dart';
import 'model.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(Main());
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Model>(
      create: (context) => Model(),
      child: MaterialApp(
          initialRoute: HomePage.id,
          routes: {
            HomePage.id: (context) => HomePage(),
            EditPage.id: (context) => EditPage()
          },
          home: HomePage()),
    );
  }
}
