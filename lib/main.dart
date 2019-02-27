import 'package:flutter/material.dart';
import 'package:fluttery_seekbar/fluttery_seekbar.dart';
import 'dart:math';

void main() => runApp(MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  double _thumbPercent = 0.4;

  Widget _buildRadialSeekBar() {
    return RadialSeekBar(
      trackColor: Colors.red.withOpacity(.5),
      trackWidth: 2.0,
      progressColor: Color(0xFFFE1483),
      progressWidth: 5.0,
      thumbPercent: _thumbPercent,
      thumb: CircleThumb(
        color: Color(0xFFFE1483),
        diameter: 20.0,
      ),
      progress: _thumbPercent,
      onDragUpdate: (double percent) {
        setState(() {
          _thumbPercent = percent;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Color(0xFFFE1483)),
            onPressed: () {},
          ),
          title: Text("Music World",
              style: TextStyle(color: Color(0xFFFE1483), fontFamily: "Nexa")),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.menu, color: Color(0xFFFE1483)),
              onPressed: () {},
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 25.0,
              ),
              Center(
                child: Container(
                  width: 250.0,
                  height: 250.0,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFFE1483).withOpacity(.5),
                            shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: _buildRadialSeekBar(),
                        ),
                      ),
                      Center(
                        child: Container(
                          width: 200.0,
                          height: 200.0,
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: ClipOval(
                              clipper: MClipper(),
                              child: Image.asset(
                                "assets/justine.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Column(
                children: <Widget>[
                  Text(
                    "Justin Bieber fit. Never say",
                    style: TextStyle(
                        color: Color(0xFFFE1483),
                        fontSize: 20.0,
                        fontFamily: "Nexa"),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "The Weeknd",
                    style: TextStyle(
                        color: Color(0xFFFE1483),
                        fontSize: 18.0,
                        fontFamily: "NexaLight"),
                  )
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                width: 350.0,
                height: 150.0,
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Container(
                        height: 65.0,
                        width: 290.0,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xFFFE1483), width: 3.0),
                            borderRadius: BorderRadius.circular(40.0)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.fast_rewind,
                                  size: 55.0, color: Color(0xFFFE1483)),
                              Expanded(
                                child: Container(),
                              ),
                              Icon(Icons.fast_forward,
                                  size: 55.0, color: Color(0xFFFE1483))
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 92.0,
                        height: 92.0,
                        decoration: BoxDecoration(
                            color: Color(0xFFFE1483), shape: BoxShape.circle),
                        child: IconButton(
                          icon: Icon(
                            Icons.play_arrow,
                            size: 45.0,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 190.0,
                width: double.infinity,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: -25,
                      child: Container(
                        width: 50.0,
                        height: 190.0,
                        decoration: BoxDecoration(
                            color: Color(0xFFFE1483),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30.0),
                                bottomRight: Radius.circular(30.0))),
                      ),
                    ),
                    Positioned(
                      right: -25,
                      child: Container(
                        width: 50.0,
                        height: 190.0,
                        decoration: BoxDecoration(
                            color: Color(0xFFFE1483),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                bottomLeft: Radius.circular(30.0))),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          song("assets/cover_01.jpg", "Never say",
                              "Believe 2012"),
                          song("assets/cover_02.jpg", "Beauty...",
                              "Believe 2012"),
                          song("assets/cover_03.png", "Boyfriend",
                              "Believe 2012"),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

Widget song(String image, String title, String subtitle) {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          image,
          width: 40.0,
          height: 40.0,
        ),
        SizedBox(
          width: 8.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title, style: TextStyle(color: Color(0xFFFE1483))),
            Text(subtitle, style: TextStyle(color: Color(0xFFFE1483)))
          ],
        )
      ],
    ),
  );
}

class MClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: min(size.width, size.height) / 2);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
