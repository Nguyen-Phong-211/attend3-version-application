import 'package:flutter_bloc/flutter_bloc.dart';
import 'create_qrcode_event.dart';
import 'create_qrcode_state.dart';
import 'package:application/features/attendance/domain/use_cases/generate_qr_code_use_case.dart';
import 'package:application/features/attendance/domain/entities/qr_code_data.dart';
import 'package:application/features/attendance/data_sources/create_qrcode_remote_data_source.dart';

class CreateQrCodeBloc extends Bloc<CreateQrCodeEvent, CreateQrCodeState> {
  final CreateQrCodeUseCase useCase;

  CreateQrCodeBloc({CreateQrCodeUseCase? customUseCase})
      : useCase = customUseCase ?? CreateQrCodeUseCase(remoteDataSource: AttendanceRemoteDataSource()),
        super(const CreateQrCodeState()) {
    on<ClassSelectedEvent>((event, emit) {
      emit(state.copyWith(selectedClass: event.selectedClass));
    });

    on<SubjectSelectedEvent>((event, emit) {
      emit(state.copyWith(selectedSubject: event.selectedSubject));
    });

    on<RadiusChangedEvent>((event, emit) {
      emit(state.copyWith(radius: event.radius));
    });

    on<NoteChangedEvent>((event, emit) {
      emit(state.copyWith(note: event.note));
    });

    on<GenerateQrCodeEvent>((event, emit) async {
      if (state.selectedClass == null || state.selectedSubject == null) {
        emit(state.copyWith(error: 'Vui lòng nhập đầy đủ dữ liệu'));
        return;
      }

      emit(state.copyWith(isLoading: true, error: null));

      final entity = QrCodeData(
        selectedClass: state.selectedClass!,
        selectedSubject: state.selectedSubject!,
        radius: state.radius,
        note: state.note,
      );

      try {
        final qrData = await useCase.call(entity);
        emit(state.copyWith(qrData: qrData, isLoading: false));
      } catch (e) {
        emit(state.copyWith(error: e.toString(), isLoading: false));
      }
    });
  }
}