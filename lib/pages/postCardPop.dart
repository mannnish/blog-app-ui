import 'package:flutter/material.dart';

class PostCardPop extends StatefulWidget {
  @override
  _PostCardPopState createState() => _PostCardPopState();
}

class _PostCardPopState extends State<PostCardPop> {
  double w, h;

  Widget singleCard(Color color_arg, String title, String desc) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      height: h * 0.275,
      width: w * 0.43,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.3),
            blurRadius: 20,
            spreadRadius: 0.2,
          )
        ]
      ),
      child: Column(
        children: [
          Container(
            height: h * 0.2,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
                color: color_arg),
          ),
          Container(
            height: h*0.025,
            width: double.infinity,
            margin: EdgeInsets.only(left : w*0.05,top:h*0.01),
            // color: Colors.yellow,
            child: FittedBox(
              alignment: Alignment.centerLeft,
              child: Text(title, style: TextStyle(fontFamily: 'OpenSans'),),
            ),
          ),
          Container(
            height: h*0.020,
            width: double.infinity,
            margin: EdgeInsets.only(left : w*0.05,top:h*0.005),
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
              singleCard(Colors.blue, 'title', 'desc'),
              singleCard(Colors.blueAccent, 'title2', 'desc2'),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: w * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              singleCard(Colors.lightBlue, 'title', 'desc'),
              singleCard(Colors.lightBlueAccent, 'title2', 'desc2'),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: w * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              singleCard(Colors.red, 'title', 'desc'),
              singleCard(Colors.red, 'title2', 'desc2'),
            ],
          ),
        ),
      ],
    );
  }
}
