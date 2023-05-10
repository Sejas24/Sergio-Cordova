import 'package:flutter/material.dart';

class ListaBlindScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(63, 63, 156, 1),
        title: Text('Lista'),
        centerTitle: true,
      ),
      backgroundColor: Colors.green,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
              child: Text(
            "Lista Page",
            style: TextStyle(fontSize: 20),
          ))
        ],
      ),
    );
  }
}
