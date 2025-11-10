import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Registry',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins', primarySwatch: Colors.indigo),
      home: const StudentRegistryScreen(),
    );
  }
}

class Student {
  String name;
  String id;
  String photoUrl;
  String status;
  String program;
  String yearLevel;
  String gpa;
  String enrolledDate;
  bool isChecked;

  Student({
    required this.name,
    required this.id,
    required this.photoUrl,
    required this.status,
    required this.program,
    required this.yearLevel,
    required this.gpa,
    required this.enrolledDate,
    this.isChecked = false,
  });
}

class StudentRegistryScreen extends StatefulWidget {
  const StudentRegistryScreen({super.key});

  @override
  State<StudentRegistryScreen> createState() => _StudentRegistryScreenState();
}

class _StudentRegistryScreenState extends State<StudentRegistryScreen> {
  final List<Student> students = [
    Student(
      name: 'Lindsay Walton',
      id: 'STU-2023-001',
      photoUrl:
          'https://images.unsplash.com/photo-1517841905240-472988babdf9?auto=format&fit=facearea&facepad=2&w=256&h=256&q=80',
      status: 'Active',
      program: 'Computer Science',
      yearLevel: '3rd Year',
      gpa: '3.8',
      enrolledDate: '09/08/2021',
    ),
    Student(
      name: 'Marvin McKinney',
      id: 'STU-2023-002',
      photoUrl:
          'https://t4.ftcdn.net/jpg/02/14/74/61/360_F_214746128_31JkeaP6rU0NzzzdFC4khGkmqc8noe6h.jpg',
      status: 'Active',
      program: 'Business Administration',
      yearLevel: '2nd Year',
      gpa: '3.5',
      enrolledDate: '03/13/2022',
    ),
  ];

  // ──────────────────────────── VIEW DIALOG ─────────────────────────────

  void _showStudentDetails(Student student) {
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
                  style: const TextStyle(
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
              Text('Student ID: ${student.id}'),
              Text('Status: ${student.status}'),
              Text('Program: ${student.program}'),
              Text('Year Level: ${student.yearLevel}'),
              Text('GPA: ${student.gpa}'),
              Text('Enrolled Date: ${student.enrolledDate}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Close',
                style: TextStyle(color: Colors.indigo),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _showEditForm(student);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6366F1),
              ),
              child: const Text('Edit'),
            ),
          ],
        );
      },
    );
  }

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
      'Engineering',
      'Mathematics',
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
              title: const Text('Edit Student'),
              content: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Student Photo',
                      style: TextStyle(fontWeight: FontWeight.w600),
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
                    const Text('Full Name'),
                    TextFormField(
                      controller: nameController,
                      validator: (v) => v!.isEmpty ? 'Enter full name' : null,
                    ),
                    const SizedBox(height: 12),
                    const Text('Student ID'),
                    TextFormField(
                      controller: idController,
                      validator: (v) => v!.isEmpty ? 'Enter student ID' : null,
                    ),
                    const SizedBox(height: 12),
                    const Text('Status'),
                    DropdownButtonFormField<String>(
                      value: selectedStatus,
                      onChanged: (v) => setState(() => selectedStatus = v),
                      items:
                          statusOptions
                              .map(
                                (v) =>
                                    DropdownMenuItem(value: v, child: Text(v)),
                              )
                              .toList(),
                    ),
                    const SizedBox(height: 12),
                    const Text('Program'),
                    DropdownButtonFormField<String>(
                      value: selectedProgram,
                      onChanged: (v) => setState(() => selectedProgram = v),
                      items:
                          programOptions
                              .map(
                                (v) =>
                                    DropdownMenuItem(value: v, child: Text(v)),
                              )
                              .toList(),
                    ),
                    const SizedBox(height: 12),
                    const Text('Year Level'),
                    DropdownButtonFormField<String>(
                      value: selectedYearLevel,
                      onChanged: (v) => setState(() => selectedYearLevel = v),
                      items:
                          yearLevels
                              .map(
                                (v) =>
                                    DropdownMenuItem(value: v, child: Text(v)),
                              )
                              .toList(),
                    ),
                    const SizedBox(height: 12),
                    const Text('GPA'),
                    TextFormField(
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
                    const Text('Enrolled Date'),
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
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6366F1),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Save Changes'),
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
              color: Colors.white,
              child: const Text(
                'Student Registry',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: DataTable(
                  columns: const [
                    // DataColumn(label: Text('Photo')),
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Student ID')),
                    DataColumn(label: Text('Status')),
                    DataColumn(label: Text('Program')),
                    DataColumn(label: Text('Year Level')),
                    DataColumn(label: Text('GPA')),
                    DataColumn(label: Text('Actions')),
                  ],
                  rows:
                      students
                          .map(
                            (s) => DataRow(
                              cells: [
                                // DataCell(Text(s.)),
                                DataCell(Text(s.name)),
                                DataCell(Text(s.id)),
                                DataCell(Text(s.status)),
                                DataCell(Text(s.program)),
                                DataCell(Text(s.yearLevel)),
                                DataCell(Text(s.gpa)),
                                DataCell(
                                  ElevatedButton(
                                    onPressed: () => _showStudentDetails(s),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF6366F1),
                                    ),
                                    child: const Text('View'),
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
