import 'package:flutter/material.dart';

class CustomSearchInput extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChange;
  final Function()? filter;
  const CustomSearchInput({super.key,required this.controller,this.onChange,this.filter});
 

  @override
  Widget build(BuildContext context) {
    return  Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: TextFormField(
          controller: controller,
          onChanged: onChange,
          decoration:  InputDecoration(
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            prefixIcon: const Icon(Icons.search),
            hintText: 'Search ..',
            suffixIcon:IconButton(onPressed: filter, icon: const Icon(Icons.tune))
          ),
        ),
      ),
    );
  }
}