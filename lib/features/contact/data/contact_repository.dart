// Defines the abstract repository interface for Contact feature.
// This is the contract that the domain layer depends on.

import 'package:application/features/contact/domain/entities/contact_entity.dart';

abstract class ContactRepository {
  /// Send a contact message to API or server
  Future<bool> sendContact(ContactEntity contact);
}