import 'package:modelhandling/model/student.dart';

class StudentService{
  Future<List<Student>> fetchStudents() async{
    await Future.delayed(const Duration(seconds: 2));

    final rawData=[
      {'id': '1', 'name': "Ei", 'age': 19, 'gpa':1.25},
      {'id': '2', 'name': "Bina", 'age': 20, 'gpa':1.50},
      {'id': '3', 'name': "Miko", 'age': 19, 'gpa':1.25},
    ];
    
    return rawData.map((data) => Student.fromMap(data)).toList();
  }
}