// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  loadData()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token=preferences.getString('token');
    await Future.delayed(const Duration(seconds: 4));
    if(token==null){
      Navigator.pushReplacementNamed(context, '/login');
    }else{
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body:  Container(
        width: double.infinity,
        height: double.infinity,
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage( Theme.of(context).brightness == Brightness.light ?  'assets/images/splash_light.png':'assets/images/splash_dark.png'), 
            fit: BoxFit.cover
          )
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
           Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: CircularProgressIndicator(),
           )
          ],
        ),
      )
    );
  }
}