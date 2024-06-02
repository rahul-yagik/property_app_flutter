import 'dart:convert';

// LOCAL
// import 'package:acres/data/users.dart';
// import 'package:acres/model/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:http/http.dart' as http;

class AuthNotifier extends StateNotifier<Map<String, bool>> {
  AuthNotifier() : super({'isLoggedin': false});

  Future<bool> isAuthenticated(String email, String password) async {
    try {
      final url = Uri.parse('http://172.16.73.20:5000/api/v1/properties/login');

      final response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode({'email': email, 'password': password}));

      final resBody = json.decode(response.body);

      if (resBody['token'] != null) {
        state = {...state, 'isLoggedin': true};
        return true;
      }

      return false;
    } catch (err) {
      print(err);
    }

    // FOR LOCAL DATA
    // User user = users.firstWhere((user) => user.email == email);
    // if (user.password == password) {
    //   state = {...state, 'isLoggedin': true};

    //   return true;
    // }

    return false;
  }

  void logout() {
    state = {...state, 'isLoggedin': false};
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, Map<String, bool>>(
    (ref) => AuthNotifier());
