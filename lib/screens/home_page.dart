import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tulu_project/constants/colors.dart';
import 'package:tulu_project/models/task_model.dart';
import 'package:tulu_project/widgets/app_bar.dart';
import 'package:tulu_project/widgets/check_list_card.dart';
import 'package:tulu_project/widgets/task_card.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    fetchAlbum();
    // TODO: implement initState
    super.initState();
  }

  var taskList = List<TaskModel>();

  Future<List<TaskModel>> fetchAlbum() async {
    final response =
        await http.get(Uri.parse('http://papi.wipehero.com/task.json'));

    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      taskList = list.map((model) => TaskModel.fromJson(model)).toList();

      print('-------------' + taskList.toString());
      return taskList;

      // return jsonDecode(response.body);
    } else {
      throw Exception();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: myAppBar(),
        body: Container(
          padding: const EdgeInsets.only(top: 28.0, left: 12.0, right: 12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (c, i) {
                    return Column(
                      children: [
                        TaskCard(
                          taskName: taskList[i].taskName.toString(),
                          taskLocation: taskList[i].taskLocation.toString(),
                          taskDate: taskList[i].startTime.toString(),
                          taskStartEndTime: taskList[i].startTime.toString() +
                              '--' +
                              taskList[i].finishByTime.toString(),
                          timeForTask: '====',
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (c, j) {
                            return CheckListCard(
                              checkListName:
                                  taskList[i].checkList[j].name.toString(),
                              input: taskList[i]
                                  .checkList[j]
                                  .items[j]
                                  .input
                                  .toString(),
                              title: taskList[i]
                                  .checkList[j]
                                  .items[j]
                                  .title
                                  .toString(),
                            );
                          },
                          itemCount: taskList[i].checkList.length,
                        )
                      ],
                    );
                  },
                  itemCount: taskList.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
