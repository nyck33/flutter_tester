///https://stackoverflow.com/a/63433211/9481613
///@PareshMangukiya from StackOverflow above link

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class PosticnedStack extends StatefulWidget {
  const PosticnedStack({Key? key}) : super(key: key);

  @override
  _PosticnedStackState createState() => _PosticnedStackState();
}

class _PosticnedStackState extends State<PosticnedStack> {
  double _width = 0.0;
  double _height = 0.0;
  final double circleRadius = 100.0;
  final double circleBorderWidth = 0.0; //puts red outline on circle edge

  @override //everything on white background
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    final TextStyle style = TextStyle(color: Colors.black);
    return Container(
      width: _width,
      height: _height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            //position the top purple container
            top: 0,
            child: Container(
              color: Colors.purple,
              width: _width,
              height: _height * .20, //goes down 40%, 35 better with appbar?
              child: SizedBox(
                height: 100.0,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: <Widget>[
                        Spacer(),
                      ],
                    ),
                    Spacer(flex: 2),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Foo",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text("bar"),
                      ],
                    ),
                    Spacer(flex: 2),
                    Column(
                      //mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            onPrimary: Colors.white,
                            shadowColor: Colors.greenAccent,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                            maximumSize: Size(50, 30),
                            minimumSize: Size(10, 10),
                          ),
                          onPressed: () {},
                          child: Text('Change Rooms'),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            //position the card
            top: _height * .10, //start at 25
            left: 5, //Card inherits this "padding"
            right: 5,
            child: Stack(
              children: <Widget>[
                Card(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: SizedBox(
                    height: 100.0,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 45.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 50.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Foo",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Text("bar")
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 1.0, right: 1.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Foo",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Text("bar")
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 50.0, right: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Foo",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Text("bar")
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: .0,
                  left: .0,
                  right: .0,
                  child: Center(
                    child: CircleAvatar(
                      radius: 30.0,
                      child: Text("Room\n 33"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
