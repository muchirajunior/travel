import 'package:travel/screens/componets/snackbar.dart';
import 'package:travel/utils/requests.dart';

class ReservationService{
  static Future<bool> postReservation(Map data)async{
    try {
      data['user_id'] = 2;
      var response = await ApiRequests.postRequest(route: '/make-reservation', body: data);
      print(response.body);
      return false;
    } catch (error) {
      CustomSnackbar(message: error.toString(), error: true);
      return false;
    }
  }
}