import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

Future<String> getUserName() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('user_name') ?? "User Name";
}

void setUserName(String userName) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('user_name', userName);
}

Future<User> getUserInfo() async {
  final prefs = await SharedPreferences.getInstance();

  final userId = prefs.getString('user_id') ?? _generateUserId();
  await prefs.setString('user_id', userId);

  final userName = prefs.getString('user_name') ?? "User Name";

  return User(userId: userId, userName: userName);
}

String _generateUserId() {
  // Define characters to use in the user ID
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';

  // Random number generator
  final random = Random();

  // Generate a random user ID of length 12
  String userId = '';
  for (int i = 0; i < 12; i++) {
    userId += chars[random.nextInt(chars.length)];
  }

  return userId;
}

class User {
  const User({required this.userId, required this.userName});

  final String userId;
  final String userName;
}
