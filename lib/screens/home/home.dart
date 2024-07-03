import 'package:flutter/material.dart';
import 'package:travel/screens/hotels/hotels_home_screen.dart';
import 'package:travel/screens/profile/profile_screen.dart';
import 'package:travel/screens/reservations/reservation_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  List<Widget> tabs = [ const HotelsHomeScreen(), const ReservationsScreen(), const ProfileScreen() ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: tabs[currentIndex],
      
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (value) => setState(() => currentIndex=value),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.holiday_village), label: 'Hotels'),
          NavigationDestination(icon: Icon(Icons.hotel), label: 'Reservations'),
          NavigationDestination(icon: Icon(Icons.account_box), label: 'Account')
        ],
      ),
    );
  }
}