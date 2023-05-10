import 'package:baston_inteligente/provider/providers.dart';
import 'package:baston_inteligente/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:baston_inteligente/widget/widgets.dart';

class TipoRegistroScreen extends StatelessWidget {
  final SharedProvider sharedProvider;
  TipoRegistroScreen({required this.sharedProvider}) : super();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: TypeRegisterBackground(
          child: Padding(
              padding: const EdgeInsets.all(120.0),
              child: Align(
                child: Flex(
                    direction: Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonRegisterBlind(sharedProvider: this.sharedProvider),
                      ButtonRegisterParent(sharedProvider: this.sharedProvider)
                    ]),
              )),
        ),
      ),
    );
  }
}

class ButtonRegisterBlind extends StatelessWidget {
  final SharedProvider sharedProvider;
  ButtonRegisterBlind({required this.sharedProvider});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromRGBO(63, 63, 156, 1),
      elevation: 15,
      borderRadius: BorderRadius.circular(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        LoginScreen(sharedProvider: sharedProvider),
                  ));
              sharedProvider.isBlind = true;
              sharedProvider.isParent = false;
            },
            child: Image.asset(
              'assets/Persona_novidente.png',
              height: 250,
              width: 250,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          const Text(
            'Usuario del Baston',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ],
      ),
    );
  }
}

class ButtonRegisterParent extends StatelessWidget {
  final SharedProvider sharedProvider;
  ButtonRegisterParent({required this.sharedProvider});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromRGBO(63, 63, 156, 1),
      elevation: 15,
      borderRadius: BorderRadius.circular(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        LoginScreen(sharedProvider: sharedProvider),
                  ));
              sharedProvider.isParent = true;
              sharedProvider.isBlind = false;
            },
            child: Image.asset(
              'assets/Persona_novidente_familiar.png',
              height: 250,
              width: 250,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          const Text(
            'Familiar No Vidente',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ],
      ),
    );
  }
}
