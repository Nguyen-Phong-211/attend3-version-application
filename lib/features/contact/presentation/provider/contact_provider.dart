// Provider for managing ContactScreen state using ChangeNotifier.

import 'package:flutter/foundation.dart';
import 'package:application/features/contact/domain/entities/contact_entity.dart';
import 'package:application/features/contact/domain/usecases/send_contact_usecase.dart';

enum ContactStatus { initial, loading, success, error }

class ContactProvider extends ChangeNotifier {
  final SendContactUseCase sendContactUseCase;

  ContactProvider({required this.sendContactUseCase});

  ContactStatus status = ContactStatus.initial;
  String? errorMessage;

  Future<void> sendContact(ContactEntity contact) async {
    status = ContactStatus.loading;
    notifyListeners();

    try {
      final result = await sendContactUseCase(contact);
      if (result) {
        status = ContactStatus.success;
      } else {
        status = ContactStatus.error;
        errorMessage = 'Failed to send contact.';
      }
    } catch (e) {
      status = ContactStatus.error;
      errorMessage = e.toString();
    }

    notifyListeners();
  }

  void reset() {
    status = ContactStatus.initial;
    errorMessage = null;
    notifyListeners();
  }
}