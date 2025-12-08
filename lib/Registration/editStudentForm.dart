import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mwanafunziportal/Models/student.dart';

class EditStudent {
  static void showEditForm(
    BuildContext context,
    Student student, {
    required Function() onSave,
  }) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController(text: student.name);
    final idController = TextEditingController(text: student.id);
    final gpaController = TextEditingController(text: student.gpa);
    File? selectedImage;
    String? selectedStatus = student.status;
    String? selectedProgram = student.program;
    String? selectedYearLevel = student.yearLevel;
    DateTime enrolledDate = _parseDate(student.enrolledDate);
    bool isSubmitting = false;

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

    Future<void> pickImage(StateSetter setState) async {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() => selectedImage = File(pickedFile.path));
      }
    }

    Future<void> selectDate(BuildContext context, StateSetter setState) async {
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
        Navigator.pop(context);
        onSave(); // Trigger the parent widget to refresh
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
              title: Text(
                'Edit Student',
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              ),
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
                        onTap: () => pickImage(setState),
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
                      onTap: () => selectDate(context, setState),
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

  static DateTime _parseDate(String dateStr) {
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
}
