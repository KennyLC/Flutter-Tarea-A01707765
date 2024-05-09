import 'package:flutter/material.dart';
import 'package:custom_app_test/gradient_container.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Tragamonedas'),
      ),
      body: GradientContainer(
          [Color.fromARGB(255, 1, 57, 102), Color.fromARGB(255, 1, 114, 206)]),
    ),
  ));
}
