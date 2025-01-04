// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/bindings/home_bindings.dart';

class AppRoutes {
  static const String HOME = '/';

  static final routes = [
    GetPage(
      name: HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
