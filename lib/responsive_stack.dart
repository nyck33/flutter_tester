///https://stackoverflow.com/a/68365087/9481613
///
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ResponsiveStack extends StatefulWidget {
  const ResponsiveStack({Key? key}) : super(key: key);

  @override
  _ResponsiveStackState createState() => _ResponsiveStackState();
}

class _ResponsiveStackState extends State<ResponsiveStack> {
  final double circleRadius = 100.0;
  final double circleBorderWidth = 0.0; //puts red outline on circle edge
  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = true;

    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(color: Colors.indigo),
            ),
            Expanded(
              ///put grid in here
              flex: 3,
              child: Container(
                color: Colors.white,
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment(0, -0.95),
          child: Text(
            'Room Concierge',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        Align(
            alignment: Alignment(0.95, -0.85),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
                shadowColor: Colors.greenAccent,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                //maximumSize: Size(30.0, 15.0),
                //minimumSize: Size(50.0, 10.0),
              ),
              onPressed: () {},
              child: Text('Change Rooms'),
            )),
        Align(
          alignment: Alignment(0, -0.65), //-1 to 1
          child: Container(
            width: size.width * 0.9,
            height: size.height * 0.2,
            child: Stack(
              children: <Widget>[
                Card(
                  margin: EdgeInsets.only(top: 20.0),
                  elevation: 12,
                  child: SizedBox(
                    height: 100.0,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 45),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("Nobu Kim",
                              style: Theme.of(context).textTheme.headline5),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, -2.75),
                  child: Container(
                    width: circleRadius,
                    height: circleRadius,
                    decoration: ShapeDecoration(
                      shape: CircleBorder(),
                      color: Colors.green,
                    ),
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
                ),
                /*Align(
                  alignment: Alignment(0, -1.2),
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        'Room, 33',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                /*Align(
                  alignment: Alignment(0, -1.2),
                  child: CircleAvatar(
                    radius: 30.0,*/
                    child: Center(
                      //alignment: Alignment(0, 0),
                      child: Text("Room 33"),
                    ),
                  ),
                ),*/
                /*Positioned(
                  top: .0,
                  left: .0,
                  right: .0,
                  child: Center(
                    child: CircleAvatar(
                      radius: 30.0,
                      child: Align(
                        alignment: Alignment(0, 0),
                        child: Text("Room 33"),
                      ),
                    ),
                  ),
                ),*/
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment(0, 0.8),
          child: Text(
            'Grid view',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
