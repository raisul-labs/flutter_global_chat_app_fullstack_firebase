import 'package:flutter/material.dart';
import 'package:globalchat/providers/userProvider.dart';
import 'package:globalchat/screens/deshboard_screen.dart';
import 'package:globalchat/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    //check for user login statas

    Future.delayed(Duration(seconds: 2), () {
      if (user == null) {
        openLogin();
      } else {
        openDashborad();
      }
    });

    super.initState();
  }

  void openDashborad() {
    Provider.of<Userprovider>(context,listen: false).getUserDetails();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return DeshboardScreen();
        },
      ),
    );
  }

  void openLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LoginScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 100,
          width: 100,
          child: Image.asset("assets/images/logo.png"),
        ),
      ),
    );
  }
}
