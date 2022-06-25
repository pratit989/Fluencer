import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class FluncerFirebaseUser {
  FluncerFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

FluncerFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<FluncerFirebaseUser> fluncerFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<FluncerFirebaseUser>(
        (user) => currentUser = FluncerFirebaseUser(user));
