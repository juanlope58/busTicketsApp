import 'package:bus_ticket_app/models/user.dart';

class UserState {
  static User? _currentUser;

  static User? get currentUser => _currentUser;

  static void setUser(User user) {
    _currentUser = user;
  }

  static void signOut() {
    _currentUser = null;
  }
}