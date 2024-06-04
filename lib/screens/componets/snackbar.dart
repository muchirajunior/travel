import 'package:flutter/material.dart';

showSnackbar(BuildContext context,{required String message}){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
    )
  );
}