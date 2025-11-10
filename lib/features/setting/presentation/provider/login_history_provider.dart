import 'package:flutter/material.dart';
import 'package:application/features/setting/domain/entities/login_history_entity.dart';
import 'package:application/features/setting/domain/usecases/get_login_history_usecase.dart';

class LoginHistoryProvider extends ChangeNotifier {
  final GetLoginHistoryUseCase getLoginHistoryUseCase;

  LoginHistoryProvider({required this.getLoginHistoryUseCase});

  bool _isLoading = false;
  String? _errorMessage;
  List<LoginHistoryEntity> _loginHistory = [];

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  List<LoginHistoryEntity> get loginHistory => _loginHistory;

  Future<void> fetchLoginHistory() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final result = await getLoginHistoryUseCase.call();
      _loginHistory = result;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}