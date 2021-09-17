import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './position_stack.dart';
import './other_screen.dart';
import './responsive_stack.dart';
import 'dart:developer';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowMaterialGrid: true,
      home: Scaffold(
        appBar: AppBar(),
        body: ResponsiveStack(),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(icon: Icon(Icons.email), label: 'email'),
          ],
        ),
      ),
    );
  }
}

class ContainerWithCircle extends StatelessWidget {
  final double circleRadius = 100.0;
  final double circleBorderWidth = 0.0; //puts red outline on circle edge
  double _width = 0.0;
  double _height = 0.0;
  @override
  Widget build(BuildContext context) {
    //debugPaintSizeEnabled = true;

    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    final TextStyle style = TextStyle(color: Colors.black);
    return Stack(
      //alignment: Alignment.topCenter,
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          top: MediaQuery.of(context).size.height * .25, //start at .25
          left: 15,
          right: 15,
          child: Padding(
            //red container
            //make half circle stick out top of white container
            padding: EdgeInsets.only(top: circleRadius / 2.0),
            //padding: const EdgeInsets.all(5.0),

            child: Container(
              //replace this Container with your Card
              color: Colors.red,
              height: 100.0,
            ),
          ),
        ),
        Container(
          width: circleRadius,
          height: circleRadius,
          decoration:
              ShapeDecoration(shape: CircleBorder(), color: Colors.green),
          child: Padding(
            padding: EdgeInsets.all(circleBorderWidth),
            child: DecoratedBox(
              decoration: ShapeDecoration(
                shape: CircleBorder(
                  side: BorderSide(
                    width: 5,
                    color: Colors.red,
                    //style: BorderStyle.none,
                  ),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text('Room 333'),
                ],
              ),
            ),
          ),
        ),
        const Positioned(
          top: 200,
          child: Text(
            'Billy',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
