import 'package:flutter/material.dart';

class MapaBlindScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(63, 63, 156, 1),
        title: Text('Mapa'),
        centerTitle: true,
      ),
      backgroundColor: Colors.red,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
              child: Text(
            "Mapa Page",
            style: TextStyle(
              fontSize: 20,
            ),
          ))
        ],
      ),
    );
  }
}
