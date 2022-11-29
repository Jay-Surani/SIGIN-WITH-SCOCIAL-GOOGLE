import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:singinmethods/singin%20page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(home: singin()));
}
