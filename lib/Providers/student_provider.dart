import 'package:flutter/material.dart';

class Student {
  final String id;
  final String name;
  final String email;
  final String studentId;
  final String status;
  final String enrolledDate;
  final String yearLevel;
  final String gpa;
  final String imagePath;

  Student({
    required this.id,
    required this.name,
    required this.email,
    required this.studentId,
    required this.status,
    required this.enrolledDate,
    required this.yearLevel,
    required this.gpa,
    required this.imagePath,
  });
}

class StudentProvider extends ChangeNotifier {
  final List<Student> _students = [];

  List<Student> get students => _students;

  void addStudent(Student student) {
    _students.add(student);
    notifyListeners();
  }
}
