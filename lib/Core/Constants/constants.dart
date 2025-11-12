import 'package:flutter/material.dart';

class AppConstants {
  static const List<String> statusOptions = ['Active', 'Inactive', 'Suspended'];
  static const List<String> programOptions = [
    'Computer Science',
    'Business Administration',
    'Water Engineering',
    'Forensic Science',
    'Psychology',
  ];
  static const List<String> yearLevels = [
    '1st Year',
    '2nd Year',
    '3rd Year',
    '4th Year',
  ];
}

class AppColors {
  static const Color background = Color(0xFFF3F4F6);
  static const Color primary = Color(0xFF6366F1);
  static const Color secondary = Colors.lightBlue;
  static const Color inputBackground = Color(0xFFF9FAFB);
  static const Color border = Color(0xFFE5E7EB);
}
