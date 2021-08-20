// ignore: unused_import
import 'dart:async';
// ignore: unused_import
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:fluttercrypto/dependency_injection.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttercrypto/home_page.dart';

void main() {
  Injector.configure(Flavor.PROD);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
          primarySwatch: Colors.pink,
          primaryColor: defaultTargetPlatform == TargetPlatform.iOS
              ? Colors.grey[100]
              : null),
      home: new HomePage(),
    );
  }
}

