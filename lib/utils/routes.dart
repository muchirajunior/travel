import 'package:travel/screens/auth/login.dart';
import 'package:travel/screens/auth/register.dart';
import 'package:travel/screens/home/home.dart';
import 'package:travel/screens/splash/spash_screen.dart';
import 'package:travel/screens/profile/profile_screen.dart';

var routes={
  "/":(_)=>const  SplashScreen(),
  "/home":(_)=>const Home(),
  '/login':(_)=>const Login(),
  '/register':(_)=>const Register(),
  '/profile':(_)=>const ProfileScreen()
};