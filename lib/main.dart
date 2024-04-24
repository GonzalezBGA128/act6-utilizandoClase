import 'package:flutter/material.dart';
import 'package:gonzalez0363/pantalla0363.dart/pantalla-registro0363.dart';

void main(List<String> args) {
  runApp(MyApp0363());
}

class MyApp0363 extends StatelessWidget {
  const MyApp0363({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PantallaRegistro(),
    );
  }
}
