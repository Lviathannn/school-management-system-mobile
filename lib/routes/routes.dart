// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:school_management_system/modules/auth/bindings/auth_binding.dart';
import 'package:school_management_system/modules/auth/view/auth_view.dart';
import 'package:school_management_system/modules/home/bindings/income_binding.dart';
import 'package:school_management_system/modules/home/bindings/student_binging.dart';
import 'package:school_management_system/modules/home/bindings/teacher_bindings.dart';
import 'package:school_management_system/modules/splash/view/splash_view.dart';
import 'package:school_management_system/modules/student_detail/bindings/student_detail_binding.dart';
import 'package:school_management_system/modules/student_detail/views/student_detail_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/bindings/home_bindings.dart';

class AppRoutes {
  static const String HOME = '/';
  static const String SPLASH = '/splash';
  static const String LOGIN = '/login';
  static const String STUDENT_DETAIL = '/student-detail:id';

  static final routes = [
    GetPage(name: HOME, page: () => HomeView(), bindings: [
      HomeBinding(),
      StudentBinding(),
      TeacherBinding(),
      IncomeBinding(),
    ]),
    GetPage(
      name: SPLASH,
      page: () => SplashView(),
    ),
    GetPage(
      name: LOGIN,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: STUDENT_DETAIL,
      page: () => const StudentDetailView(),
      binding: StudentDetailBinding(),
    ),
  ];
}
