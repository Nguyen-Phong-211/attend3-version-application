import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final bool isLoading;
  final String? userName;
  final List<String>? todaySchedules;
  final String? error;

  const HomeState({
    this.isLoading = false,
    this.userName,
    this.todaySchedules,
    this.error,
  });

  HomeState copyWith({
    bool? isLoading,
    String? userName,
    List<String>? todaySchedules,
    String? error,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      userName: userName ?? this.userName,
      todaySchedules: todaySchedules ?? this.todaySchedules,
      error: error,
    );
  }

  @override
  List<Object?> get props => [isLoading, userName, todaySchedules, error];
}