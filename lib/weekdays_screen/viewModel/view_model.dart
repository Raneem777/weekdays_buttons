import 'package:flutter/material.dart';
import '../reposatory/model/model.dart';

class DayViewModel with ChangeNotifier {
  final List<WeekDaysModel> days = WeekDaysModel.getWeekDays();



  void toggleDay(int index) {
    days[index].isSelected = !days[index].isSelected;
    notifyListeners();
  }
}
