import 'package:hugeicons/hugeicons.dart';
import 'package:school_management_system/modules/home/models/dashboard_card_models.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';

final List<DashboardCardModel> dashboardCards = [
  DashboardCardModel(
    title: 'Siswa',
    subtitle: 'Saat Ini',
    description: 'Total Siswa',
    value: '100',
    color: AppColors.indigo,
    icon: HugeIcons.strokeRoundedBackpack02,
  ),
  DashboardCardModel(
    title: 'Guru',
    subtitle: 'Saat Ini',
    description: 'Total Guru',
    value: '10',
    color: AppColors.primary,
    icon: HugeIcons.strokeRoundedMortarboard02,
  ),
  DashboardCardModel(
    title: 'Tabungan',
    subtitle: 'Saat Ini',
    description: 'Total Tabungan',
    value: 'Rp 100.000.000',
    color: AppColors.pink,
    icon: HugeIcons.strokeRoundedDollarSquare,
  ),
];
