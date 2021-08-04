import 'package:flutter/material.dart';
import 'package:login/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login/services/auth.dart';
import 'package:provider/provider.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green

        ),
        home:Wrapper(),

      ),
    );
  }
}

