import 'package:equatable/equatable.dart';

class CreateQrCodeState extends Equatable {
  final String? selectedClass;
  final String? selectedSubject;
  final String radius;
  final String note;
  final String? qrData;
  final bool isLoading;
  final String? error;

  const CreateQrCodeState({
    this.selectedClass,
    this.selectedSubject,
    this.radius = '5',
    this.note = '',
    this.qrData,
    this.isLoading = false,
    this.error,
  });

  CreateQrCodeState copyWith({
    String? selectedClass,
    String? selectedSubject,
    String? radius,
    String? note,
    String? qrData,
    bool? isLoading,
    String? error,
  }) {
    return CreateQrCodeState(
      selectedClass: selectedClass ?? this.selectedClass,
      selectedSubject: selectedSubject ?? this.selectedSubject,
      radius: radius ?? this.radius,
      note: note ?? this.note,
      qrData: qrData ?? this.qrData,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [selectedClass, selectedSubject, radius, note, qrData, isLoading, error];
}