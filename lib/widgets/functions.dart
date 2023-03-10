import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student/database/functions/data_base_function.dart';
import '../database/data_model/student_model.dart';

final nameController = TextEditingController();

final ageController = TextEditingController();

final emailController = TextEditingController();

final phoneNumberController = TextEditingController();

Future<void> addStudentButton(BuildContext context) async {
  final name = nameController.text;
  final age = ageController.text;
  final email = emailController.text;
  final phoneNumber = phoneNumberController.text;

  final student = StudentModel(
      name: name, age: age, email: email, phonenumber: phoneNumber);

  Provider.of<StudentProvider>(
    context,
    listen: false,
  ).addStudent(student);
  // addStudent(student);
  snackbar(context, 'Student added succesfully');
  nameController.clear();
  ageController.clear();
  emailController.clear();
  phoneNumberController.clear();

  Navigator.pop(context);
}

void snackbar(context, message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.green,
    margin: const EdgeInsets.all(10),
    duration: const Duration(seconds: 3),
    content: Text(message),
  ));
}
