import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_config_plus/flutter_config_plus.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfigPlus.loadEnvVariables();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var allValues = <Widget>[];

    FlutterConfigPlus.variables.forEach((k, v) {
      allValues.add(Text('$k: $v'));
    });

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
            child: Column(children: [
              ...allValues,
              const SizedBox(
                height: 20,
              ),
              Text('Values of fabric Id: ${FlutterConfigPlus.get('FABRIC_ID')}')
            ])),
      ),
    );
  }
}
