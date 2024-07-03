import 'package:flutter/material.dart';
import 'package:travel/screens/componets/custom_search.dart';

class ReservationsScreen extends StatefulWidget {
  const ReservationsScreen({super.key});

  @override
  State<ReservationsScreen> createState() => _ReservationsScreenState();
}

class _ReservationsScreenState extends State<ReservationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
         leading: const Padding(
           padding:  EdgeInsets.all(8.0),
           child:  CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/icons/profile.png'),
            ),
         ),
        title: ListTile(
         contentPadding: EdgeInsets.zero,
          title: Text(
            'My Reservations', 
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).brightness == Brightness.light ? Theme.of(context).primaryColor : Colors.grey.shade200
            ),
          ),
          subtitle: const Text('You can always add more ✨'),
        ),

        bottom: PreferredSize(preferredSize: const Size(double.infinity, 60), child: CustomSearchInput(controller: TextEditingController(),)),
      ),
    );
  }
}