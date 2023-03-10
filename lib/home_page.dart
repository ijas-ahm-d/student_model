import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student/bottom_sheet.dart';
import 'package:student/database/functions/data_base_function.dart';
import 'package:student/widgets/search.dart';
import 'package:student/widgets/students_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    Provider.of<StudentProvider>(context,listen: false).getAllStudents();
    // getAllStudents();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchWidget(),
              );
            },
            icon: const Icon(Icons.search),
            tooltip: 'Open search',
          )
        ],
      ),
      body: const ListStudents(),
      floatingActionButton: BottomSheets(),
    );
  }
}
