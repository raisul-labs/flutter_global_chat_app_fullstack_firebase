import 'package:flutter/material.dart';
import 'package:globalchat/providers/userProvider.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<EditProfile> {
  Map<String, dynamic>? userData = {};

  var db = FirebaseFirestore.instance;

  TextEditingController nameText = TextEditingController();
  var editProfileForm = GlobalKey<FormState>();
  @override
  void initState() {
    nameText.text = Provider.of<Userprovider>(context, listen: false).userName;
    // TODO: implement initState
    super.initState();
  }

  void updateData() {
    Map<String, dynamic> dataToUpdate = {"name":nameText.text};
    db
        .collection("users")
        .doc(Provider.of<Userprovider>(context, listen: false).userId)
        .update(dataToUpdate);

        Provider.of<Userprovider>(context, listen: false).getUserDetails();
        Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<Userprovider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        actions: [
          InkWell(
            onTap: () {
              if (editProfileForm.currentState!.validate()) {
                updateData();
                //updeting of the data on database
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.check_sharp),
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: editProfileForm,
            child: Column(
              children: [
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name cannot be empty.";
                    }
                  },
                  controller: nameText,
                  decoration: InputDecoration(label: Text("Name")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
