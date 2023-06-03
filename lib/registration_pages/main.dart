import 'package:flutter/material.dart';
import 'ui_registratsiya.dart';
void main() {
  runApp(const HomeTask());
}

class HomeTask extends StatelessWidget {
  const HomeTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UiRegistratsiya(),
    );
  }
}
