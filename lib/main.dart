import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/routes/routes.dart';
import 'package:school_management_system/shared/themes/app_theme.dart';
import 'modules/home/bindings/home_bindings.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://typojlatklqteaixmkxk.supabase.co',
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR5cG9qbGF0a2xxdGVhaXhta3hrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzkwMDAyNTksImV4cCI6MjA1NDU3NjI1OX0.TbscihsJyPJTyX3yydhgZKHZzoh5SJ3bOk-y1hEpsKA",
  );

  initializeDateFormatting('id', null).then((_) {
    Intl.defaultLocale = 'id';
  });
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      defaultTransition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300), 
      initialBinding: HomeBinding(),
      initialRoute: AppRoutes.SPLASH,
      getPages: AppRoutes.routes,
    );
  }
}
