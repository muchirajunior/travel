import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ApiRequests{

  static String baseURL="https://dev.travel.co/api/v1";

  static Future<bool> isConnectedToNetwork()async{
    var connectivity = await Connectivity().checkConnectivity();
    if(connectivity.isEmpty){return false;}
    final ConnectivityResult connectivityResult=connectivity.first;
     if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  static Future<Response> getRequest({required String route})async{
    if(! await isConnectedToNetwork()){
      return Response(jsonEncode({'message':"network error,please check your internet connection."}), 400);
    }
    SharedPreferences preferences= await SharedPreferences.getInstance();
    var token= preferences.getString('token');
    var response= await get(
      Uri.parse(baseURL+route),
      headers: {
        "Authorization":token.toString()
      }
    );
    if(response.body.contains('DOCTYPE html')){
      print(response.body);
      return Response(jsonEncode({'message':"a server error occurred..!"}), response.statusCode);
    }
    return response;
  }

  static Future<Response> postRequest({required String route,required Map body})async{
    if(! await isConnectedToNetwork()){
      return Response(jsonEncode({'message':"network error,please check your internet connection."}), 400);
    }
    SharedPreferences preferences= await SharedPreferences.getInstance();
    var token= preferences.getString('token');
    var response= await post(
      Uri.parse(baseURL+route),
      headers: {
        'X-Requested-With': 'XMLHttpRequest',
        "Content-Type":"application/json",
        "Authorization":"Bearer $token",
      },
      body: jsonEncode(body)
    );
     if(response.body.contains('DOCTYPE html')){
      print(response.body);
      return Response(jsonEncode({'message':"a server error occurred..!"}), response.statusCode);
    }
    return response;
  }

  static Future<Response> putRequest({required String route,required Map body})async{
    if(! await isConnectedToNetwork()){
      return Response(jsonEncode({'message':"network error,please check your internet connection."}), 400);
    }
    SharedPreferences preferences= await SharedPreferences.getInstance();
    var token= preferences.getString('token');
    var response= await put(
      Uri.parse(baseURL+route),
      headers: {
        'X-Requested-With': 'XMLHttpRequest',
        "Content-Type":"application/json",
        "Authorization":"Bearer $token",
      },
      body: jsonEncode(body)
    );
     if(response.body.contains('DOCTYPE html')){
      print(response.body);
      return Response(jsonEncode({'message':"a server error occurred..!"}), response.statusCode);
    }
    return response;
  }

   static Future<Response> deleteRequest({required String route})async{
    if(! await isConnectedToNetwork()){
      return Response(jsonEncode({'message':"network error,please check your internet connection."}), 400);
    }
    SharedPreferences preferences= await SharedPreferences.getInstance();
    var token= preferences.getString('token');
    var response= await delete(
      Uri.parse(baseURL+route),
      headers: {
        "Authorization":token.toString()
      }
    );
   if(response.body.contains('DOCTYPE html')){
      print(response.body);
      return Response(jsonEncode({'message':"a server error occurred..!"}), response.statusCode);
    }
    return response;
  }


}