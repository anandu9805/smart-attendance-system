import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; //this package contains the File
import 'package:http/http.dart' as http;
import 'dart:convert'; //to use json

class UserImagePicker extends StatefulWidget {





  // final void Function(File imagepicked) pickImageFn;

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File _imageFile;
  String url ;

  Future<String> uploadImage(filename, url) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('picture', filename));//function to upload the image
    print(request.files[0]);
    var res = await request.send();

    return res.reasonPhrase;
  }


  void _fromgallery() async {
    final pickedImageFile = await ImagePicker.pickImage(
        source: ImageSource.gallery,imageQuality: 100,
        maxWidth: 3000,
        maxHeight: 4000);

    url = 'http://192.168.29.250:5000/image/studentdata';
    var res = await uploadImage(pickedImageFile.path,url);

    setState(() {
      _imageFile = pickedImageFile;

    });}

  void _selectImage() async {
    final pickedImageFile = await ImagePicker.pickImage(
        source: ImageSource.camera,
        imageQuality:100,
        maxWidth:3000,
        maxHeight:4000);
    url = 'http://192.168.29.250:5000/image/studentattendance';
    var res = await uploadImage(pickedImageFile.path,url);


    setState(() {
      _imageFile = pickedImageFile;


    });
    /*if(_imageFile!=null)
      {
        var ref=FirebaseStorage.instance.ref().child('image_folder').child(auth.user.uid+'.png');
        await ref.putFile(_imageFile).onComplete;
        final url=await ref.getDownloadURL();
      }*/
    // widget.pickImageFn(_imageFile);
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final who = args["key"];
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            if(who =="Student")
            Container(
              child: _imageFile != null
                  ? Image.file(
                _imageFile,
                fit: BoxFit.fill,
              )
                  : Align(
                  alignment: Alignment.center,
                  child: Center(
                    child: ListTile(onTap: () {
                  _fromgallery();
                  },
                      leading: Icon(Icons.add),
                      title: Text('add student'),
                    ),
                  )),
              width: double.infinity,
              height: (MediaQuery.of(context).size.height) * 3 / 4,
            ),
            if(who=="Teacher")
            Align(alignment: Alignment.center,
              child: Center(
                child: FlatButton.icon(
                    onPressed: () {
                      _selectImage();
                    },
                    icon: Icon(Icons.image),
                    label: Text('Take attendence')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
