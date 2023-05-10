import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:baston_inteligente/ui/input_decorations.dart';
import 'package:baston_inteligente/widget/widgets.dart';

import '../provider/providers.dart';

class CodeRegisterParentScreen extends StatelessWidget {
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
                Text('Codigo del familiar No Vidente',
                    style: Theme.of(context).textTheme.headline4),
                SizedBox(height: 30),
                ChangeNotifierProvider(
                    create: (_) => LoginFormProvider(), child: _LoginForm())
              ],
            )),
            SizedBox(height: 50),
          ],
        ),
      ),
    ));
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'ASG350',
                labelText: 'Codigo No Vidente',
                prefixIcon: Icons.lock,
              ),
              onChanged: (value) => loginForm.password = value,
              validator: (value) {
                return (value != null && value.length >= 6)
                    ? null
                    : 'El codigo debe tener 6 caracteres';
              },
            ),
            SizedBox(height: 30),
            Row(
              children: [
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  disabledColor: Colors.grey,
                  elevation: 0,
                  color: Colors.deepPurple,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                    child: Text(
                      'Volver',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'register_parent');
                  },
                ),
                SizedBox(width: 20),
                _IngresarButton(loginForm: loginForm),
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
  }) : super(key: key);

  final LoginFormProvider loginForm;

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
      onPressed: loginForm.isLoading
          ? null
          : () async {
              FocusScope.of(context).unfocus();
              if (!loginForm.isValidForm()) return;

              loginForm.isLoading = true;

              Future.delayed(Duration(seconds: 2));

              //TODO: validar el login con backend
              loginForm.isLoading = false;

              Navigator.pushReplacementNamed(context, 'homeparent');
            },
    );
  }
}
