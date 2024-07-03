import 'dart:convert';

import 'package:travel/screens/componets/snackbar.dart';
import 'package:travel/screens/componets/text_input.dart';
import 'package:travel/utils/requests.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool loading=false;
  var nameController= TextEditingController();
  var emailController= TextEditingController();
  var passwordController= TextEditingController();
  var repeatPasswordController= TextEditingController();
  var phoneController= TextEditingController();
  GlobalKey<FormState> formKey=GlobalKey<FormState>();
  
  Future submit()async{
    
    if(! formKey.currentState!.validate()){
      return;
    }
    if(passwordController.text != repeatPasswordController.text){
      showSnackbar(context, message: "password mismatch ..!");
      return;
    }

    Map data= {
      'name':nameController.text,
      "email":emailController.text,
      "password":passwordController.text,
      'password_confirmation':repeatPasswordController.text
    };
    print(jsonEncode(data));
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() => loading=true );
    var response=await ApiRequests.postRequest(route: '/register', body: data);
    print(response.body);
    if(!(response.statusCode == 200 || response.statusCode==201)){
      var result=jsonDecode(response.body);
      // ignore: use_build_context_synchronously
      showSnackbar(context, message: result['message']);
      setState(() => loading=false );
      return;
    }
    await ApiRequests.postRequest(route: "/login", body:data).then((response) {
      print(response.body);
      if(response.statusCode==200){
        showSnackbar(context, message:"registered your account successfully ...!");
        var result=jsonDecode(response.body);
        preferences.setString("token", result['access_token']);
        preferences.setString("user", jsonEncode(result['user']));
        Navigator.pushReplacementNamed(context, "/home");
      }else{
        var result=jsonDecode(response.body);
        showSnackbar(context, message: result['message']);
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
                      text: '\nWelcome here\n', 
                      style: TextStyle(fontSize: 23),
                      children: [
                        TextSpan(
                          text: 'Register your account to get started\n\n',
                          style: TextStyle(fontSize: 14)
                        )
                      ]
                    ),
                  ),
                  Image.asset('assets/images/user.png', width: 120,)
                ],
              ),
              const SizedBox(height:30,),
              CustomTextInput(controller: nameController, title: "name", icon: const Icon(Icons.person), inputType: TextInputType.name,),
              CustomTextInput(controller: emailController, title: "email", icon: const Icon(Icons.mail), inputType: TextInputType.emailAddress,),
              CustomTextInput(controller: passwordController, title: "password", icon: const Icon(Icons.lock),isPassword: true,),
              CustomTextInput(controller: repeatPasswordController, title: "repeat password", icon: const Icon(Icons.lock),isPassword: true,),
              // CustomTextInput(controller: phoneController, title: "phone", icon: const Icon(Icons.lock),inputType: TextInputType.phone,),            
              const SizedBox(height: 10,),
              loading ? const Center(child: CircularProgressIndicator(),) : FilledButton(onPressed: submit, child: const Text("Submit")),
              const SizedBox(height: 20,),
             InkWell(
                onTap: () => Navigator.pushReplacementNamed(context, '/login'),
                child: const Center(
                  child:  Text.rich(
                    TextSpan(
                      text: 'Already have an account?',
                      children: [
                        TextSpan(
                          text: '   Login',
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