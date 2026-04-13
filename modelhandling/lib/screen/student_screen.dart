// import 'package:flutter/material.dart';
// import 'package:modelhandling/controller/student_controller.dart';
// import 'package:modelhandling/model/students.dart';


// class StudentScreen extends StatefulWidget {
//   const StudentScreen({super.key});

//   @override
//   State<StudentScreen> createState() => _StudentScreenState();
// }

// class _StudentScreenState extends State<StudentScreen> {
//   final StudentController _controller = StudentController();

//   final TextEditingController _idController = TextEditingController();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _courseController = TextEditingController();
//   final TextEditingController _gpaController = TextEditingController();
//   final TextEditingController _searchController = TextEditingController();

//   void _showMessage(String msg) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(msg),
//         backgroundColor: Colors.blueAccent, 
//       ),
//     );
//   }

//   void _addStudent() {
//     final id = _idController.text.trim();
//     final name = _nameController.text.trim();
//     final course = _courseController.text.trim();
//     final gpa = double.tryParse(_gpaController.text.trim()) ?? 0.0;

//     if (id.isEmpty || name.isEmpty || course.isEmpty) {
//       _showMessage('Please fill in all fields.');
//       return;
//     }

//     setState(() {
//       _controller.addStudent(id, name, course, gpa);
//     });

//     _idController.clear();
//     _nameController.clear();
//     _courseController.clear();
//     _gpaController.clear();
//     _showMessage('Student added successfully!');
//   }

//   void _findStudent() {
//     final id = _searchController.text.trim();
//     final student = _controller.findById(id);

//     if (student == null) {
//       _showMessage('No student found with ID: $id');
//       return;
//     }

//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: const Text('Student Found'),
//         content: Text(
//           'Name: ${student.name}\n'
//           'Course: ${student.course}\n'
//           'GPA: ${student.gpa}',
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Close'),
//           )
//         ],
//       ),
//     );
//   }

//   void _deleteStudent(String id) {
//     setState(() {
//       final success = _controller.deleteStudent(id);
//       _showMessage(success ? 'Student $id deleted.' : 'Delete failed.');
//     });
//   }

//   void _editStudent(Students student) {
//     final nameController = TextEditingController(text: student.name);
//     final courseController = TextEditingController(text: student.course);
//     final gpaController = TextEditingController(text: student.gpa.toString());

//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: const Text('Edit Student'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextField(
//               controller: nameController,
//               decoration: const InputDecoration(labelText: 'Name'),
//             ),
//             TextField(
//               controller: courseController,
//               decoration: const InputDecoration(labelText: 'Course'),
//             ),
//             TextField(
//               controller: gpaController,
//               decoration: const InputDecoration(labelText: 'GPA'),
//               keyboardType: TextInputType.number,
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Cancel'),
//           ),
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
//             onPressed: () {
//               final newName = nameController.text.trim();
//               final newCourse = courseController.text.trim();
//               final newGpa =
//                   double.tryParse(gpaController.text.trim()) ?? student.gpa;

//               final success = _controller.updateStudent(
//                   student.id, newName, newCourse, newGpa);

//               if (success) {
//                 setState(() {});
//                 _showMessage('Student updated successfully!');
//               } else {
//                 _showMessage('Update failed.');
//               }

//               Navigator.pop(context);
//             },
//             child: const Text('Save'),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final students = _controller.getAllStudents();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Student Manager'),
//         backgroundColor: const Color.fromARGB(255, 184, 155, 235), 
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.white, Color.fromARGB(255, 200, 144, 233)],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               TextField(
//                 controller: _idController,
//                 decoration: const InputDecoration(
//                   labelText: 'ID',
//                   border: OutlineInputBorder(),
//                   filled: true,
//                   fillColor: Colors.white,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               TextField(
//                 controller: _nameController,
//                 decoration: const InputDecoration(
//                   labelText: 'Name',
//                   border: OutlineInputBorder(),
//                   filled: true,
//                   fillColor: Colors.white,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               TextField(
//                 controller: _courseController,
//                 decoration: const InputDecoration(
//                   labelText: 'Course',
//                   border: OutlineInputBorder(),
//                   filled: true,
//                   fillColor: Colors.white,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               TextField(
//                 controller: _gpaController,
//                 decoration: const InputDecoration(
//                   labelText: 'GPA',
//                   border: OutlineInputBorder(),
//                   filled: true,
//                   fillColor: Colors.white,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: _addStudent,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 186, 148, 250),
//                 ),
//                 child: const Text('Add Student'),
//               ),
//               const Divider(),
//               TextField(
//                 controller: _searchController,
//                 decoration: const InputDecoration(
//                   labelText: 'Search by ID',
//                   border: OutlineInputBorder(),
//                   filled: true,
//                   fillColor: Colors.white,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: _findStudent,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 186, 148, 250),
//                 ),
//                 child: const Text('Find Student'),
//               ),
//               const Divider(),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: students.length,
//                   itemBuilder: (context, index) {
//                     final student = students[index];
//                     return Card(
//                       color: Colors.white,
//                       elevation: 4,
//                       margin: const EdgeInsets.symmetric(vertical: 6),
//                       child: ListTile(
//                         title: Text(
//                           student.name,
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.deepPurple,
//                           ),
//                         ),
//                         subtitle: Text(
//                           '${student.course} - GPA: ${student.gpa}',
//                           style: const TextStyle(color: Colors.black54),
//                         ),
//                         trailing: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             IconButton(
//                               icon: const Icon(Icons.edit, color: Color.fromARGB(255, 163, 69, 226)),
//                               onPressed: () => _editStudent(student),
//                             ),
//                             IconButton(
//                               icon: const Icon(Icons.delete, color: Color.fromARGB(255, 163, 69, 226)),
//                               onPressed: () => _deleteStudent(student.id),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
