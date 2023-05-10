import 'package:flutter/material.dart';
import 'firebase_options.dart';

import 'package:baston_inteligente/provider/providers.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screens/screens.dart';
import 'package:provider/provider.dart';
import 'package:baston_inteligente/service/services.dart';

// Future<void> main() async {
//
//   runApp(MyApp());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => LoginFormProvider()),
      ChangeNotifierProvider(create: (_) => SharedProvider()),
    ], child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  SharedProvider sharedProvider = SharedProvider();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'tiperegister',
      routes: {
        'tiperegister': (context) => TipoRegistroScreen(
              sharedProvider: sharedProvider,
            ),
        'login': (context) => LoginScreen(sharedProvider: sharedProvider),
        'register_blind': (context) => RegisterBlindScreen(),
        'register_parent': (context) => RegisterParentScreen(),
        'code_register_parent': (context) => CodeRegisterParentScreen(),
        'homeblind': (context) => HomeBlindScreen(),
        'homeparent': (context) => HomeParentScreen(),
      },
      scaffoldMessengerKey: NotificationService.messengerkey,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[350],
      ),
    );
  }
}
