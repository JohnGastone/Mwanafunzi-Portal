import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mwanafunziportal/Models/student.dart';
import 'package:mwanafunziportal/Registration/registerStudent.dart';
import 'package:mwanafunziportal/Registration/viewStudent.dart';

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

  void _showEditForm(Student student) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController(text: student.name);
    final idController = TextEditingController(text: student.id);
    final gpaController = TextEditingController(text: student.gpa);
    File? selectedImage;
    String? selectedStatus = student.status;
    String? selectedProgram = student.program;
    String? selectedYearLevel = student.yearLevel;
    DateTime enrolledDate = _parseDate(student.enrolledDate);

    final List<String> statusOptions = ['Active', 'Inactive', 'Suspended'];
    final List<String> programOptions = [
      'Computer Science',
      'Business Administration',
      'Water Engineering',
      'Forensic Science',
      'Psychology',
    ];
    final List<String> yearLevels = [
      '1st Year',
      '2nd Year',
      '3rd Year',
      '4th Year',
    ];

    Future<void> pickImage() async {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() => selectedImage = File(pickedFile.path));
      }
    }

    Future<void> selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: enrolledDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );
      if (picked != null) {
        setState(() => enrolledDate = picked);
      }
    }

    void submitForm() {
      if (formKey.currentState!.validate()) {
        setState(() {
          student.name = nameController.text;
          student.id = idController.text;
          student.gpa = gpaController.text;
          student.status = selectedStatus!;
          student.program = selectedProgram!;
          student.yearLevel = selectedYearLevel!;
          student.enrolledDate =
              "${enrolledDate.month}/${enrolledDate.day}/${enrolledDate.year}";
          if (selectedImage != null) {
            student.photoUrl = selectedImage!.path;
          }
        });
        Navigator.pop(context);
      }
    }

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              scrollable: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: Text('Edit Student'),
              content: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Student Photo',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 12),
                    Center(
                      child: GestureDetector(
                        onTap: pickImage,
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF9FAFB),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFFE5E7EB),
                              width: 2,
                            ),
                          ),
                          child:
                              selectedImage != null
                                  ? ClipOval(
                                    child: Image.file(
                                      selectedImage!,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                  : CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      student.photoUrl,
                                    ),
                                    radius: 60,
                                  ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text('Full Name', style: GoogleFonts.poppins()),
                    TextFormField(
                      style: GoogleFonts.poppins(),
                      controller: nameController,
                      validator: (v) => v!.isEmpty ? 'Enter full name' : null,
                    ),
                    const SizedBox(height: 12),
                    Text('Student ID', style: GoogleFonts.poppins()),
                    TextFormField(
                      style: GoogleFonts.poppins(),
                      controller: idController,
                      validator: (v) => v!.isEmpty ? 'Enter student ID' : null,
                    ),
                    const SizedBox(height: 12),
                    Text('Status', style: GoogleFonts.poppins()),
                    DropdownButtonFormField<String>(
                      initialValue: selectedStatus,
                      onChanged: (v) => setState(() => selectedStatus = v),
                      items:
                          statusOptions
                              .map(
                                (v) => DropdownMenuItem(
                                  value: v,
                                  child: Text(v, style: GoogleFonts.poppins()),
                                ),
                              )
                              .toList(),
                    ),
                    const SizedBox(height: 12),
                    Text('Program', style: GoogleFonts.poppins()),
                    DropdownButtonFormField<String>(
                      initialValue: selectedProgram,
                      onChanged: (v) => setState(() => selectedProgram = v),
                      items:
                          programOptions
                              .map(
                                (v) => DropdownMenuItem(
                                  value: v,
                                  child: Text(v, style: GoogleFonts.poppins()),
                                ),
                              )
                              .toList(),
                    ),
                    const SizedBox(height: 12),
                    Text('Year Level', style: GoogleFonts.poppins()),
                    DropdownButtonFormField<String>(
                      initialValue: selectedYearLevel,
                      onChanged: (v) => setState(() => selectedYearLevel = v),
                      items:
                          yearLevels
                              .map(
                                (v) => DropdownMenuItem(
                                  value: v,
                                  child: Text(v, style: GoogleFonts.poppins()),
                                ),
                              )
                              .toList(),
                    ),
                    const SizedBox(height: 12),
                    Text('GPA', style: GoogleFonts.poppins()),
                    TextFormField(
                      style: GoogleFonts.poppins(),
                      controller: gpaController,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      validator: (v) {
                        final g = double.tryParse(v ?? '');
                        if (g == null || g < 0 || g > 4) {
                          return 'Enter valid GPA (0.0 - 4.0)';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    Text('Enrolled Date', style: GoogleFonts.poppins()),
                    InkWell(
                      onTap: () => selectDate(context),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF9FAFB),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: const Color(0xFFE5E7EB)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${enrolledDate.month}/${enrolledDate.day}/${enrolledDate.year}",
                              style: GoogleFonts.poppins(fontSize: 16),
                            ),
                            const Icon(Icons.calendar_today, size: 18),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel', style: GoogleFonts.poppins()),
                ),
                ElevatedButton(
                  onPressed: submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6366F1),
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Save Changes', style: GoogleFonts.poppins()),
                ),
              ],
            );
          },
        );
      },
    );
  }

  DateTime _parseDate(String dateStr) {
    try {
      final parts = dateStr.split('/');
      return DateTime(
        int.parse(parts[2]),
        int.parse(parts[0]),
        int.parse(parts[1]),
      );
    } catch (_) {
      return DateTime.now();
    }
  }

  // ──────────────────────────── MAIN UI ─────────────────────────────

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
                                    DataCell(
                                      InkWell(
                                        onTap:
                                            () =>
                                                ViewStudent.showStudentDetails(
                                                  context,
                                                  s,
                                                  onEdit: _showEditForm,
                                                ),
                                        child: CircleAvatar(
                                          radius: 20,
                                          backgroundImage: NetworkImage(
                                            s.photoUrl,
                                          ),
                                        ),
                                      ),
                                    ),
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
                                    DataCell(
                                      Text(s.id, style: GoogleFonts.poppins()),
                                    ),
                                    DataCell(
                                      Text(
                                        s.status,
                                        style: GoogleFonts.poppins(),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        s.enrolledDate,
                                        style: GoogleFonts.poppins(),
                                      ),
                                    ),
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
                                    DataCell(
                                      Text(
                                        s.yearLevel,
                                        style: GoogleFonts.poppins(),
                                      ),
                                    ),
                                    DataCell(
                                      InkWell(
                                        onTap:
                                            () =>
                                                ViewStudent.showStudentDetails(
                                                  context,
                                                  s,
                                                  onEdit: _showEditForm,
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
