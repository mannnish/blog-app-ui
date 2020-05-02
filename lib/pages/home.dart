import 'package:blogApp/pages/postLayout.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double h, w;
  String _text = "";
  PageController _pc = PageController(initialPage: 0);
  List color_list = [Colors.red, Colors.yellow, Colors.blue];
  Widget _ac;

  int i = 0;

  List details = [
    [
      'icons/cube.jpg',
      'Packing Cube',
      'A packing cube is a soft, compact bag that helps you organise all your stuff when you pack for a trip.You fill each cube with clothes, gadgets or whatever and then pack the whole thing into your backpack. To be as organised as possible, it’s a good idea to separate your possessions into groups and have a packing cube for each group. For example, all t-shirts go in one and all shorts and trousers go in another. This will make it easier to pack and unpack if you’re ever in a hurry or you need to get something out your bag But I know what you’re thinking… “Won’t these packing cubes just take up even more space in my bag?”. Well, If you use them right, packing cubes can actually help you save space as well as keep everything organised and reduce the number of wrinkles your clothes will inevitably get. Bonus!',
      'Arthur Fleck',
      'Chicago, USA',
      'icons/ppl_user64.jpg'
    ],
    [
      'icons/bag.jpg',
      'Micro Packing',
      'A lot of the time, when we travel these days, we are focused on seeing and doing as much as possible. We frantically try to squeeze everything into the small amount of time we have and we only end up with a “surface-level” experience and understanding of a place. When we micro travel, we may not see as many different places or do so many things but we do have a far deeper experience and understanding of that place. If you’re sitting at home right now, I challenge you to go out and “micro travel” through your neighbourhood or city. Really try to take it all in. What can you experience that you haven’t before? Also, next time you’re planning to go away travelling (for real), whether it’s for a week, a month or a year, consider limiting the number of places you visit and instead, spend longer in fewer places. In a way, travel is a lot like friendship… Would you rather have 15 acquaintances in your life or one or two true friends? Remember that more doesn’t always mean better.',
      'John Doe',
      'Minnesota, USA',
      'icons/ppl_user37.jpg'
    ],
    [
      'icons/table.jpg',
      'Essential Packing',
      'I personally travel everywhere with just a backpack and nothing else (unless I’m going skiing or snowboarding). This is a must if your aim is to travel light! *In case you’re new to this blog, suitcases suck! That’s the prevailing opinion in the backpacker community so, from this point forward, I’m going to assume that you have come to your senses and have decided to travel with a backpack instead. No matter what kind of trip you are embarking on, it is crucially important that you choose the right bag (backpack) to suit your travel needs. You’re going to essentially be living out of this thing so you’re going to want it to be up to the task (especially if you’re travelling for an extended period of time). For all you trusty backpackers, I would recommend the Osprey Farpoint 40L if you want a bag that will be accepted as carry-on luggage. If you’re okay with checking your bag in, you can opt for one of the bigger sizes like the Farpoint 55 or the Farpoint 70.',
      'Ali Hasan',
      'Delhi, India',
      'icons/ppl_user48.jpg'
    ],
  ];

  Widget topbar_one() {
    return Container(
      // color: Colors.red,
      height: h * 0.1,
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: w * 0.1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              // color: Colors.blue,
              height: h * 0.1,
              width: w * 0.5,
              child: FittedBox(
                child: Text(
                  'New way',
                  style: TextStyle(
                      // fontSize: 30,
                      fontFamily: 'MS-Black',
                      color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              width: w * 0.02,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  print("switch one");
                  _ac = topbar_two();
                });
              },
              child: Container(
                // margin: EdgeInsets.only(right: 30),
                height: w * 0.1,
                width: w * 0.1,
                child: Container(
                  margin: EdgeInsets.all(w * 0.02),
                  decoration: BoxDecoration(
                    // color: Colors.yellow,
                    image: DecorationImage(
                        image: AssetImage('icons/searchicon.png')),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget topbar_two() {
    _text = "";
    return Container(
      // color: Colors.red,
      height: h * 0.1,
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: w * 0.1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Container(
              height: w * 0.1,
              // width: w * 0.7,
              decoration: BoxDecoration(
                // color: Colors.blue,
                //border: Border.all(width: 1, color: Colors.black),
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(230, 230, 230, 1),
              ),
              padding: EdgeInsets.only(left: 5),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                  hintText: _text == "" ? "Search.." : _text,
                  hintStyle: TextStyle(color: Colors.black),
                ),
                onChanged: (val) {
                  setState(() {
                    _text = val;
                  });
                },
              ),
            )),
            SizedBox(
              width: w * 0.02,
            ),
            InkWell(
              onTap: () => setState(() {
                _ac = topbar_one();
              }),
              child: Container(
                // margin: EdgeInsets.only(right: 30),
                height: w * 0.1,
                width: w * 0.15,
                child: Container(
                  margin: EdgeInsets.all(w * 0.02),
                  child: FittedBox(
                    child: Text('Cancel'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget postPageUpperPart() {
    return SafeArea(
        child: Column(
      children: [
        AnimatedSwitcher(
          duration: Duration(seconds: 3),
          switchInCurve: Curves.bounceIn,
          switchOutCurve: Curves.bounceOut,
          // curve: Curves.fastOutSlowIn,
          child: _ac == null ? topbar_one() : _ac,
        ),
        Expanded(
          // width: double.infinity,
          child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _pc,
              itemCount: color_list.length,
              itemBuilder: (context, index) => PostLayout(
                    details: details[index],
                  )),
        ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return postPageUpperPart();
  }
}
