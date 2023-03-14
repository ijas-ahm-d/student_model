import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:student/widgets/functions.dart';

class BottomSheets extends StatelessWidget {
  BottomSheets({super.key});
  final formkey = GlobalKey<FormState>();

  final photoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: 'Add students',
      child: const Icon(Icons.person_add),
      onPressed: () {
        showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Form(
                key: formkey,
                child: Padding(
                  padding: const EdgeInsets.all(
                    15,
                  ),
                  child: SafeArea(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 30,
                          ),
                          child: CircleAvatar(
                            radius: 80,
                            backgroundImage: AssetImage(
                              'images/profile.jpg',
                            ),
                          ),
                        ),
//NAME FIELD//
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: TextFormField(
                            controller: nameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter a Name';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  15,
                                ),
                              ),
                              labelText: 'Name of the Student',
                            ),
                          ),
                        ),
//AGE FIELD//
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                            bottom: 10,
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: ageController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter the Age';
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
//EMAIL FIELD//
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            validator: (email) {
                              if (email != null &&
                                  !EmailValidator.validate(email)) {
                                return 'please Enter a valid Email Address';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    15,
                                  ),
                                ),
                                labelText: 'Email address'),
                          ),
                        ),
//PHONENUMBER FIELD//
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: phoneNumberController,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value.length != 10) {
                                return 'please Enter a valid Phonenumber';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    15,
                                  ),
                                ),
                                prefixText: '+91',
                                prefixStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                                labelText: 'Phonenumber'),
                          ),
                        ),
                        ElevatedButton.icon(
                          icon: const Icon(Icons.how_to_reg),
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              addStudentButton(context);
                            }
                          },
                          label: const Text('Add Student Details'),
                        )
                      ],
                    ),
                  ),
                ),
              );
            });
      },
    );
  }
}
