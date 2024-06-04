import 'package:flutter/material.dart';

class CustomSearchInput extends StatelessWidget {
  final TextEditingController controller;
  final Function onChange;
  final bool showClearIcon;
  const CustomSearchInput({Key? key,required this.controller,required this.onChange,this.showClearIcon=false}) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
    return Card(
            margin: const EdgeInsets.fromLTRB(5,5,5,8),
            child: TextFormField(
              controller: controller,
              onChanged: (_)=>onChange(),
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: showClearIcon ? IconButton(
                  onPressed: (){
                    controller.clear();
                    onChange();
                  }, 
                  icon:const  Icon(Icons.clear)) : const SizedBox(),
                hintText: "search ...."
              ),
            ),
          );
  }
}