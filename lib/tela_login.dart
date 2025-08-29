import 'package:flutter/material.dart';
import 'package:mimpedir/tela_home.dart';
import 'package:mimpedir/usuario.dart';
import 'banco/usuario_dao.dart';

class TelaLogin extends StatelessWidget{
  TelaLogin({super.key});

 /* Usuario u = Usuario(
    nome:'admin',
    login: 'admin',
    senha: '1234'
  );*/

  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tela de login: ')),
      body: Padding(padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'usuario'),
              controller: usuarioController,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(labelText: 'Senha'),
              controller: senhaController,
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () async {

          /*if(u.login == usuarioController.text && u.senha == senhaController.text){
            //print('deu certo vai abrir outra pagina');
            Navigator.push(context,
                 MaterialPageRoute(builder: (context) => TelaHome())
            );
          {else{
             print('deu errado nao vai abrir outra pagina');
          }*/

          final  sucesso = await UsuarioDAO.autenticar(usuarioController.text, senhaController.text);

          if(sucesso) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>  TelaHome())
            );
          }else{
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Login invalido!'))
            );
          }

            }, child: const Text('Entrar')),


          ],
        )
      ),
    );
  }
}