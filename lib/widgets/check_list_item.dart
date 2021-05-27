import 'package:flutter/material.dart';
import 'package:tulu_project/constants/colors.dart';

class CheckListItem extends StatelessWidget {
  final String checkListName;
  final String title;
  final String input;
  CheckListItem({this.checkListName, this.input, this.title});
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          accentColor: AppColors.darkNavyTextColor,
          unselectedWidgetColor: AppColors.darkNavyTextColor),
      child: Container(
        height: 100,
        child: ListView(
          shrinkWrap: true,
          children: [
            ExpansionTile(
              trailing: SizedBox.shrink(),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    checkListName,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.darkNavyTextColor),
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
                ListTile(title: Text(title)),
                ListTile(
                  title: Text(input),
                ),
                Divider(
                  thickness: 3,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
