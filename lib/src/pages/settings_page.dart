import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/share_prefs/preferencias_usuario.dart';

import 'package:preferencias_usuario/src/widgets/menu_widget.dart';


class SettingsPage extends StatefulWidget {

  static final String routName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _colorSecundario;
  int _genero;
  String _nombre = 'Anónimo';

  TextEditingController _textController;
  final prefs = new PreferenciasUsuario();

  @override
  void initState() {

    super.initState();
    //cargarPrefs();
    prefs.ultimaPagina = SettingsPage.routName;
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _textController = new TextEditingController(text: prefs.nombreUsuario);

  }

  /*cargarPrefs() async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    _genero = prefs.getInt('genero');
    setState(() {
      
    });
  }*/

  _setSelectedRadio(int valor){

    //SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.setInt('genero', valor);
    prefs.genero = valor;
    _genero = valor;
    setState(() {
      
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Settings', style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold)),
          ),

          Divider(),

          SwitchListTile(
            value: _colorSecundario, 
            title: Text('Color secundario'),
            onChanged: (value){ 
              _colorSecundario = value;
              prefs.colorSecundario = value;
              setState(() {
              });
            },
          ),

          RadioListTile(
            value: 1,
            groupValue: _genero,
            title: Text('Masculino'),
            onChanged:_setSelectedRadio,
          ),

          RadioListTile(
            value: 2,
            groupValue: _genero,
            title: Text('Femenino'),
            onChanged: _setSelectedRadio,
          ),

          Divider(),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona usando el teléfono',

              ),
              onChanged: (value){ 
                prefs.nombreUsuario = value;
              },
            ),
          )
        ]
      )

      
    );
  }
}