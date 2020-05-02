import '../pages/postCardRec.dart';
import '../pages/postCardPop.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  double w, h;
  int opt = 0;

  Widget topbar() {
    return Column(
      children: [
        // upper part
        Container(
          padding: EdgeInsets.only(top: h * 0.05),
          width: double.infinity,
          color: Color.fromRGBO(117, 221, 209, 1),
          height: h * 0.3,
          child: Column(
            children: [
              //padding (h=0.05)
              // profile -text (h = 0.10)
              Container(
                height: h * 0.1,
                width: double.infinity,
                // color: Colors.red,
                child: Container(
                  margin: EdgeInsets.only(
                      top: h * 0.03, bottom: h * 0.03, left: w * 0.05),
                  // color: Colors.blue,
                  child: FittedBox(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Profile',
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'MS-Black'),
                    ),
                  ),
                ),
              ),

              // photo and name (h=0.07)
              Container(
                height: h * 0.07,
                padding: EdgeInsets.only(left: w * 0.05),
                // color: Colors.orange,
                child: Row(
                  children: [
                    Container(
                      width: h * 0.07,
                      // color: Colors.yellow,
                      child: Center(
                        child: CircleAvatar(
                          backgroundImage: AssetImage('icons/ppl_user37.jpg'),
                          radius: w * 0.06,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: w * 0.02,
                    ),
                    Expanded(
                      child: Container(
                        // color: Colors.blue,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                // height: w * 0.075,
                                // color: Colors.white,
                                child: Text(
                                  'Max Muller',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'OpenSans',
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.topLeft,
                                // height: w * 0.075,
                                // color: Colors.black,
                                child: Text(
                                  'Illinois, USA',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'OpenSans',
                                      color: Colors.white70),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // below part

        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // recommend or popular
                Container(
                  margin: EdgeInsets.only(
                      top: h * 0.1, left: w * 0.05, right: w * 0.05),
                  height: h * 0.06,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color.fromRGBO(238, 238, 238, 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            opt = 0;
                          });
                        },
                        child: Container(
                          width: w * 0.45,
                          height: h * 0.06,
                          decoration: BoxDecoration(
                              color: opt == 0
                                  ? Color.fromRGBO(117, 221, 209, 1)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(25)),
                          child: Center(
                            child: Text(
                              'Reccomend',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: opt == 0 ? Colors.white : Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            opt = 1;
                          });
                        },
                        child: Container(
                          width: w * 0.45,
                          height: h * 0.06,
                          decoration: BoxDecoration(
                              color: opt != 0
                                  ? Color.fromRGBO(117, 221, 209, 1)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(25)),
                          child: Center(
                            child: Text(
                              'Popular',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: opt != 0 ? Colors.white : Colors.grey),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                // cards

                opt == 0 ? PostCardRec() : PostCardPop(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget stackedFlex(String count, String desc) {
    return Flexible(
      flex: 1,
      child: Column(
        children: [
          Flexible(
            flex: 7,
            child: Container(
              // color: Colors.red,
              alignment: Alignment.bottomCenter,
              child: Text(
                count,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                    fontFamily: 'OpenSans-Bold'),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(),
          ),
          Flexible(
            flex: 5,
            child: Container(
              // color: Colors.blue,
              alignment: Alignment.topCenter,
              child: Text(
                desc,
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
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
    return Stack(
      children: [
        topbar(),
        // display elevated card after h*0.2 with an height of h*0.2 and then insert padding
        Positioned(
          top: h * 0.2,
          child: Container(
            height: h * 0.2,
            width: w * 1,
            // color: Colors.blue,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: w * 0.05),
              // height: h * 0.10,
              margin: EdgeInsets.symmetric(
                  horizontal: w * 0.05, vertical: h * 0.05),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.2),
                        blurRadius: 15.0,
                        spreadRadius: 0.1,
                        offset: Offset(0, 10)),
                  ]),
              child: Row(
                children: [
                  stackedFlex('129', 'Likes'),
                  stackedFlex('24', 'Shares'),
                  stackedFlex('61', 'Fans'),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
