import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
  final String name;
  final String id;
  final String photoUrl;
  final String status;
  final String program;
  final String yearLevel;
  final String gpa;
  final String enrolledDate;
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
  const StudentRegistryScreen({Key? key}) : super(key: key);

  @override
  State<StudentRegistryScreen> createState() => _StudentRegistryScreenState();
}

class _StudentRegistryScreenState extends State<StudentRegistryScreen> {
  List<Student> students = [
    Student(
      name: 'Lindsay Walton',
      id: 'STU-2023-001',
      photoUrl:
          'https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80',
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
    Student(
      name: 'Alma Lawson',
      id: 'STU-2023-003',
      photoUrl:
          'https://img.freepik.com/free-photo/female-looking-directly-into-camera_273609-12389.jpg',
      status: 'Inactive',
      program: 'Engineering',
      yearLevel: '1st Year',
      gpa: '3.2',
      enrolledDate: '10/02/2023',
    ),
    Student(
      name: 'Floyd Miles',
      id: 'STU-2023-004',
      photoUrl:
          'https://as2.ftcdn.net/v2/jpg/02/24/86/95/1000_F_224869519_aRaeLneqALfPNBzg0xxMZXghtvBXkfIA.jpg',
      status: 'Active',
      program: 'Mathematics',
      yearLevel: '4th Year',
      gpa: '3.9',
      enrolledDate: '06/12/2020',
    ),
    Student(
      name: 'Georgia Young',
      id: 'STU-2023-005',
      photoUrl:
          'https://img.freepik.com/free-photo/pretty-smiling-joyfully-female-with-fair-hair-dressed-casually-looking-with-satisfaction_176420-15187.jpg',
      status: 'Suspended',
      program: 'Psychology',
      yearLevel: '2nd Year',
      gpa: '2.8',
      enrolledDate: '09/29/2022',
    ),
  ];

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
                    color: Color(0xFF111827),
                  ),
                ),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
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
          ),
          actions: [
            TextButton(
              child: const Text(
                'Close',
                style: TextStyle(color: Colors.indigo),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Active':
        return const Color(0xFF15803D);
      case 'Inactive':
        return const Color(0xFF8A551C);
      case 'Suspended':
        return const Color(0xFFB91C1C);
      default:
        return const Color(0xFF15803D);
    }
  }

  Color _getStatusBackgroundColor(String status) {
    switch (status) {
      case 'Active':
        return const Color(0xFFDCFCE7);
      case 'Inactive':
        return const Color(0xFFFEFCE8);
      case 'Suspended':
        return const Color(0xFFFEF2F2);
      default:
        return const Color(0xFFDCFCE7);
    }
  }

  Color _getStatusBorderColor(String status) {
    switch (status) {
      case 'Active':
        return const Color(0xFF15803D);
      case 'Inactive':
        return const Color(0xFFF4E7C5);
      case 'Suspended':
        return const Color(0xFFFBE0E0);
      default:
        return const Color(0xFF15803D);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(color: Color(0xFFE5E7EB), width: 1),
                ),
              ),
              child: const Text(
                'Student Registry',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFE5E7EB)),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      headingRowColor: MaterialStateProperty.all(
                        const Color(0xFFF9FAFB),
                      ),
                      columns: const [
                        DataColumn(label: Text('Student')),
                        DataColumn(label: Text('Status')),
                        DataColumn(label: Text('Program')),
                        DataColumn(label: Text('Year Level')),
                        DataColumn(label: Text('GPA')),
                        DataColumn(label: Text('Enrolled Date')),
                        DataColumn(label: Text('Actions')),
                      ],
                      rows:
                          students.map((student) {
                            return DataRow(
                              cells: [
                                DataCell(
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: student.isChecked,
                                        onChanged: (value) {
                                          setState(() {
                                            student.isChecked = value ?? false;
                                          });
                                        },
                                      ),
                                      const SizedBox(width: 8),
                                      CircleAvatar(
                                        radius: 24,
                                        backgroundImage: NetworkImage(
                                          student.photoUrl,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(student.name),
                                          Text(
                                            'ID: ${student.id}',
                                            style: const TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                DataCell(Text(student.status)),
                                DataCell(Text(student.program)),
                                DataCell(Text(student.yearLevel)),
                                DataCell(Text(student.gpa)),
                                DataCell(Text(student.enrolledDate)),
                                DataCell(
                                  ElevatedButton(
                                    onPressed:
                                        () => _showStudentDetails(student),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF6366F1),
                                    ),
                                    child: const Text('View'),
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
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
