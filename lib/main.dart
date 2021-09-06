import 'package:flutter/material.dart';
import 'package:se7a_7alalk/modules/authintication/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: (context, child) {
        return SafeArea(
          child: Directionality(
              textDirection: TextDirection.rtl, child: LoginScreen()),
        );
      },
    );
  }
}
