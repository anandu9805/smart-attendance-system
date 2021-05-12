import 'package:attendence/widget/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: FlatButton(
            child: Icon(Icons.camera_alt_outlined),
            onPressed: () {
              Navigator.pushNamed(context, 'imagepicker',
                  arguments: {'first': 'Anandu'});
            },
          ),
        ),
      ),
    );
  }
}
