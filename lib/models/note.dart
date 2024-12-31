import 'package:hive/hive.dart';

part 'note.g.dart';

@HiveType(typeId: 0)
class Note extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String subTitle;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final double colorRedValue;
  @HiveField(4)
  final double colorGreenValue;
  @HiveField(5)
  final double colorBlueValue;

  Note({
    required this.title,
    required this.subTitle,
    required this.date,
    required this.colorRedValue,
    required this.colorGreenValue,
    required this.colorBlueValue,
  });
}
