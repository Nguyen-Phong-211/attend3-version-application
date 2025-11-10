import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_history_event.dart';
import 'login_history_state.dart';
import 'package:application/features/setting/domain/usecases/get_login_history_usecase.dart';

class LoginHistoryBloc extends Bloc<LoginHistoryEvent, LoginHistoryState> {
  final GetLoginHistoryUseCase getLoginHistoryUseCase;

  LoginHistoryBloc({required this.getLoginHistoryUseCase}) : super(SettingInitial()) {
    on<FetchLoginHistoryEvent>((event, emit) async {
      emit(SettingLoading());
      try {
        final result = await getLoginHistoryUseCase.call();
        emit(SettingLoaded(result));
      } catch (e) {
        emit(SettingError(e.toString()));
      }
    });
  }
}