import 'package:flutter/material.dart';
import 'package:tulu_project/constants/colors.dart';

class StatusButton extends StatelessWidget {
  final int taskStatus;
  StatusButton({this.taskStatus});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: taskStatus == 0
            ? MaterialStateProperty.all(AppColors.widgetsColor)
            : MaterialStateProperty.all(AppColors.yellowColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
        ),
      ),
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Text(
          taskStatus == 0 ? 'Accepted' : 'Assigned',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
