import 'package:flutter/material.dart';

class TelaHome extends StatelessWidget{
  TelaHome({super.key});

 @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(title: const Text('Tela de Home')),
       body: const Center(
         child: Text("OIII Seja bem vindo!"),
       ),
     );

  }
}