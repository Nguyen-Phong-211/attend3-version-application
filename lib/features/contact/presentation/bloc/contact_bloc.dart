// Bloc implementation for the Contact module.
// It reacts to ContactEvent and emits ContactState accordingly.

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:application/features/contact/domain/usecases/send_contact_usecase.dart';
import 'package:application/features/contact/presentation/bloc/contact_event.dart';
import 'package:application/features/contact/presentation/bloc/contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final SendContactUseCase sendContactUseCase;

  ContactBloc({required this.sendContactUseCase}) : super(ContactInitial()) {
    on<SendContactEvent>(_onSendContact);
    on<ResetContactEvent>((event, emit) => emit(ContactInitial()));
  }

  Future<void> _onSendContact(
      SendContactEvent event, Emitter<ContactState> emit) async {
    emit(ContactLoading());
    try {
      final result = await sendContactUseCase(event.contact);
      if (result) {
        emit(ContactSuccess());
      } else {
        emit(const ContactError('Failed to send contact.'));
      }
    } catch (e) {
      emit(ContactError(e.toString()));
    }
  }
}