import 'package:baston_inteligente/provider/blind_provider.dart';
import 'package:baston_inteligente/screens/code_user_baston.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:provider/provider.dart';

import 'package:baston_inteligente/ui/input_decorations.dart';
import 'package:baston_inteligente/widget/widgets.dart';

import '../models/blind_models.dart';
import '../provider/providers.dart';

class RegisterBlindScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RegisterBackground(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 250),
            CardContainer(
                child: Column(
              children: [
                SizedBox(height: 10),
                Text('Nueva Cuenta No Vidente',
                    style: Theme.of(context).textTheme.headline4),
                SizedBox(height: 30),
                ChangeNotifierProvider(
                    create: (_) => BlindProvider(), child: _BlindRegisterForm())
              ],
            )),
            SizedBox(height: 50),
            TextButton(
              onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
              style: ButtonStyle(
                overlayColor:
                    MaterialStateProperty.all(Colors.indigo.withOpacity(0.6)),
                shape: MaterialStateProperty.all(StadiumBorder()),
              ),
              child: Text('¿Ya tienes una cuenta?',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87)),
            ),
          ],
        ),
      ),
    ));
  }
}

class _BlindRegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<BlindProvider>(context);
    var confirmePass = "";
    return Container(
      child: Form(
        key: registerProvider.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'Pedro Rodriguez',
                  labelText: 'Nombre Completo',
                  prefixIcon: Icons.person),
              onChanged: (value) => registerProvider.currentBlind.name = value,
            ),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'pepito@host.com',
                labelText: 'Correo  Electrónico',
                prefixIcon: Icons.email,
              ),
              onChanged: (value) => registerProvider.email = value,
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = new RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'El correo electrónico no es válido';
              },
            ),
            SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: '********',
                labelText: 'Contraseña',
                prefixIcon: Icons.lock,
              ),
              onChanged: (value) => registerProvider.password = value,
              validator: (value) {
                return (value != null && value.length >= 6)
                    ? null
                    : 'La contraseña debe tener al menos 6 caracteres';
              },
            ),
            SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: '********',
                labelText: 'Confirmar Contraseña',
                prefixIcon: Icons.lock,
              ),
              validator: (value) {
                return (value == null || value.length < 6)
                    ? 'La contraseña debe tener al menos 6 caracteres'
                    : value != registerProvider.password
                        ? 'Las contraseñas no coinciden'
                        : null;
              },
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  disabledColor: Colors.grey,
                  elevation: 0,
                  color: Colors.deepPurple,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 60),
                    child: const Text(
                      'Volver',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'login');
                  },
                ),
                const SizedBox(width: 20),
                _IngresarButton(registerProvider: registerProvider),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _IngresarButton extends StatelessWidget {
  _IngresarButton({
    Key? key,
    required this.registerProvider,
  }) : super(key: key);

  final BlindProvider registerProvider;
  final BlindProvider blindProvider = BlindProvider();

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      disabledColor: Colors.grey,
      elevation: 0,
      color: Colors.deepPurple,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 60),
        child: Text(
          registerProvider.isLoading ? 'Espere' : 'Ingresar',
          style: TextStyle(color: Colors.white),
        ),
      ),
      onPressed: () async {
        print(registerProvider.isValidForm());
        FocusScope.of(context).unfocus();
        if (!registerProvider.isValidForm()) return;

        registerProvider.isLoading = true;

        Future.delayed(Duration(seconds: 2));

        registerProvider.isLoading = false;

        try {
          final credential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: registerProvider.email,
                  password: registerProvider.password);

          if (credential.user != null) {
            Blind blind = Blind(
                name: registerProvider.currentBlind.name,
                codeBlind: registerProvider
                    .currentBlind.codeBlind, //TODO: MODIFICAR LUEGO
                altitud: registerProvider.currentBlind.altitud,
                latitud: registerProvider.currentBlind.latitud,
                parentListAcepted: [],
                parentListRequested: []);

            print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
            print(registerProvider.currentBlind.name);

            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CodeBlindScreen(
                      code: credential.user?.uid, blindProvider: blindProvider),
                ));
            blindProvider.postNewBlindUser(blind);
          }
        } on FirebaseAuthException catch (e) {
          print("entra1");

          if (e.code == 'weak-password') {
            print('The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
            print('The account already exists for that email.');
          }
        } catch (e) {
          print("entra2");
          print(e);
        }
      },
    );
  }
}
