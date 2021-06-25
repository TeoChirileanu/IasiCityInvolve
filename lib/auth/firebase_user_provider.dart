import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class IasiCityInvolveFirebaseUser {
  IasiCityInvolveFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

IasiCityInvolveFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<IasiCityInvolveFirebaseUser> iasiCityInvolveFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<IasiCityInvolveFirebaseUser>(
            (user) => currentUser = IasiCityInvolveFirebaseUser(user));
