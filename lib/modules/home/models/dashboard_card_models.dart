import 'package:flutter/material.dart';

class DashboardCardModel {
  final String title;
  final String subtitle;
  final String description;
  final String value;
  final Color color;
  final IconData icon;

  DashboardCardModel({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.description,
    required this.value,
  });
}
