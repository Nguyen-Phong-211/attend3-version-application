import 'package:application/features/auth/injection.dart';
import 'package:application/features/home/injection.dart';
import 'package:application/features/leave_request/injection.dart';
import 'package:application/features/statistics/injection.dart';
import 'package:application/features/schedule/injection.dart';
import 'package:application/features/setting/injection.dart';
import 'package:application/features/attendance/injection.dart';
import 'package:application/features/contact/injection.dart';

void initAppInjection() {
  initAuthModule();
  initHomeModule();
  initLeaveRequestModule();
  initApprovalModule();
  initStatisticModule();
  initScheduleModule();
  initScheduleTeachingModule();
  initSettingModule();
  initLoginHistoryModule();
  initAttendanceModule();
  initContactModule();
}