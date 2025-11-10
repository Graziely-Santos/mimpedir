import 'package:mimpedir/usuario.dart';
import 'package:mimpedir/tipo.dart';

class Restaurante{
int? _codigo;
String? _nomeRestaurante;
String? _latitude;
String? _longitude;
Usuario?  _proprietario;
Tipo? _tipoCulinaria;

Restaurante({String? nomeRestaurante, int? codigo, String? latitude, String? longitude, Usuario? proprietario, Tipo? tipoCulinaria}){
  _codigo = codigo;
  _nomeRestaurante = nomeRestaurante;
   _latitude = latitude;
  _longitude = longitude;
  _proprietario = proprietario;
  _tipoCulinaria = tipoCulinaria;
}

String? get nomeRestaurante => _nomeRestaurante;
int? get codigo => _codigo;
String? get latitude => _latitude;
String? get longitude => _longitude;
String? get proprietario => _proprietario;
String? get tipoCulinaria => _tipoCulinaria;

set nomeRestaurante (String? nomeRestaurante)=> _nomeRestaurante;
set codigo (int? codigo)=> _codigo;
set latitude(String? latitude)=> _latitude;
set longitude (String? longitude)=> _longitude;
set proprietario (String? proprietario)=> _proprietario;
set tipoCulina (String? nomeRestaurante)=> _tipoCulinaria;




}
