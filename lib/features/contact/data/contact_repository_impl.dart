// Concrete implementation of ContactRepository
// It communicates with ContactRemoteDataSource to send the contact info.

import 'package:application/features/contact/data/contact_repository.dart';
import 'package:application/features/contact/data_sources/contact_remote_data_source.dart';
import 'package:application/features/contact/domain/entities/contact_entity.dart';

class ContactRepositoryImpl implements ContactRepository {
  final ContactRemoteDataSource remoteDataSource;

  ContactRepositoryImpl({required this.remoteDataSource});

  @override
  Future<bool> sendContact(ContactEntity contact) async {
    // Call the remote API to send contact info
    return await remoteDataSource.sendContact(contact);
  }
}