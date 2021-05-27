import 'package:flutter/material.dart';
import 'package:tulu_project/constants/colors.dart';
import 'package:tulu_project/widgets/task_item.dart';

class TaskCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('sanitazion'),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.widgetsColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Accepted',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            Divider(
              color: AppColors.dividerColor,
              thickness: 2,
            ),
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
            Divider(
              color: AppColors.dividerColor,
              thickness: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TaskItem(
                  textColor: AppColors.greyTextColor,
                  description: 'tehran iran',
                  icon: 'assets/icons/Location_small.png',
                ),
                CircleAvatar(
                  radius: 22.0,
                  backgroundColor: AppColors.floatingButtonColor,
                  child: Image(
                    height: 18,
                    width: 18,
                    image: AssetImage('assets/icons/Map_enter_small.png'),
                  ),
                )
              ],
            ),
            Divider(
              color: AppColors.dividerColor,
              thickness: 2,
            ),
            TaskItem(
              textColor: AppColors.greyTextColor,
              description: 'wed 12 2021',
              icon: 'assets/icons/Calendar_small.png',
            ),
            TaskItem(
              textColor: AppColors.darkNavyTextColor,
              description: 'start:12:00  -  23:00',
              icon: 'assets/icons/Time_small.png',
            ),
            TaskItem(
              textColor: AppColors.greyTextColor,
              description: 'start at: 3 hours ',
            ),
          ],
        ),
      ),
    );
  }
}
