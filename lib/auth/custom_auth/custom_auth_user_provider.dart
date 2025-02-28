import 'package:rxdart/rxdart.dart';

import '/backend/schema/structs/index.dart';
import 'custom_auth_manager.dart';

class LynaAuthUser {
  LynaAuthUser({
    required this.loggedIn,
    this.uid,
    this.userData,
  });

  bool loggedIn;
  String? uid;
  UserDetailsStruct? userData;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<LynaAuthUser> lynaAuthUserSubject =
    BehaviorSubject.seeded(LynaAuthUser(loggedIn: false));
Stream<LynaAuthUser> lynaAuthUserStream() =>
    lynaAuthUserSubject.asBroadcastStream().map((user) => currentUser = user);
