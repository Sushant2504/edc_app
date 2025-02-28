import 'package:flutter/material.dart';

class TicketData {
  final String ticketId;
  final String ticketType;
  final String email;
  final String phone;
  final String name;

  TicketData({
    required this.ticketId,
    required this.ticketType,
    required this.email,
    required this.phone,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'ticketId': ticketId,
      'ticketType': ticketType,
      'email': email,
      'phone': phone,
      'name': name,
    };
  }

  factory TicketData.fromMap(Map<String, dynamic> map, String ticketId) {
    return TicketData(
      ticketId: ticketId,
      ticketType: map['ticketType'],
      email: map['email'],
      phone: map['phone'].toString(),
      name: map['name'],
    );
  }
}