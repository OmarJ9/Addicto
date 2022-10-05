import 'package:hive_flutter/hive_flutter.dart';
part 'challenge_model.g.dart';

@HiveType(typeId: 0)
class Challenge extends HiveObject {
  @HiveField(0)
  final String finisheddate;
  @HiveField(1)
  final int challengedays;

  Challenge({required this.finisheddate, required this.challengedays});
}
