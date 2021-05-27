import 'package:flutter/material.dart';
import 'package:tulu_project/constants/colors.dart';


class CheckListItem extends StatelessWidget {
  final String checkListName;
  final String title;
  final String input;
  final int itemCount;
  CheckListItem({this.checkListName, this.input, this.title, this.itemCount});
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          accentColor: AppColors.darkNavyTextColor,
          unselectedWidgetColor: AppColors.darkNavyTextColor),
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          ExpansionTile(
            trailing: SizedBox.shrink(),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  checkListName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkNavyTextColor,
                      fontSize: 14),
                ),
                SizedBox(
                  width: 4.0,
                ),
                Icon(
                  Icons.keyboard_arrow_up,
                  color: AppColors.darkNavyTextColor,
                  size: 16,
                )
              ],
            ),
            children: [
              ListTile(
                title: Text(
                  title,
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff001037),
                      fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                title: Text(
                  input,
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff001037),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
