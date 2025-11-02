import 'package:flutter/material.dart';
import 'package:per3/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // menghilangkan banner "debug"
      home: LoginPage(), // memanggil halaman login dari login.dart
    );
  }
}
