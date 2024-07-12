import 'dart:convert';

import 'package:travel/screens/componets/snackbar.dart';
import 'package:travel/utils/requests.dart';

class ReservationService{
  static Future<bool> postReservation(Map data)async{
    try {
      data['user_id'] = 2;
      var response = await ApiRequests.postRequest(route: '/make-reservation', body: data);
      var results = jsonDecode(response.body);
      if(response.statusCode == 200 && results['ResultCode']==1200){
        CustomSnackbar(message: results['ResultDesc']);
        return true;
      }else{
        CustomSnackbar(message: results['ResultDesc'], error: true);
        return false;
      }
    } catch (error) {
      CustomSnackbar(message: error.toString(), error: true);
      return false;
    }
  }
}