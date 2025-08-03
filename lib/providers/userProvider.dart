import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class Userprovider extends ChangeNotifier{
String userName ="Dummy Name";
String userEmail ="Dummy Email";
String userId ="Dummy userId";

var db = FirebaseFirestore.instance;



void getUserDetails (){
  var authUser = FirebaseAuth.instance.currentUser;
db.collection("users").doc(authUser!.uid).get().then((dataSnapshort){
userName = dataSnapshort.data()?["name"]??"";
userEmail = dataSnapshort.data()?["email"]??"";
userId = dataSnapshort.data()?["id"]??"";
notifyListeners();
});
}


}