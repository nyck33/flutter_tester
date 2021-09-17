///https://stackoverflow.com/a/68365087/9481613
///
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class ResponsiveStack extends StatefulWidget {
  const ResponsiveStack({Key? key}) : super(key: key);

  @override
  _ResponsiveStackState createState() => _ResponsiveStackState();
}

class _ResponsiveStackState extends State<ResponsiveStack> {
  @override
  Widget build(BuildContext context) {
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
          alignment: Alignment(0, -0.65), //-1 to 1
          child: Container(
            width: size.width * 0.9,
            height: size.height * 0.2,
            child: Card(
              elevation: 12,
              child: Center(
                child:
                    Text('card', style: Theme.of(context).textTheme.headline2),
              ),
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
