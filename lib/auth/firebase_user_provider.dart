import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class GopayFirebaseUser {
  GopayFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

GopayFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<GopayFirebaseUser> gopayFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<GopayFirebaseUser>((user) => currentUser = GopayFirebaseUser(user));
