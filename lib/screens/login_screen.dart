import 'package:flutter/material.dart';
import 'package:globalchat/controllers/login_controller%20copy.dart';
import 'package:globalchat/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<LoginScreen> {
  var userFrom = GlobalKey<FormState>();
  bool isLoding = false;

  TextEditingController email = TextEditingController();
  TextEditingController Password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: userFrom,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Image.asset("assets/images/logo.png")),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: email,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email is required";
                  }
                  return null;
                },
                decoration: InputDecoration(label: Text("Email")),
              ),
              SizedBox(height: 23),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: Password,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  }
                  return null;
                },
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(label: Text("Paassword")),
              ),
              SizedBox(height: 23),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style:ElevatedButton.styleFrom(
                        minimumSize: Size(0, 50),
                        foregroundColor: Colors.white,
                        backgroundColor: const Color.fromARGB(255, 22, 91, 209),
                      ) ,
                      onPressed: () async {
                        if (userFrom.currentState!.validate()) {
                          //
                          isLoding = true;
                          setState(() {
                            
                          });
                        await   LoginController.login(
                            context: context,
                            email: email.text,
                            Password: Password.text,
                          );
                           isLoding = false;
                          setState(() {
                            
                          });
                        }
                      },
                      child:isLoding ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ) : Text("Login"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: Row(
                  children: [
                    Text("Don't have an account?"),
                    SizedBox(width:5),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SignupScreen();
                            },
                          ),
                        );
                      },
                      child: Text(
                        "sign up here!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
