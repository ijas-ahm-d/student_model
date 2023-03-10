import 'package:flutter/material.dart';
import 'package:student/database/data_model/student_model.dart';
class SingleInfo extends StatelessWidget {
  final StudentModel data;
  const SingleInfo(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    List details = [data.name, data.age, data.email, data.phonenumber];
    List info = ['Name: ', 'age: ', 'Email: ', 'Phone: '];
    return Scaffold(
        appBar: AppBar(
          title: Text('${data.name} Details'),
        ),
        body:        
            ListView.separated(
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(info[index],
                            style:const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,),
                               ),
                            Text(details[index],
                            style:const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                               ),
                          ],
                        )
                      ],
                    ),
                  );
                }),
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: 4),        
    );
  }
}
