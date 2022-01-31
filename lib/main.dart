import 'package:final_flutter_project/pages/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:final_flutter_project/pages/android/comment_list_android.dart';
import 'package:flutter/material.dart';

import 'pages/homepage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spoteezer',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const LoginScreen(),
    );
  }
}
