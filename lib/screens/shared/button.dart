import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(top: 30),
      child: Material(
        elevation: 0,
        color: Colors.deepPurple,
        child: MaterialButton(
          minWidth: 250,
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 4),
          onPressed: () {},
          child: const Text(
            'Volver',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white12),
          ),
        ),
      ),
    );
  }
}
