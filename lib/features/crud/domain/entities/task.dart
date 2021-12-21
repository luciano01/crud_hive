import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Task {
  @HiveField(0)
  String? name;

  @HiveField(1)
  bool isCompleted;

  @HiveField(2)
  String? date;

  @HiveField(3)
  String? time;

  Task({
    this.name,
    this.isCompleted = false,
    this.date,
    this.time,
  });

  Task copyWith({
    String? name,
    bool? isCompleted,
    String? date,
    String? time,
  }) =>
      Task(
        name: name ?? this.name,
        isCompleted: isCompleted ?? this.isCompleted,
        date: date ?? this.date,
        time: time ?? this.time,
      );
}
