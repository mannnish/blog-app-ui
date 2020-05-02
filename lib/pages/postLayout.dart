import 'package:flutter/material.dart';

class PostLayout extends StatefulWidget {
  List details;
  PostLayout({this.details});
  @override
  _PostLayoutState createState() => _PostLayoutState();
}

class _PostLayoutState extends State<PostLayout> {
  double w, h;

  Widget post() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              margin:
                  EdgeInsets.only(left: w * 0.08, right: w * 0.08, bottom: 20),
              height: w * 0.80 * 1.2,
              width: double.infinity,
              decoration: BoxDecoration(
                  // color: Colors.red,
                  image: DecorationImage(
                    image: AssetImage(widget.details[0]),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.08),
            child: Text(
              widget.details[1],
              style: TextStyle(fontSize: 30, fontFamily: 'OpenSans'),
              textAlign: TextAlign.left,
            ),
          ),
          // Flexible(child: Text(widget.details[2]))
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: w * 0.08, vertical: h * 0.02),
            child: Text(
              widget.details[2],
              style: TextStyle(fontSize: 16.5),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            margin:
                EdgeInsets.symmetric(vertical: h * 0.02, horizontal: w * 0.2),
            child: Divider(
              // height: 3,
              thickness: 2,
              color: Colors.blue,
            ),
          ),
          Container(
            margin:
                EdgeInsets.symmetric(vertical: h * 0.02, horizontal: w * 0.08),
            height: w * 0.15,
            // color: Colors.red,
            child: Row(
              children: [
                Container(
                  width: w * 0.15,
                  // color: Colors.yellow,
                  child: Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage(widget.details[5]),
                      radius: w * 0.06,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    // color: Colors.blue,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.bottomLeft,
                          height: w * 0.075,
                          child: Text(
                            widget.details[3],
                            style:
                                TextStyle(fontSize: 18, fontFamily: 'OpenSans'),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          height: w * 0.075,
                          child: Text(
                            widget.details[4],
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'OpenSans',
                                color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: h * 0.1),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        post(),
        Container(
          margin: EdgeInsets.only(top: h * 0.65),
          height: double.infinity,
          width: double.infinity,
          // color: Colors.red,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                0.3,
                0.7
              ],
                  colors: [
                // Colors.white10,
                Colors.white10,
                // Colors.white70,
                Colors.white,
              ])),
        )
      ],
    );
  }
}
