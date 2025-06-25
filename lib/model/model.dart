class WeekDaysModel {
  final String name;
  bool isSelected;

  WeekDaysModel({required this.name, this.isSelected = true});



  static List<WeekDaysModel> getWeekDays() {
    return [
      WeekDaysModel(name: 'Sunday'),
      WeekDaysModel(name: 'Monday'),
      WeekDaysModel(name: 'Tuesday'),
      WeekDaysModel(name: 'Wednesday'),
      WeekDaysModel(name: 'Thursday'),
      WeekDaysModel(name: 'Friday'),
      WeekDaysModel(name: 'Saturday'),
    ];
}
}
