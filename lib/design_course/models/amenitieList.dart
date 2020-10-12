import 'package:best_flutter_ui_templates/design_course/home_design_course.dart';
import 'package:best_flutter_ui_templates/fitness_app/fitness_app_home_screen.dart';
import 'package:best_flutter_ui_templates/hotel_booking/hotel_home_screen.dart';
import 'package:flutter/widgets.dart';

class AmenitieList {
  AmenitieList({
    this.validate,
    this.name = '',
  });

  int validate;
  String name;

  static List<AmenitieList> homeList = [
    AmenitieList(
      validate: 1,
      name: "冰箱",
    ),
    AmenitieList(
      validate: 1,
      name: "电视",
    ),
    AmenitieList(
      validate: 1,
      name: "空调",
    ),
    AmenitieList(
      validate: 1,
      name: "卫生间",
    ),
    AmenitieList(
      validate: 0,
      name: "衣柜",
    ),
    AmenitieList(
      validate: 0,
      name: "空调",
    ),
    AmenitieList(
      validate: 0,
      name: "燃气灶",
    ),
  ];
}
