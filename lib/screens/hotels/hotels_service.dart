import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:travel/models/hotel.dart';
import 'package:travel/screens/componets/snackbar.dart';
import 'package:travel/utils/requests.dart';

class HotelsService{
  static final hotels = ValueNotifier<List<Hotel>>([]);

  static Future<bool> fetchHotels()async{
    try {
      var response = await ApiRequests.getRequest(route: '/view-hotel');
      var results = jsonDecode(response.body);
      if(response.statusCode == 200 && results['ResultCode']==1200){
        List data = results['ResponseData'];
        List<Hotel> hts = [];
        for (var json in data) {
          hts.add(Hotel.fromJson(json));
        }
        hotels.value = hts;
        return true;
      }else{
        CustomSnackbar(message: results['message'] ?? results['ResultDesc'].toString());
        return false;
      }
    } catch (error) {
      log('Error loading hotels', error: error);
      CustomSnackbar(message: error.toString());
      return false;
    }
  }
}