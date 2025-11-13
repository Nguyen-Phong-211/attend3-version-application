// Defines the use case (business logic) for sending a contact form.

import 'package:application/features/contact/data/contact_repository.dart';
import 'package:application/features/contact/domain/entities/contact_entity.dart';

class SendContactUseCase {
  final ContactRepository repository;

  SendContactUseCase({required this.repository});

  Future<bool> call(ContactEntity contact) async {
    return await repository.sendContact(contact);
  }
}