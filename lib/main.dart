import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:heartcom/services/auth/auth_gate.dart';
// import 'package:heartcom/auth/login_or_register.dart';
import 'package:heartcom/firebase_options.dart';

import 'package:heartcom/themes/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HeartCom',
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      theme: lightmode,
    );
  }
}
