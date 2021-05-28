import 'package:flutter/material.dart';
import 'package:tulu_project/constants/colors.dart';
import 'package:tulu_project/widgets/status_button.dart';
import 'package:tulu_project/widgets/task_item.dart';

import 'divider.dart';

class TaskCard extends StatelessWidget {
  final String taskName;
  final String taskLocation;
  final String taskDate;
  final String taskStartEndTime;
  final String timeForTask;
  final int taskStatus;
  TaskCard(
      {this.taskName,
      this.taskLocation,
      this.taskDate,
      this.taskStartEndTime,
      this.timeForTask,this.taskStatus});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.symmetric(vertical: 6.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  taskName,
                  style: TextStyle(
                      color: AppColors.darkNavyTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                StatusButton(taskStatus: taskStatus,)
              ],
            ),
          ),
          TaskDivider(),
          TaskItem(
            textColor: AppColors.greyTextColor,
            description: 'client name',
            icon: 'assets/icons/Client_small.png',
          ),
          TaskItem(
            textColor: AppColors.greyTextColor,
            description: '+09849839483948',
            icon: 'assets/icons/Phone_small.png',
          ),
          TaskDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TaskItem(
                  textColor: AppColors.greyTextColor,
                  description: taskLocation,
                  icon: 'assets/icons/Location_small.png',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: CircleAvatar(
                  radius: 22.0,
                  backgroundColor: AppColors.floatingButtonColor,
                  child: Image(
                    height: 18,
                    width: 18,
                    image: AssetImage('assets/icons/Map_enter_small.png'),
                  ),
                ),
              )
            ],
          ),
          TaskDivider(),
          TaskItem(
            textColor: AppColors.greyTextColor,
            description: taskDate,
            icon: 'assets/icons/Calendar_small.png',
          ),
          TaskItem(
            textColor: AppColors.darkNavyTextColor,
            description: 'Start: ' + taskStartEndTime,
            icon: 'assets/icons/Time_small.png',
          ),
          TaskItem(
              textColor: AppColors.greyTextColor,
              description: 'Time for Task: ' + timeForTask),
        ],
      ),
    );
  }
}
