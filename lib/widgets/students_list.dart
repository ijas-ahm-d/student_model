import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student/database/functions/data_base_function.dart';
import 'package:student/widgets/edit_student.dart';
import 'package:student/widgets/single_info.dart';

class ListStudents extends StatelessWidget {
  const ListStudents({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StudentProvider>(
      builder: (context, studentList, child) {
        return ListView.builder(
          itemBuilder: ((context, index) {
            final data = studentList.studentsNotifier[index];
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              // -----ListTile----- //
              child: ListTile(
                tileColor: Colors.black26,
                title: Text(data.name),
                onTap: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SingleInfo(data),
                    ),
                  );
                }),
                leading: const CircleAvatar(
                  backgroundImage: AssetImage(
                    'images/profile.jpg',
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => EditStudent(
                                      name: data.name,
                                      age: data.age,
                                      email: data.email,
                                      phone: data.phonenumber,
                                      index: index))));
                        },
                        icon: const Icon(Icons.edit)),
                    IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        deleteStudentInfo(index, context);
                      },
                    ),
                  ],
                ),
              ),
            );
          }),
          itemCount: studentList.studentsNotifier.length,
        );
      },
    );
  }

  void deleteStudentInfo(index, ctx) {
    showDialog(
      context: ctx,
      builder: ((ctx1) {
        return AlertDialog(
          title: const Text('Delete'),
          content: const Text('Do You want to delete.?'),
          actions: [
            TextButton(
                onPressed: () {
                  Provider.of<StudentProvider>(ctx1, listen: false)
                      .deleteStudent(index, ctx1);
                },
                child: const Text('Yes')),
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx1);
                },
                child: const Text('No')),
          ],
        );
      }),
    );
  }
}
