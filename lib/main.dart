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

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(ProviderScope(child: MyApp()));
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
    final response = ref.watch(dioTester.cProvider); //as Map<String, dynamic>;
    print('response: $response');
    final couponMap = response.data?.value;
    final couponsList = couponMap?['coupons'];
    print('coupons: $couponsList');

    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            /*
            Container(
              child: ListView.builder(
                itemCount: couponsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 150,
                    child: Card(
                      elevation: 10,
                      child: Text(couponsList[index].toString()),
                    ),
                  );
                },
              ),
            ),*/
            AWidget(
              key: Key('theKey'),
            ),
          ],
        ),
      ),
    );
  }
}

class AWidget extends ConsumerStatefulWidget {
  const AWidget({Key? key}) : super(key: key);

  @override
  _AWidgetState createState() => _AWidgetState();
}

class _AWidgetState extends ConsumerState<AWidget> {
  Key? get myKey => widget.key;

  @override
  Widget build(BuildContext context) {
    Key? theKey = myKey;
    return Container(
      key: theKey,
      child: Text('the Key! ${theKey.toString()}'),
    );
  }
}
