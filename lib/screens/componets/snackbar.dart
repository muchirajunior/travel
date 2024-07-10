import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel/utils/utils.dart';

showSnackbar(BuildContext context,{required String message}){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
    )
  );
}

class CustomSnackbar{
  String message;
  bool error;
  CustomSnackbar({required this.message, this.error=false}){
    ScaffoldMessenger.of(Utils.navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        backgroundColor: error ? Colors.red.shade700 : Colors.indigo.shade700,
        showCloseIcon: true,
        content: InkWell(
          onTap: ()=> Clipboard.setData(ClipboardData(text: message)),
          child: Text(
            " 🔔  $message", 
            style: TextStyle(color: Colors.grey.shade200),
          ),
        ),
        behavior: SnackBarBehavior.floating,
      )
    );
  }
}