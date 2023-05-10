import 'package:baston_inteligente/provider/blind_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:baston_inteligente/ui/input_decorations.dart';
import 'package:baston_inteligente/widget/widgets.dart';

import '../provider/providers.dart';

class CodeBlindScreen extends StatelessWidget {
  final String? code;
  final BlindProvider blindProvider;

  CodeBlindScreen({required this.code, required this.blindProvider});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TypeRegisterBackground(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 250),
            CardContainer(
                child: Column(
              children: [
                SizedBox(height: 10),
                Text('Codigo Usuario del Baston: ',
                    style: Theme.of(context).textTheme.headline5),
                SizedBox(height: 30),
                Text(code.toString().substring(0, 7),
                    style: Theme.of(context).textTheme.headlineLarge),
                SizedBox(height: 30),
                _IngresarButton(),
              ],
            )),
            SizedBox(height: 50),
          ],
        ),
      ),
    ));
  }
}

class _IngresarButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      disabledColor: Colors.grey,
      elevation: 0,
      color: Colors.deepPurple,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
        child: Text(
          'Ingresar',
          style: TextStyle(color: Colors.white),
        ),
      ),
      onPressed: () {
        Navigator.pushReplacementNamed(context, 'homeblind');
      },
    );
  }
}
