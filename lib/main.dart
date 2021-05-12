import 'package:flutter/material.dart';
import './screens/screen1.dart';
import './widget/image_picker.dart';
import './screens/page1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner:false,
      theme: ThemeData(

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:Page1(),
      routes: {

        'imagepicker':(context)
        {
          return  UserImagePicker();
        }
      },
    );
  }
}

