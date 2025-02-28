import 'package:flutter/material.dart';

//user data model for user registration purpose ....

class Usermodel {
  final String? id;
  final String? fullName;
  final String? email;
  final String? password;
  final String? phoneNo;
  final String? college;

  Usermodel(
      {required this.id,
      required this.fullName,
      required this.email,
      required this.password,
      required this.phoneNo,
      required this.college});


  // method to convert user model to json format for storage purpose....
  Map<String, dynamic> toMap() {
     return {
       'id': id,
       'fullName': fullName,
       'email': email,
       'password': password,
       'phoneNo': phoneNo,
       'college': college,
     };
  }


  // reconvert this code to back to dart for usage purpose ....
  factory Usermodel.fromMap(Map<String, dynamic> map, String ticketId) {
    return Usermodel(
      id: map['id'],
      fullName: map['fullName'],
      email: map['email'],
      password: map['password'],
      phoneNo: map['phoneNo'],
      college: map['college'],
    );

    
  }


}
