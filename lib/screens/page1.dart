import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlatButton(
            color: Colors.grey,
            onPressed: () {
              Navigator.pushNamed(context, 'imagepicker',
                  arguments: {'key': 'Student'});
            },
            child: Text(
              'Student',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            minWidth: double.infinity,
          ),
          SizedBox(height: 30),
          FlatButton(
            color: Colors.grey,
            onPressed: () {
              Navigator.pushNamed(context, 'imagepicker',
                  arguments: {'key': 'Teacher'});
            },
            child: Text(
              'Teacher',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            minWidth: double.infinity,
          )
        ],
      ),
    );
  }
}
