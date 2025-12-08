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
