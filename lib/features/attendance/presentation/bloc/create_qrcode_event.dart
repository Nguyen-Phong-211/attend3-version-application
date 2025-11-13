import 'package:equatable/equatable.dart';

abstract class CreateQrCodeEvent extends Equatable {
  const CreateQrCodeEvent();
  @override
  List<Object?> get props => [];
}

class ClassSelectedEvent extends CreateQrCodeEvent {
  final String selectedClass;
  const ClassSelectedEvent(this.selectedClass);
  @override
  List<Object?> get props => [selectedClass];
}

class SubjectSelectedEvent extends CreateQrCodeEvent {
  final String selectedSubject;
  const SubjectSelectedEvent(this.selectedSubject);
  @override
  List<Object?> get props => [selectedSubject];
}

class RadiusChangedEvent extends CreateQrCodeEvent {
  final String radius;
  const RadiusChangedEvent(this.radius);
  @override
  List<Object?> get props => [radius];
}

class NoteChangedEvent extends CreateQrCodeEvent {
  final String note;
  const NoteChangedEvent(this.note);
  @override
  List<Object?> get props => [note];
}

class GenerateQrCodeEvent extends CreateQrCodeEvent {}