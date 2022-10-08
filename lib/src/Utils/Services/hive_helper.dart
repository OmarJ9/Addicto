import 'package:hive_flutter/hive_flutter.dart';

import '../../Models/challenge_model.dart';

class HiveHelper {
  static Box myprimitivebox = Hive.box('primitiveBox');
  static Box mychallengebox = Hive.box('challengeBox');

  savePrimitives(String key, dynamic value) async {
    await myprimitivebox.put(key, value);
  }

  savechallenge(Challenge challenge) async {
    await mychallengebox.add(challenge);
  }
}
