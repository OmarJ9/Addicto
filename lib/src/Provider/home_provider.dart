import 'dart:async';
import 'package:addicto/src/Models/challenge_model.dart';
import 'package:addicto/src/Widgets/myawesome_dialog.dart';
import 'package:flutter/widgets.dart';
import '../Utils/Services/hive_helper.dart';

class HomeProvider with ChangeNotifier {
  static int challengedays = 2;
  Timer? _timer;
  String _days = challengedays.toString().padLeft(2, '0');
  String _hours = "00";
  String _minutes = "00";
  String _seconds = "00";
  late Duration _countdownduration;
  late bool isrunning;
  late List<Challenge> challenges;

  Timer? get getTimer => _timer;
  String get days => _days;
  String get hours => _hours;
  String get minutes => _minutes;
  String get seconds => _seconds;
  Duration get countdownduration => _countdownduration;

  void init() {
    /* This bool is used so that the countdown can start automatically
     if it has already started */
    isrunning = HiveHelper.myprimitivebox.get('isrunning') ?? false;
    final date =
        DateTime.parse(HiveHelper.myprimitivebox.get('mydate').toString());
    challenges = HiveHelper.mychallengebox.values.toList().cast<Challenge>();

    // This is used so that the countdown keep working even if we closed the app.
    var remaining = date.difference(DateTime.now());

    if (isrunning) {
      _countdownduration =
          Duration(days: challengedays, seconds: remaining.inSeconds);
    } else {
      _countdownduration = Duration(days: challengedays);
    }
  }

  void startTimer(BuildContext context) {
    isrunning = true;
    _timer =
        Timer.periodic(const Duration(seconds: 1), (_) => coundown(context));
    notifyListeners();
  }

  void coundown(BuildContext context) {
    final seconds = _countdownduration.inSeconds - 1;
    if (seconds < 0) {
      _timer!.cancel();
      isrunning = false;
      HiveHelper().savePrimitives('isrunning', false);
      _countdownduration = Duration(days: challengedays);
      _days = _countdownduration.inDays.toString().padLeft(2, '0');
      Challenge challenge = Challenge(
          finisheddate: DateTime.now().toString(),
          challengedays: challengedays);
      HiveHelper().savechallenge(challenge);
      MyAwesomeDialog.buildawosomedialog(context, challengedays);
    } else {
      _countdownduration = Duration(seconds: seconds);
      // I used this method so the they can be written in two digits (02 instead of 2).
      _days = _countdownduration.inDays.toString().padLeft(2, '0');
      _hours =
          _countdownduration.inHours.remainder(24).toString().padLeft(2, '0');
      _minutes =
          _countdownduration.inMinutes.remainder(60).toString().padLeft(2, '0');
      _seconds =
          _countdownduration.inSeconds.remainder(60).toString().padLeft(2, '0');
    }

    notifyListeners();
  }

  void canceltimer() {
    _timer!.cancel();
    _countdownduration = Duration(days: challengedays);
    _days = challengedays.toString().padLeft(2, '0');
    _hours = "00";
    _minutes = "00";
    _seconds = "00";
    isrunning = false;
    notifyListeners();
  }

  void changechallengeday(int value) {
    challengedays = value;
    _countdownduration = Duration(days: challengedays);
    _days = challengedays.toString().padLeft(2, '0');
    notifyListeners();
  }
}
