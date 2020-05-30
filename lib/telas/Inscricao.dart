import 'package:flutter/material.dart';

class Inscrito extends StatefulWidget {
  @override
  _InscritoState createState() => _InscritoState();
}

class _InscritoState extends State<Inscrito> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
          child: Text("Inscricao",
          style: TextStyle(
            fontSize: 25,
          ),
          )
        ),
    );
  }
}