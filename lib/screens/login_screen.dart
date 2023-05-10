import 'package:flutter/material.dart';
import 'package:resize/resize.dart';
import 'package:provider/provider.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:baston_inteligente/service/services.dart';
import 'package:baston_inteligente/ui/input_decorations.dart';
import 'package:baston_inteligente/widget/widgets.dart';
import '../provider/providers.dart';

class LoginScreen extends StatelessWidget {
  final SharedProvider sharedProvider;
  LoginScreen({required this.sharedProvider});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackground(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 250),
            CardContainer(
                child: Column(
              children: [
                SizedBox(height: 10),
                Text('Login', style: Theme.of(context).textTheme.headline4),
                SizedBox(height: 30),
                ChangeNotifierProvider(
                    create: (_) => LoginFormProvider(),
                    child: _LoginForm(sharedProvider: this.sharedProvider)),
              ],
            )),
            SizedBox(height: 50),
            TextButton(
              onPressed: () => {
                if (this.sharedProvider.isBlind)
                  {Navigator.pushReplacementNamed(context, 'register_blind')}
                else
                  {Navigator.pushReplacementNamed(context, 'register_parent')}
              },
              style: ButtonStyle(
                overlayColor:
                    MaterialStateProperty.all(Colors.indigo.withOpacity(0.6)),
                shape: MaterialStateProperty.all(StadiumBorder()),
              ),
              child: Text('Crear una nueva Cuenta',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87)),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    ));
  }
}

class _LoginForm extends StatelessWidget {
  final SharedProvider sharedProvider;
  _LoginForm({required this.sharedProvider});
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'sergiocordova@gmail.com',
                labelText: 'Correo  Electrónico',
                prefixIcon: Icons.email,
              ),
              onChanged: (value) => loginForm.email = value,
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
              onChanged: (value) => loginForm.password = value,
              validator: (value) {
                return (value != null && value.length >= 6)
                    ? null
                    : 'La contraseña debe tener al menos 6 caracteres';
              },
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Resize(
                  builder: () {
                    return MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      disabledColor: Colors.grey,
                      elevation: 0,
                      color: Colors.deepPurple,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 15, horizontal: 4.rem),
                        child: const Text(
                          'Volver',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, 'tiperegister');
                      },
                    );
                  },
                ),
                const SizedBox(width: 20),
                _IngresarButton(
                  loginForm: loginForm,
                  sharedProvider: sharedProvider,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _IngresarButton extends StatelessWidget {
  const _IngresarButton({
    Key? key,
    required this.loginForm,
    required this.sharedProvider,
  }) : super(key: key);

  final LoginFormProvider loginForm;
  final SharedProvider sharedProvider;

  @override
  Widget build(BuildContext context) {
    return Resize(
      builder: () {
        return MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          disabledColor: Colors.grey,
          elevation: 0,
          color: Colors.deepPurple,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 4.rem),
            child: Text(
              loginForm.isLoading ? 'Espere' : 'Ingresar',
              style: TextStyle(color: Colors.white),
            ),
          ),
          onPressed: loginForm.isLoading
              ? null
              : () async {
                  FocusScope.of(context).unfocus();
                  if (!loginForm.isValidForm()) return;

                  loginForm.isLoading = true;

                  Future.delayed(Duration(seconds: 2));

                  //TODO: validar el login con backend
                  print(this.sharedProvider.isBlind);
                  print(sharedProvider.isParent);

                  loginForm.isLoading = false;
                  try {
                    final credential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: loginForm.email,
                            password: loginForm.password);
                    if (this.sharedProvider.isBlind) {
                      Navigator.pushReplacementNamed(context, 'homeblind');
                    } else {
                      Navigator.pushReplacementNamed(context, 'homeparent');
                    }
                  } catch (e) {
                    //mostar error al usuario de contraseña o correo invalido
                    print(e);
                    NotificationService.showSnackbar(e.toString());
                  }
                },
        );
      },
    );
  }
}
