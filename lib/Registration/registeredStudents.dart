// ignore_for_file: unused_element

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mwanafunziportal/Models/student.dart' show students, Student;
import 'package:mwanafunziportal/Registration/registerStudent.dart';
import 'package:mwanafunziportal/Registration/viewStudent.dart';
import 'package:mwanafunziportal/Registration/editStudentForm.dart'; // Add this import

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Students Registry Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins', primarySwatch: Colors.indigo),
      home: const StudentRegistryScreen(),
    );
  }
}

class StudentRegistryScreen extends StatefulWidget {
  const StudentRegistryScreen({super.key});

  @override
  State<StudentRegistryScreen> createState() => _StudentRegistryScreenState();
}

class _StudentRegistryScreenState extends State<StudentRegistryScreen> {
  // ──────────────────────────── VIEW DIALOG ─────────────────────────────

  // ──────────────────────────── EDIT FORM ─────────────────────────────

  // ──────────────────────────── MAIN UI ─────────────────────────────
  void _refreshData() {
    setState(() {
      // This will rebuild the widget and reflect the changes
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              child: Text(
                'Students Registry Dashboard',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width - 32,
                    ),
                    child: DataTable(
                      columnSpacing: 20,
                      horizontalMargin: 12,
                      dataRowMinHeight: 48,
                      dataRowMaxHeight:
                          double.infinity, // Allows rows to expand
                      columns: [
                        DataColumn(
                          label: Expanded(
                            child: Text('Photo', style: GoogleFonts.poppins()),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text('Name', style: GoogleFonts.poppins()),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              'Student ID',
                              style: GoogleFonts.poppins(),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text('Status', style: GoogleFonts.poppins()),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              'Enrolled Date',
                              style: GoogleFonts.poppins(),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              'Program',
                              style: GoogleFonts.poppins(),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              'Year Level',
                              style: GoogleFonts.poppins(),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text('GPA', style: GoogleFonts.poppins()),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              'Actions',
                              style: GoogleFonts.poppins(),
                            ),
                          ),
                        ),
                      ],
                      rows:
                          students
                              .map(
                                (s) => DataRow(
                                  cells: [
                                    // 1. Photo cell
                                    DataCell(
                                      InkWell(
                                        onTap:
                                            () =>
                                                ViewStudent.showStudentDetails(
                                                  context,
                                                  s,
                                                  onUpdate: _refreshData,
                                                ),
                                        child: CircleAvatar(
                                          radius: 20,
                                          backgroundImage: NetworkImage(
                                            s.photoUrl,
                                          ),
                                        ),
                                      ),
                                    ),
                                    // 2. Name cell
                                    DataCell(
                                      Container(
                                        constraints: BoxConstraints(
                                          maxWidth: 150,
                                        ),
                                        child: Text(
                                          s.name,
                                          style: GoogleFonts.poppins(),
                                          overflow: TextOverflow.visible,
                                          softWrap: true,
                                        ),
                                      ),
                                    ),
                                    // 3. ID cell
                                    DataCell(
                                      Text(s.id, style: GoogleFonts.poppins()),
                                    ),
                                    // 4. Status cell
                                    DataCell(
                                      Text(
                                        s.status,
                                        style: GoogleFonts.poppins(),
                                      ),
                                    ),
                                    // 5. Enrolled Date cell
                                    DataCell(
                                      Text(
                                        s.enrolledDate,
                                        style: GoogleFonts.poppins(),
                                      ),
                                    ),
                                    // 6. Program cell
                                    DataCell(
                                      Container(
                                        constraints: BoxConstraints(
                                          maxWidth: 200,
                                        ),
                                        child: Text(
                                          s.program,
                                          style: GoogleFonts.poppins(),
                                          overflow: TextOverflow.visible,
                                          softWrap: true,
                                        ),
                                      ),
                                    ),
                                    // 7. Year Level cell
                                    DataCell(
                                      Text(
                                        s.yearLevel,
                                        style: GoogleFonts.poppins(),
                                      ),
                                    ),
                                    // 8. GPA cell
                                    DataCell(
                                      Text(s.gpa, style: GoogleFonts.poppins()),
                                    ),
                                    // 9. Actions cell - THIS WAS THE PROBLEM!
                                    DataCell(
                                      InkWell(
                                        onTap:
                                            () =>
                                                ViewStudent.showStudentDetails(
                                                  context,
                                                  s,
                                                  onUpdate: _refreshData,
                                                ),
                                        child: Container(
                                          width: 60,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: Colors.lightBlue,
                                            borderRadius: BorderRadius.circular(
                                              15,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'View',
                                              style: GoogleFonts.poppins(
                                                fontSize: 13,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              .toList(),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterStudentScreen(),
                      ),
                    ),
                child: Container(
                  width: 180,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'Register New Student',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
