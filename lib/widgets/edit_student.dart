import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student/database/functions/data_base_function.dart';
import '../database/data_model/student_model.dart';

class EditStudent extends StatelessWidget {
   EditStudent(
      {super.key,
      required this.name,
      required this.age,
      required this.email,
      required this.phone,
      required this.index});
  final String name;
  final String age;
  final String email;
  final String phone;
  final int index;

  editfnctn() {
    nameController.text = name;
    ageController.text = age;
    emailController.text = email;
    phoneController.text = phone;
  }

  final TextEditingController nameController = TextEditingController();

  final TextEditingController ageController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final formValidateKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    editfnctn();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Student'),
        centerTitle: true,
      ),
      body: Form(
        key: formValidateKey,
        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name is required';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: 'Name of Student'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: ageController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Age is required';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: 'Age'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    validator: (email) {
                      if (email != null && !EmailValidator.validate(email)) {
                        return 'Enter valid email';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: 'Email address'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: phoneController,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.length != 10) {
                        return 'Enter valid number';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        prefixText: '+91',
                        labelText: 'Phonenumber'),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (formValidateKey.currentState!.validate()) {
                        final value = StudentModel(
                            name: nameController.text,
                            age: ageController.text,
                            email: emailController.text,
                            phonenumber: phoneController.text);

                        Provider.of<StudentProvider>(context, listen: false)
                            .editStudent(index, value, context);
                        // editStudent(widget.index, value, context);
                      }
                    },
                    child: const Text('Edit Student details'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
