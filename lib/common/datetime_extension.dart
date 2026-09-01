import 'package:intl/intl.dart';

extension DatetimeExtension on DateTime {
  String get formattedDate => DateFormat('yyyy년 MM월 dd일').format(this);
}