// Defines all events that can happen in the Contact feature.
// Bloc listens to these events and performs corresponding actions.

import 'package:equatable/equatable.dart';
import 'package:application/features/contact/domain/entities/contact_entity.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object?> get props => [];
}

/// Triggered when user submits the contact form
class SendContactEvent extends ContactEvent {
  final ContactEntity contact;

  const SendContactEvent(this.contact);

  @override
  List<Object?> get props => [contact];
}

/// Reset to initial state
class ResetContactEvent extends ContactEvent {}