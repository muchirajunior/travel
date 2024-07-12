import 'package:flutter/material.dart';
import 'package:travel/models/hotel.dart';
import 'package:travel/screens/componets/snackbar.dart';
import 'package:travel/screens/componets/text_input.dart';
import 'package:travel/screens/reservations/reservation_service.dart';

class CreateReservationSheet extends StatefulWidget {
  final Hotel hotel;
  const CreateReservationSheet({super.key, required this.hotel});

  @override
  State<CreateReservationSheet> createState() => _CreateReservationSheetState();
}

class _CreateReservationSheetState extends State<CreateReservationSheet> {
  var startController = TextEditingController();
  var endController = TextEditingController();
  bool loading = false;
  var formKey = GlobalKey<FormState>();

  pickDate({bool start = true}){
    showDatePicker(
      context: context, 
      firstDate: start ? DateTime.now() : DateTime.parse(startController.text) , 
      lastDate: DateTime.now().add(const Duration(days: 300))
    ).then((value) {
      if(value != null){
        if(start){
          startController.text = value.toString().split(' ').first;
        }else{
          endController.text = value.toString().split(' ').first;
        }
      }
      setState(() { });
    });
  }

  submit()async{
    if (!formKey.currentState!.validate()) {
      return CustomSnackbar(message: 'Fill all the required fields', error: true);
    }
    setState(() => loading = true);
    var res = await ReservationService.postReservation({
        "hotel_id" : widget.hotel.id,
        "dateFrom" : startController.text,
        "dateTo" : endController.text,
        "createdBy" : "1"
    });
    print(res);
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0)
        ),
        margin: EdgeInsets.zero,
        child: Form(
          key: formKey,
          child: Column(
            children: [
              ListTile(
                title: Text(
                  widget.hotel.name.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('Make a reservation for this hotel  🍂 '),
              ),
              CustomTextInput(
                controller: startController, 
                title: "Start Date", 
                readonly: true,
                suffix: IconButton(onPressed: pickDate, icon: const Icon(Icons.date_range),),
              ),
               CustomTextInput(
                controller: endController, 
                title: "End Date", 
                readonly: true,
                suffix: IconButton(onPressed: startController.text.isEmpty ? null : ()=> pickDate(start:false), icon: const Icon(Icons.date_range),),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                child: loading ? const Center(child: CircularProgressIndicator(),) : FilledButton(
                  onPressed: submit, 
                  child: const Text('Make Reservation ')
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}