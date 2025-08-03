import 'package:flutter/material.dart';
import 'package:globalchat/controllers/signup_controller.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SignupScreen> {
  var userFrom = GlobalKey<FormState>();
    bool isLoding = false;

  TextEditingController email = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController country = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: userFrom,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset("assets/images/logo.png"),
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name is required";
                    }
                    return null;
                  },
                  decoration: InputDecoration(label: Text("Name")),
                ),
                SizedBox(height: 23),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: country,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Country is required";
                    }
                    return null;
                  },
                  decoration: InputDecoration(label: Text("Country")),
                ),
                SizedBox(height: 23),
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
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(0, 50),
                          foregroundColor: Colors.white,
                          backgroundColor: const Color.fromARGB(
                            255,
                            22,
                            91,
                            209,
                          ),
                        ),
                        onPressed: () async {
                          if (userFrom.currentState!.validate()) {
                            //
                             isLoding = true;
                          setState(() {
                            
                          });
                           await  SignupController.createAccount(
                              context: context,
                              email: email.text,
                              Password: Password.text,
                              name: name.text,
                              country: country.text,
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
                      ) : Text("Create account"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
