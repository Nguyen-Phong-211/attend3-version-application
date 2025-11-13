// Represents all possible UI states for Contact feature.
// Used by ContactBloc to control UI feedback and rendering.

import 'package:equatable/equatable.dart';

abstract class ContactState extends Equatable {
  const ContactState();

  @override
  List<Object?> get props => [];
}

/// Initial idle state
class ContactInitial extends ContactState {}

/// Loading state when sending message
class ContactLoading extends ContactState {}

/// Success state when message sent successfully
class ContactSuccess extends ContactState {}

/// Error state with message
class ContactError extends ContactState {
  final String message;

  const ContactError(this.message);

  @override
  List<Object?> get props => [message];
}