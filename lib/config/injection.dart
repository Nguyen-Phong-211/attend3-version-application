import 'package:application/features/auth/injection.dart';
import 'package:application/features/home/injection.dart';
import 'package:application/features/leave_request/injection.dart';
import 'package:application/features/statistics/injection.dart';

void initAppInjection() {
  initAuthModule();
  initHomeModule();
  initLeaveRequestModule();
  initApprovalModule();
  initStatisticModule();
}