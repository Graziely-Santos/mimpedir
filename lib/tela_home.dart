import 'package:flutter/material.dart';
import 'package:mimpedir/banco/restaurante_DAO.dart';
import 'package:mimpedir/tela_cad_restaurante.dart';
import '../restaurante.dart';

class TelaHome extends StatefulWidget {
  TelaHome({super.key});

@override
  State<TelaHome> createState() => TelaHomeState();
}

class TelaHomeState extends State<TelaHome>{


  @override
  void initState(){
    super.initState();
        carregarRestaurantes();
  }

  Future<void> carregarRestaurantes() async{
    final lista = await RestauranteDAO.listarTodos();
    setState(() {
    });
  }

 @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
           title: const Text("Lista de Restaurantes "),
           actions: [
             TextButton(onPressed: () async{
                   final t = await Navigator.push(context,
                       MaterialPageRoute(builder: (context) => TelaCadRestaurante())
                   );

                   if(t == false || t == null){

                     setState(() {
                       carregarRestaurantes();
                     });
                   }

                 },
                 child: Icon(Icons.add)
             )
           ],
       ),
       body: Padding(padding: const EdgeInsets.all(10),
         child: ListView.builder(
           itemCount: 20,
           itemBuilder: (context, index){
             return Card(
               margin: EdgeInsets.symmetric(vertical: 8),
               child: ListTile(
                 title: Text("Restaurante"),
                 subtitle: Text("Mexicano"),
                 trailing: Row(
                   mainAxisSize: MainAxisSize.min,
                   children: [
                     IconButton(onPressed: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => TelaCadRestaurante()));
                     }, icon: Icon(Icons.edit, color: Colors.blue,)),
                     IconButton(onPressed: (){}, icon: Icon(Icons.delete, color: Colors.red)),
                  ],
                ),
              ),
            );
          }
         ),
       ),
       floatingActionButton: FloatingActionButton(
         onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context) => TelaCadRestaurante()));
         },
         child: Icon(Icons.add),
       ),
       bottomNavigationBar: BottomNavigationBar(
           items: const<BottomNavigationBarItem>[
             BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Adicionar'),
             BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Adicionar'),
           ],
       ),

     );
  }
}