import 'package:flutter/material.dart';
import 'package:travel/models/cartegory.dart';
import 'package:travel/models/hotel.dart';
import 'package:travel/screens/componets/custom_search.dart';
import 'package:travel/screens/hotels/hotel_screen.dart';

class HotelsHomeScreen extends StatefulWidget {
  const HotelsHomeScreen({super.key});

  @override
  State<HotelsHomeScreen> createState() => _HotelsHomeScreenState();
}

class _HotelsHomeScreenState extends State<HotelsHomeScreen> {
  final List<Hotel> hotels = [
  Hotel(
    name: 'Hotel One',
    address: '123 Main Street',
    imageUrl: 'https://media.cntraveler.com/photos/64c284eef3e99758036e92c4/master/w_1920%2Cc_limit/raffles_royal_residence__aerial_view-jan21-pr.jpg',
  ),
  Hotel(
    name: 'Hotel Two',
    address: '456 Elm Street',
    imageUrl: 'https://media.cntraveler.com/photos/64c284ed3f4044d4db574b14/master/w_1920%2Cc_limit/Emerald%2520Resort%2520&%2520Spa-jan23-pr-global23.jpg.jpg',
  ),
  Hotel(
    name: 'Hotel Three',
    address: '789 Oak Street',
    imageUrl: 'https://media.cntraveler.com/photos/64c284eb9b31895c2ec86d1a/master/w_1920%2Cc_limit/Emerald%2520Faarufushi%2520Resort%2520&%2520Spa-jan23-pr-global23.jpg',
  ),
];

List<Cartegory> cartegories = [
  Cartegory(title: 'Foods', icon: 'assets/icons/burger.png'),
  Cartegory(title: 'Beach', icon: 'assets/icons/beach.png'),
  Cartegory(title: 'Camping', icon: 'assets/icons/tent.png'),
  Cartegory(title: 'Recreaction', icon: 'assets/icons/holiday.png'),
  Cartegory(title: 'International', icon: 'assets/icons/globe.png'),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: const Padding(
          padding:  EdgeInsets.only(left:8.0),
          child:  CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/icons/profile.png'),
          ),
        ),
        title: Text.rich(
          TextSpan(
            text: 'Welcome Back  👋\n',
            style: const TextStyle(color: Colors.grey, fontSize: 14),
            children: [
              TextSpan(
                text: 'Muchira Junior',
                style: TextStyle(
                  fontSize: 20, 
                  fontWeight: FontWeight.bold, 
                  color: Theme.of(context).brightness == Brightness.light ? Theme.of(context).primaryColor : Colors.grey.shade200
                )
              )
            ]
          )
        ),

        actions: const [
          Card(
            child: IconButton(onPressed: null, icon: const Icon(Icons.settings)),
          ),
           SizedBox(width: 10,)
        ],
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 60), 
          child: CustomSearchInput(controller: TextEditingController(),)
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding:  EdgeInsets.fromLTRB(10,2,0,0),
            child: Text("Filter by location"),
          ),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(label: const Text('All'), deleteIcon: const Icon(Icons.check), onDeleted: (){},),
                Chip(label: Text('Nairobi')),
                Chip(label: Text('Mombasa')),
                Chip(label: Text('Kisumu'))
              ],
            ),
          ),
          Card(
            child: Container(
              height: 80,
              width: double.infinity,
              child: ListView(
                padding: const EdgeInsets.only(top: 10),
                scrollDirection: Axis.horizontal,
                children: cartegories.map((cartegory) => SizedBox(
                  width: 100,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(cartegory.icon),
                      ),
                      const SizedBox(height: 5,),
                      Text(cartegory.title, style:const TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
                    ],
                  ),
                )).toList(),
              ),
            ),
          ),

          
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: hotels.map((hotel) => Card(
                clipBehavior: Clip.hardEdge,
                child: Column(
                  children: [
                    Image.network(hotel.imageUrl, height: 150, width: double.infinity, fit: BoxFit.cover,),
                    ListTile(
                      title: Text(hotel.name),
                      subtitle: Text(hotel.address),
                      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=>HotelScreen(hotel: hotel))),
                      trailing:  SizedBox(
                        width: 100,
                        child:  Row(
                          children: List.generate(5, (index) => Icon(Icons.star, color: index > 3 ? null : Colors.amber, size: 20,),) 
                        ),
                      ),
                    )
                  ],
                ),
              )).toList(),
            ),
          ),
        ],
      ),

    );
  }
}