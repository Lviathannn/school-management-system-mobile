import 'package:flutter/material.dart';
import 'package:school_management_system/modules/home/widgets/student_content.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';

class StudentPage extends StatelessWidget {
  const StudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          title: TabBar(
            // ignore: deprecated_member_use
            dividerColor: AppColors.textLight.withOpacity(0),
            labelColor: AppColors.primary,
            indicatorColor: AppColors.primary,
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            tabs: const [
              Tab(text: 'Siswa'),
              Tab(text: 'Tabungan'),
              Tab(text: 'Nilai'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            StudentContent(),
            Center(child: Text('Content Tabungan')),
            Center(child: Text('Content Nilai')),
          ],
        ),
      ),
    );
  }
}
