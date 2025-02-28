import 'package:edc_app/models/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edc_app/models/ticket_data.dart';

class DatabaseService {
  // collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('admitted_user_vp25');

  Future updateUserData(Usermodel userData) async {
    return await userCollection.doc(userData.email).set(userData.toMap());
  }

  // user data from snapshot ...
  Usermodel _userDataFromsnapshot(DocumentSnapshot snapshot) {
    return Usermodel.fromMap(snapshot.data() as Map<String, dynamic>);
  }

  final CollectionReference kticketCOllection =
      FirebaseFirestore.instance.collection('admitted_users');

  // get user doc stream
  Stream<Usermodel> get userData {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    return userCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }

  // get user doc stream
  Stream<Usermodel> getUserData(String email) {
    return userCollection.doc(email).snapshots().map(_userDataFromSnapshot);
  }

  //vp24_ticket
  //Collection reference for tickets
  final CollectionReference ticketCollection =
      FirebaseFirestore.instance.collection('vp24_registrations');

  //get ticket data from snapshot
  Usermodel _ticketDataFromSnapshot(DocumentSnapshot snapshot) {
    return Usermodel.fromMap(snapshot.data() as Map<String, dynamic>);
  }

  //get ticket doc stream
  Stream<Usermodel> get ticketData {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    return ticketCollection.doc(uid).snapshots().map(_ticketDataFromSnapshot);
  }

  //method to check weather the user has registered or not
  Future<TicketData?> checkRegistration() async {
    try {
      User user = FirebaseAuth.instance.currentUser!;

      QuerySnapshot querySnapshot =
          await ticketCollection.where('email', isEqualTo: user.email).get();

      if (querySnapshot.docs.isEmpty) {
        return null;
      } else {
        return TicketData.fromMap(
            querySnapshot.docs.first.data() as Map<String, dynamic>,
            querySnapshot.docs.first.id);
      }
    } on FirebaseException catch (e) {
      print(e);
      return null;
    }
  }


  //events connnectivity  ....


}
