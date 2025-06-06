import 'dart:convert';

import 'package:travel/models/user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
 
class  Utils {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static Future<User> getLocalUser()async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    var user=jsonDecode(preferences.getString('user').toString());
    return User.fromJson(user);
  }

  static Future logout(BuildContext context)async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    preferences.clear();
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context,"/");
  }

  Future changeTheme({required String theme})async{}
}
