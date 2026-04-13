class Students {
  final String id;
  final String name;
  final String course;
  final double gpa;

  Students({
    required this.id,
    required this.name,
    required this.course,
    required this.gpa,
  });

  @override
  String toString() {
    return 'Student{id: $id, name: $name, course: $course, gpa: $gpa}';
  }
}
