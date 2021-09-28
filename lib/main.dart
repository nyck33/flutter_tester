import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tester/dio_test.dart';
import 'dart:developer';
import 'package:dio/dio.dart';

import './position_stack.dart';
import './other_screen.dart';
import './responsive_stack.dart';

import 'dart:developer';
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(VeryTopApp());
}

class VeryTopApp extends StatelessWidget {
  const VeryTopApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TopApp(),
    );
  }
}

class TopApp extends StatelessWidget {
  const TopApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                child: ElevatedButton(
              key: const Key('firstButton'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              },
              child: Text(
                'push me for second page',
              ),
            )),
          ],
        ),
      ),
    );
  }
}

class MyApp extends ConsumerStatefulWidget {
  DioTester _dioTester = DioTester();
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  DioTester get dioTester => widget._dioTester;
  @override
  Widget build(BuildContext context) {
    //debugPaintSizeEnabled = true;
    //list of maps
    //final response = ref.watch(dioTester.cProvider); //as Map<String, dynamic>;
    //print('response: $response');
    //final couponMap = response.data?.value;
    //final couponsList = couponMap?['coupons'];
    // print('coupons: $couponsList');

    return Container(
      child: Column(children: <Widget>[
        SizedBox(height: 50),
        Container(
          child: ElevatedButton(
            key: const Key('secondButton'),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'go back',
            ),
          ),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 4,
            children: List.generate(9, (index) {
              //for k,v in imageUrl, caption Map:
              if (index < 8) {
                print('0-7 index: $index');
                return Center(
                  child: CardWidget(
                    key: Key('$index-cardWidget'),
                    testKey: Key(
                      index.toString(),
                    ),
                    imageUrl: 'assets/images/starwars/stormtrooper_icon.png',
                  ),
                );
              } else {
                print('8 index: $index');
                return Center(
                  child: CardWidget(
                      key: Key('couponCard'),
                      testKey: Key(
                        'theOne',
                      ),
                      routePath: '/coupons'),
                );
              }
            }),
          ),
        ),
      ]),
    );
  }
}

class CardWidget extends ConsumerStatefulWidget {
  final String? imageUrl;
  final String? imageCaption;
  final String? routePath;
  final Key? testKey;

  const CardWidget(
      {Key? key,
      //this.testKey,
      this.imageUrl,
      this.imageCaption,
      this.routePath,
      this.testKey})
      : super(key: key);

  @override
  _CardWidgetState createState() {
    print('CardWidget key: $key');
    return _CardWidgetState();
  }
}

class _CardWidgetState extends ConsumerState<CardWidget> {
  /*final String? imageUrl;
  final String? imageCaption;
  final String? routePath;
  final String? testKey;
  */
  final String dummyUrl = 'assets/images/no-img.png';
  final dummyCaption = 'not ready';
  String? get imageUrl => widget.imageUrl;
  String? get imageCaption => widget.imageCaption;
  String? get routePath => widget.routePath;
  Key? get couponKey => widget.testKey;

  //_CardWidgetState(
  //  {this.imageUrl, this.imageCaption, this.routePath, this.testKey});

  @override
  Widget build(BuildContext context) {
    Key? theKey = couponKey;
    print('theKey: ${theKey.toString()}');
    return Card(
      //key: routePath != null ? Key('couponKey') : null,
      //key: theKey,
      elevation: 20,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
          side: BorderSide(color: Colors.grey)),
      child: InkWell(
        key: theKey,
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          print('tapped thisKey: ${this.couponKey}, theKey: $theKey');
          //need to update coupons and User with fastapi
        }, //go to repo to refresh coupons and go to couponscreen
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              //key: testKey != null ? Key(testKey!) : null,
              //title: Image(image: AssetImage(imageUrl ?? dummyUrl)),
              subtitle: Text(
                imageCaption ?? dummyCaption,
                //key: testKey != null ? Key(testKey!) : null,
                style: const TextStyle(fontSize: 6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
