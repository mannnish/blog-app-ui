import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  double w, h;
  String title = "", desc = "";
  File _imgfile;

  Future _getImage() async {
    final file = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imgfile = file;
    });
  }

  Widget form() {
    return Column(
      children: [
        // Submit Post title
        Container(
          margin:
              EdgeInsets.symmetric(vertical: h * 0.05, horizontal: w * 0.05),
          height: h * 0.1,
          width: double.infinity,
          // color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: h * 0.03),
                height: double.infinity,
                // color: Colors.blue,
                child: FittedBox(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Submit Post',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'MS-Black'),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: h * 0.04),
                height: double.infinity,
                // color: Colors.blue,
                child: FittedBox(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Done',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'MS-Black'),
                  ),
                ),
              ),
            ],
          ),
        ),

        //  title and desc input fields
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: w * 0.05),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.3),
                  blurRadius: 10,
                  spreadRadius: 0.2)
            ],
          ),
          child: Column(children: [
            Container(
              child: TextField(
                style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontFamily: 'OpenSans-Bold',
                    fontSize: 25),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: w * 0.05, top: w * 0.1),
                  hintText: title == "" ? "Title goes here" : title,
                ),
                onChanged: (val) {
                  setState(() {
                    title = val;
                  });
                },
              ),
            ),
            Container(
              child: TextField(
                maxLines: 6,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontFamily: 'OpenSans-Bold',
                    fontSize: 20),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: w * 0.05, top: w * 0.05),
                  hintText: desc == "" ? "Description goes here" : desc,
                ),
                onChanged: (val) {
                  setState(() {
                    desc = val;
                  });
                },
              ),
            ),
          ]),
        ),

        // tag and location
        Container(
          margin:
              EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.05),
          // height: h * 0.20,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.3),
                  blurRadius: 10,
                  spreadRadius: 0.2)
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: w * 0.05,
                  right: w * 0.05,
                  top: w * 0.04,
                  bottom: w * 0.02,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Select Category',
                      style:
                          TextStyle(fontSize: 17, fontFamily: 'OpenSans-Bold'),
                    ),
                    Icon(Icons.tag_faces),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                child: Divider(
                  thickness: 1,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: w * 0.05,
                    right: w * 0.05,
                    top: w * 0.02,
                    bottom: w * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Location',
                      style:
                          TextStyle(fontSize: 17, fontFamily: 'OpenSans-Bold'),
                    ),
                    Icon(Icons.not_listed_location),
                  ],
                ),
              ),
            ],
          ),
        ),

        // image picker
        InkWell(
          onTap: _getImage,
          child: Container(
            width: double.infinity,
            height: h * 0.3,
            margin: EdgeInsets.symmetric(horizontal: w * 0.05),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              image: _imgfile == null ? null : DecorationImage(
                image: FileImage(_imgfile),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                    blurRadius: 10,
                    spreadRadius: 0.2),
              ],
            ),
            child: _imgfile == null
                ? Center(
                    child: Text(
                      'Tap to select an image',
                      style: TextStyle(
                          fontFamily: 'OpenSans-Bold',
                          fontSize: 18,
                          color: Colors.grey),
                    ),
                  )
                : null,
          ),
        ),
        SizedBox(
          height: h * 0.1,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Container(
          height: h * 0.3,
          width: double.infinity,
          color: Color.fromRGBO(141, 178, 197, 1),
        ),
        Expanded(child: SingleChildScrollView(child: form())),
      ],
    );
  }
}
