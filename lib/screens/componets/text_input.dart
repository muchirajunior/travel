import 'package:flutter/material.dart';

class CustomTextInput extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final bool isPassword;
  final Icon? icon;
  final TextInputType inputType;
  final bool required;
  const CustomTextInput({super.key, required this.controller,required this.title,this.isPassword=false,this.icon, this.inputType=TextInputType.text,this.required=true});

  @override
  State<CustomTextInput> createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  bool hidePass=false;
  @override
  void initState() {
    if(widget.isPassword){
      setState(() => hidePass=true );
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField( 
        controller: widget.controller,
        keyboardType: widget.inputType,
        obscureText: hidePass,
        decoration: InputDecoration(
          labelText: widget.title.toUpperCase(),
          prefixIcon: widget.icon ?? const SizedBox( width: 0,),
          contentPadding: const EdgeInsets.all(15),
          suffixIcon: widget.isPassword ? IconButton(
            onPressed: ()=>setState(()=> hidePass = !hidePass ),
             icon: hidePass ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility) 
          ) :const SizedBox(),
          hintText: "enter ${widget.title}",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
          )
        ),
        validator: (value){
          if(value!.isEmpty && widget.required){
            return "this field is required";
          }else if(value.length<4 && widget.required){
            return "too short ${widget.title}";
          }else if(widget.inputType == TextInputType.emailAddress && !(value.toString().contains("@") && value.toString().contains('.'))){
            return "enter valid email address";
          }else if(widget.inputType == TextInputType.phone && value.length<10){
            return "too short phone number";
          } else{
            return null;
          }
        },
      ),
    );
  }
}