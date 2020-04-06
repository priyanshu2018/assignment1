import 'package:flutter/material.dart';
import 'ui.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        fontFamily: 'Poppins',

        hintColor: Colors.white,




        textTheme: TextTheme(
          title: TextStyle(color: Colors.white),
        ),


        inputDecorationTheme: InputDecorationTheme(
            focusColor: Colors.white,
            focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade500,width: 4),
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(4)),
          )
        ),

        primarySwatch: Colors.blue,

      ),
      home: MyHomePage(),
    );
  }
}

