// Simulates a remote API call for sending contact messages.
// In a real scenario, this would use Dio or http to call your backend.

import 'dart:async';
import 'package:application/features/contact/domain/entities/contact_entity.dart';

class ContactRemoteDataSource {
  Future<bool> sendContact(ContactEntity contact) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));

    // Sample log (you could print or log this)
    print('[Contact API] Sending contact: ${contact.toJson()}');

    // Simulated success response
    return true;
  }
}