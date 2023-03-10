import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student/home_page.dart';
import 'package:student/widgets/single_info.dart';

import '../database/functions/data_base_function.dart';

class SearchWidget extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Consumer<StudentProvider>(builder: (context, studentList, child) {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          final data = studentList.studentsNotifier[index];
          if (data.name.toLowerCase().contains(
                query.toLowerCase(),
              )) {
            return Column(
              children: [
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) {
                          return const HomePage();
                        }),
                      ),
                    );
                  },
                  title: Text(data.name),
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage('images/profile.jpg'),
                  ),
                ),
                const Divider()
              ],
            );
          } else {
            return Container();
          }
        },
        itemCount: studentList.studentsNotifier.length,
      );
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Consumer<StudentProvider>(
     builder: (context, studentList, child) {
        return ListView.builder(
          itemBuilder: (ctx, index) {
            final data = studentList.studentsNotifier [index];
            if (data.name.toLowerCase().contains(query.toLowerCase())) {
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) {
                            return SingleInfo(data);
                          }),
                        ),
                      );
                    },
                    title: Text(data.name),
                    leading: const CircleAvatar(
                        backgroundImage: AssetImage('images/profile.jpg')),
                  ),
                  const Divider()
                ],
              );
            } else {
              return Container();
            }
          },
          itemCount: studentList.studentsNotifier. length,
        );
     },
      // builder: ((BuildContext context, List<StudentModel> studentList,
      //     Widget? child) {
       
      );}
  }

