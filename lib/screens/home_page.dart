import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tulu_project/blocs/task_bloc/task_bloc.dart';
import 'package:tulu_project/blocs/task_bloc/task_state.dart';
import 'package:tulu_project/constants/colors.dart';
import 'package:tulu_project/widgets/app_bar.dart';
import 'package:tulu_project/widgets/check_list_card.dart';
import 'package:tulu_project/widgets/check_list_item.dart';
import 'package:tulu_project/widgets/task_card.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TaskBloc>(context).taskGetData();
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: myAppBar(),
        body: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            if (state is TaskCompletedState) {
              return Container(
                padding:
                    const EdgeInsets.only(top: 28.0, left: 12.0, right: 12.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (c, i) {
                          String date = DateFormat.yMMMMd()
                              .format(state.taskList[i].startTime);
                          String startTime = DateFormat.Hm()
                              .format(state.taskList[i].startTime);
                          String finishedTime = DateFormat.Hm()
                              .format(state.taskList[i].finishByTime);
                          final difference = state.taskList[i].finishByTime
                              .difference(state.taskList[i].startTime)
                              .inMinutes;
                          return Column(
                            children: [
                              TaskCard(
                                taskName: state.taskList[i].taskName.toString(),
                                taskLocation:
                                    state.taskList[i].taskLocation.toString(),
                                taskDate: date,
                                taskStartEndTime:
                                    startTime + ' - ' + finishedTime,
                                timeForTask: difference.toString() + ' minutes',
                                taskStatus:  state.taskList[i].taskStatus,
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              CheckListCard(
                                listview: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (c, j) {
                                    return CheckListItem(
                                      checkListName: state
                                          .taskList[i].checkList[j].name
                                          .toString()
                                          .split('.')
                                          .last,
                                      input: state.taskList[i].checkList[j]
                                          .items[j].input
                                          .toString()
                                          .split('.')
                                          .last,
                                      title: state.taskList[i].checkList[j]
                                          .items[j].title
                                          .toString(),
                                    );
                                  },
                                  itemCount: state.taskList[i].checkList.length,
                                ),
                              ),
                              SizedBox(
                                height: 32.0,
                              )
                            ],
                          );
                        },
                        itemCount: state.taskList.length,
                      ),
                    ],
                  ),
                ),
              );
            }
            if (state is TaskInProgressState) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.darkNavyTextColor),
                ),
              );
            } else {
              return Center(child: Text('something went wrong'));
            }
          },
        ),
      ),
    );
  }
}
