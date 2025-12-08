class Student {
  String id;
  String name;
  String photoUrl;
  String status;
  String program;
  String yearLevel;
  String gpa;
  String enrolledDate;
  bool isChecked;

  Student({
    required this.id,
    required this.name,
    required this.photoUrl,
    required this.status,
    required this.program,
    required this.yearLevel,
    required this.gpa,
    required this.enrolledDate,
    this.isChecked = false,
  });

  // Create a copy with modifications
  Student copyWith({
    String? id,
    String? name,
    String? photoUrl,
    String? status,
    String? program,
    String? yearLevel,
    String? gpa,
    String? enrolledDate,
    bool? isChecked,
  }) {
    return Student(
      id: id ?? this.id,
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
      status: status ?? this.status,
      program: program ?? this.program,
      yearLevel: yearLevel ?? this.yearLevel,
      gpa: gpa ?? this.gpa,
      enrolledDate: enrolledDate ?? this.enrolledDate,
      isChecked: isChecked ?? this.isChecked,
    );
  }
}

List<Student> students = [
  Student(
    name: 'Atuganile Silimuntu',
    id: 'STU-2023-001',
    photoUrl:
        'https://images.unsplash.com/photo-1546525848-3ce03ca516f6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8YmxhY2slMjBzdHVkZW50fGVufDB8fDB8fHww&auto=format&fit=crop&q=60&w=600',
    status: 'Active',
    program: 'Water Engineering',
    yearLevel: '3rd Year',
    gpa: '3.8',
    enrolledDate: '09/08/2021',
  ),
  Student(
    name: 'Mzimba Chirwa',
    id: 'STU-2023-003',
    photoUrl:
        'https://plus.unsplash.com/premium_photo-1667520263477-0af7d9c33d67?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8YmxhY2slMjBzdHVkZW50fGVufDB8fDB8fHww&auto=format&fit=crop&q=60&w=600',
    status: 'Active',
    program: 'Forensic Science',
    yearLevel: '2nd Year',
    gpa: '3.5',
    enrolledDate: '03/13/2022',
  ),
  Student(
    name: 'Ananieli Mosha',
    id: 'STU-2023-004',
    photoUrl:
        'https://plus.unsplash.com/premium_photo-1682089892133-556bde898f2c?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8c3R1ZGVudCUyMHByb2ZpbGUlMjBwaG90b3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&q=60&w=600',
    status: 'Active',
    program: 'Computer Science',
    yearLevel: '3rd Year',
    gpa: '3.8',
    enrolledDate: '09/08/2021',
  ),
  Student(
    name: 'Mpoki Mambale',
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
