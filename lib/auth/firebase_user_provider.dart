import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class FluencerFirebaseUser {
  FluencerFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

FluencerFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<FluencerFirebaseUser> fluencerFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<FluencerFirebaseUser>(
            (user) => currentUser = FluencerFirebaseUser(user));
