import 'package:flutter/material.dart';
import 'package:youtube/CustomSearchDelegate.dart';
import 'package:youtube/telas/Biblioteca.dart';
import 'package:youtube/telas/EmAlta.dart';
import 'package:youtube/telas/Inicio.dart';
import 'package:youtube/telas/Inscricao.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // atributos
  var logo = AssetImage("image/youtube.png");
  int _indice = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(_resultado),
      EmAlta(),
      Inscrito(),
      Biblioteca()
    ];

    return Scaffold(
      appBar: AppBar(
        title: Image(
          image: logo,
          width: 98,
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
              color: Colors.grey,
              icon: Icon(Icons.search),
              onPressed: () async {
                String res = await showSearch(
                    context: context, delegate: CustomSearchDelegate());
                setState(() {
                  _resultado = res;
                });
              }),

          /*
               IconButton(
                 icon: Icon(Icons.videocam),
                onPressed: null
                ),
                IconButton(
                  icon: Icon(Icons.search),
                 onPressed: null
                 ),
                 IconButton(
                   icon: Icon(Icons.account_circle),
                  onPressed: null
                  )
*/
        ],
      ),
      body: Container(padding: EdgeInsets.all(16), child: telas[_indice]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // or BottomNavigatonBarType.shifting faz animações na navigações do menu de baixo.
        currentIndex: _indice,
        onTap: (indice) {
          setState(() {
            _indice = indice;
          });
        },
        fixedColor: Colors.red,

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Início"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.whatshot),
            title: Text("Em alta"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            title: Text("Inscrições"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            title: Text("Biblioteca"),
          ),
        ],
      ),
    );
  }
}
