import 'package:flutter/material.dart';
import 'package:modelhandling/controller/user_contoller.dart';
import 'package:modelhandling/model/user_model.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final controller = UserController();
  List<User> users = [];
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  void loadusers() async {
    final usersdata = await controller.getUsers();
    setState(() {
      users = usersdata;
    });
  }

  // add user

  void adduser() async {
    if(nameController.text.isEmpty || emailController.text.isEmpty) {
      return;
    }
    final userdata = User(
      name: nameController.text, 
      email: emailController.text);
      await controller.addUser(userdata);
      nameController.clear();
      emailController.clear();
      loadusers();
  }

  void deleteuser(int id) async {
    await controller.deleteUser(id);
    loadusers();
  }

  @override
  void initState() {
    super.initState();
    loadusers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column( 
        children: [
          TextField(controller: nameController, decoration: InputDecoration(labelText: 'Name'),),
          TextField(controller: emailController, decoration: InputDecoration(labelText: 'Email'),),
          ElevatedButton(onPressed: () {
            adduser();
          }, 
          child: Text("Add User"),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final listuser = users[index];
                return ListTile(
                  title: Text(listuser.name),
                  subtitle: Text(listuser.email),
                  trailing: IconButton(onPressed: () {
                    deleteuser( listuser.id!);
                    }, 
                    icon: Icon(Icons.delete),
                    ),
                );
              },
            ),
            ),
        ],
      )
    );
  }
}