import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mwanafunziportal/Models/student.dart';

class ViewStudent {
  // Make this a static method so it can be called without creating an instance
  static void showStudentDetails(
    BuildContext context,
    Student student, {
    Function(Student)? onEdit,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(student.photoUrl),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  student.name,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(),
              Text(
                'Student ID: ${student.id}',
                style: GoogleFonts.poppins(fontSize: 18),
              ),
              Text(
                'Status: ${student.status}',
                style: GoogleFonts.poppins(fontSize: 18),
              ),
              Text(
                'Program: ${student.program}',
                style: GoogleFonts.poppins(fontSize: 18),
              ),
              Text(
                'Year Level: ${student.yearLevel}',
                style: GoogleFonts.poppins(fontSize: 18),
              ),
              Text(
                'GPA: ${student.gpa}',
                style: GoogleFonts.poppins(fontSize: 18),
              ),
              Text(
                'Enrolled Date: ${student.enrolledDate}',
                style: GoogleFonts.poppins(fontSize: 18),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Close',
                style: GoogleFonts.poppins(color: Colors.indigo),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                if (onEdit != null) {
                  onEdit(student);
                }
              },
              child: Container(
                width: 60,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    'Edit',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
