
import 'package:firebase_core/firebase_core.dart';
import 'package:firebasexchatapp/services/auth/auth_gate.dart';

import 'package:firebasexchatapp/firebase_options.dart';

import 'package:firebasexchatapp/theme/ligth_mode.dart';
import 'package:firebasexchatapp/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChangeNotifierProvider(create: (context)=>ThemeProvider(),
  child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slim Shady',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home:AuthGate(),
    );
  }
}
