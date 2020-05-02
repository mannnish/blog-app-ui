import 'package:flutter/material.dart';

class PostCardRec extends StatefulWidget {
  @override
  _PostCardRecState createState() => _PostCardRecState();
}

class _PostCardRecState extends State<PostCardRec> {
  double w, h;

  Widget singleCard(Color color_arg, String title, String desc, String imgurl) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      height: h * 0.275,
      width: w * 0.43,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 20,
              spreadRadius: 0.2,
            )
          ]),
      child: Column(
        children: [
          Container(
            height: h * 0.2,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imgurl), fit: BoxFit.cover),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              // color: color_arg
            ),
          ),
          Container(
            height: h * 0.025,
            width: double.infinity,
            margin: EdgeInsets.only(left: w * 0.05, top: h * 0.01),
            // color: Colors.yellow,
            child: FittedBox(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: TextStyle(fontFamily: 'OpenSans'),
              ),
            ),
          ),
          Container(
            height: h * 0.020,
            width: double.infinity,
            margin: EdgeInsets.only(left: w * 0.05, top: h * 0.005),
            // color: Colors.yellow,
            child: FittedBox(
              alignment: Alignment.centerLeft,
              child: Text(desc),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: w * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              singleCard(Colors.red, 'Free?', 'Tina Rataj',
                  'https://picsum.photos/id/100/200/300'),
              singleCard(Colors.red, 'Last of Nature', 'Paul Jarvis',
                  'https://picsum.photos/id/10/200/300'),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: w * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              singleCard(Colors.red, 'Sahara', 'Lukas',
                  'https://picsum.photos/id/1000/200/300'),
              singleCard(Colors.red, 'Dignity', 'Barden Horst',
                  'https://picsum.photos/id/101/200/300'),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: w * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              singleCard(Colors.red, 'Daily Life', 'Alejandro Escamilla',
                  'https://picsum.photos/id/0/200/300'),
              singleCard(Colors.red, 'We : Apart', 'Chris Campbell',
                  'https://picsum.photos/id/1009/200/300'),

            ],
          ),
        ),
      ],
    );
  }
}
