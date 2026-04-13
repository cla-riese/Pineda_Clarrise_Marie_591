// import 'package:modelhandling/model/students.dart';

// class StudentController {
//   final List<Students> _students = [];

//   List<Students> getAllStudents() {
//     return List.unmodifiable(_students);
//   }

//   void addStudent(String id, String name, String course, double gpa) {
//     final student = Students(id: id, name: name, course: course, gpa: gpa);
//     _students.add(student);
//   }

//   Students? findById(String id) {
//     try {
//       return _students.firstWhere((s) => s.id == id);
//     } catch (e) {
//       return null; // Not found
//     }
//   }

//   bool deleteStudent(String id) {
//     final index = _students.indexWhere((s) => s.id == id);
//     if (index != -1) {
//       _students.removeAt(index);
//       return true;
//     }
//     return false;
//   }

//   // lib/controllers/student_controller.dart

// bool updateStudent(String id, String newName, String newCourse, double newGpa) {
//   final index = _students.indexWhere((s) => s.id == id);
//   if (index != -1) {
//     final updatedStudent = Students(
//       id: id,
//       name: newName,
//       course: newCourse,
//       gpa: newGpa,
//     );
//     _students[index] = updatedStudent;
//     return true;
//   }
//   return false;
// }


//   int getCount() {
//     return _students.length;
//   }
// }
