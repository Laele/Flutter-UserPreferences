import 'package:flutter/material.dart';

import 'package:preferencias_usuario/src/pages/home_page.dart';
import 'package:preferencias_usuario/src/pages/settings_page.dart';
import 'package:preferencias_usuario/src/share_prefs/preferencias_usuario.dart';
 
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {

  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preferencias de Usuario',
      initialRoute: prefs.ultimaPagina,
      routes:{
        HomePage.routName : (BuildContext context) => HomePage(),
        SettingsPage.routName : (BuildContext context) => SettingsPage(),

      },
    );
  }
}