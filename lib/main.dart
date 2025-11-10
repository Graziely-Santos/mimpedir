import 'package:flutter/material.dart';
import 'package:mimpedir/tela_login.dart';
import 'usuario.dart';
import 'package:mimpedir/tipo.dart';
import 'package:mimpedir/restaurante.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaLogin(),
    );
  }
}
