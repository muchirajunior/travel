import 'dart:convert';

import 'package:travel/screens/componets/snackbar.dart';
import 'package:travel/screens/componets/text_input.dart';
import 'package:travel/utils/requests.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool loading=false;
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  GlobalKey<FormState> formKey=GlobalKey<FormState>();

  Future submit()async{
    if(! formKey.currentState!.validate()){
      return;
    }
    Map data= {"email":emailController.text,"password":passwordController.text};
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() => loading=true );
    await ApiRequests.postRequest(route: "/login", body:data).then((response) {
      var result=jsonDecode(response.body);
      // print(response.body);
      if(response.statusCode==200){
        CustomSnackbar( message:"Login success ....!");
        
        preferences.setString("token", result['access_token']);
        preferences.setString("user", jsonEncode(result['user']));
        Navigator.pushReplacementNamed(context, "/home");
      }else{
        var result=jsonDecode(response.body);
        CustomSnackbar( message: result['message']);
      }     
    });
    setState(() => loading=false );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.all(10),
            children: [
              const SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text.rich(
                    TextSpan(
                      text: '\nWelcome back\n', 
                      style: TextStyle(fontSize: 23),
                      children: [
                        TextSpan(
                          text: 'Login to contnue with the app\n\n',
                          style: TextStyle(fontSize: 14)
                        )
                      ]
                    ),
                  ),
                  Image.asset('assets/images/user.png', width: 110,)
                ],
              ),
              const SizedBox(height: 40,),
              CustomTextInput(controller: emailController, title: "email", icon: const Icon(Icons.mail), inputType: TextInputType.emailAddress,),
              CustomTextInput(controller: passwordController, title: "password", icon: const Icon(Icons.lock),isPassword: true,),
              const Padding(
                padding:  EdgeInsets.all(8.0),
                child: Text('Forgot Password?', textAlign: TextAlign.right,),
              ),
              const SizedBox(height: 20,),
              loading ? const Center(child: CircularProgressIndicator(),) : FilledButton(onPressed: submit, child: const Text("Submit")),
              const SizedBox(height: 10,),
              InkWell(
                onTap: () => Navigator.pushReplacementNamed(context, '/register'),
                child: const Center(
                  child:  Text.rich(
                    TextSpan(
                      text: 'Dont have an account?',
                      children: [
                        TextSpan(
                          text: '   Register',
                          style: TextStyle(fontSize: 18, color: Colors.orange)
                        )
                      ]
                    )
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}