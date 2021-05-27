// To parse this JSON data, do
//
//     final taskModel = taskModelFromJson(jsonString);

import 'dart:convert';

List<TaskModel> taskModelFromJson(String str) => List<TaskModel>.from(json.decode(str).map((x) => TaskModel.fromJson(x)));

String taskModelToJson(List<TaskModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TaskModel {
    TaskModel({
        this.taskName,
        this.taskStatus,
        this.taskLocation,
        this.taskType,
        this.startTime,
        this.finishByTime,
        this.checkList,
    });

    String taskName;
    int taskStatus;
    String taskLocation;
    String taskType;
    DateTime startTime;
    DateTime finishByTime;
    List<CheckList> checkList;

    factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        taskName: json["task_name"],
        taskStatus: json["task_status"],
        taskLocation: json["task_location"],
        taskType: json["task_type"],
        startTime: DateTime.parse(json["start_time"]),
        finishByTime: DateTime.parse(json["finishBy_time"]),
        checkList: List<CheckList>.from(json["check_list"].map((x) => CheckList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "task_name": taskName,
        "task_status": taskStatus,
        "task_location": taskLocation,
        "task_type": taskType,
        "start_time": startTime.toIso8601String(),
        "finishBy_time": finishByTime.toIso8601String(),
        "check_list": List<dynamic>.from(checkList.map((x) => x.toJson())),
    };
}

class CheckList {
    CheckList({
        this.name,
        this.items,
    });

    Name name;
    List<Item> items;

    factory CheckList.fromJson(Map<String, dynamic> json) => CheckList(
        name: nameValues.map[json["name"]],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": nameValues.reverse[name],
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class Item {
    Item({
        this.title,
        this.input,
    });

    String title;
    Input input;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        title: json["title"],
        input: inputValues.map[json["input"]],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "input": inputValues.reverse[input],
    };
}

enum Input { PHOTO, VIDEO, NUMBER, CHECKBOX }

final inputValues = EnumValues({
    "checkbox": Input.CHECKBOX,
    "number": Input.NUMBER,
    "photo": Input.PHOTO,
    "video": Input.VIDEO
});

enum Name { BEFORE_STARTING, MAIN_ROOM, FINISHING }

final nameValues = EnumValues({
    "Before starting": Name.BEFORE_STARTING,
    "Finishing": Name.FINISHING,
    "Main Room": Name.MAIN_ROOM
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
