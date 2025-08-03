import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:globalchat/screens/splash_screen.dart';

class LoginController {
  
  static Future<void> login ({required BuildContext context,required String email,
  required String Password}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: Password);
      
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) {
            return SplashScreen();
          },
        ),(route)
        {
         return false;
        }
      );
      print("Account create successfully");
    } catch (e) {
      SnackBar massageSnackBar = SnackBar(
        backgroundColor: Colors.red,
        content: Text(e.toString()),
      );

      ScaffoldMessenger.of(context).showSnackBar(massageSnackBar);
      print(e);
    }
  }
}