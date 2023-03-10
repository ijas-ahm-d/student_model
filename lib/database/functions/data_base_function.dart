import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student/database/data_model/student_model.dart';
import 'package:student/widgets/functions.dart';

class StudentProvider with ChangeNotifier {
  final List<StudentModel> _studentsNotifier = [];

  List<StudentModel> get studentsNotifier => _studentsNotifier;

  void addStudent(StudentModel value) async {
    final studentDB = await Hive.openBox<StudentModel>('student_data_base');
    await studentDB.add(value);
    getAllStudents();
  }

  Future<void> getAllStudents() async {
    final studentDB = await Hive.openBox<StudentModel>('student_data_base');
    _studentsNotifier.clear();
    _studentsNotifier.addAll(studentDB.values);
   notifyListeners();
  }

  Future<void> deleteStudent(int id, ctx) async {
    final studentDB = await Hive.openBox<StudentModel>('student_data_base');
    await studentDB.deleteAt(id);
    getAllStudents();
    snackbar(ctx, 'Deleted succesfully');
    Navigator.pop(ctx);
  }

  Future<void> editStudent(index, value, ctx) async {
    final studentDB = await Hive.openBox<StudentModel>('student_data_base');
    await studentDB.putAt(index, value);
    getAllStudents();
    snackbar(ctx, 'Edited Succesfully');
    Navigator.pop(ctx);
  }
}
