import 'package:flutter/material.dart';
import 'package:travel/models/hotel.dart';

class HotelScreen extends StatefulWidget {
  final Hotel hotel;
  const HotelScreen({super.key, required this.hotel});

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.hotel.name),
      ),

      body: Column(
        children: [
          Image.network(widget.hotel.imageUrl),
          ListTile(
            leading: const Icon(Icons.location_on_outlined),
            title: Text(widget.hotel.address),
             trailing: const SizedBox(
                width: 100,
                child:  Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 20,),
                    Icon(Icons.star, color: Colors.amber, size: 20,),
                    Icon(Icons.star, color: Colors.amber, size: 20,),
                    Icon(Icons.star, color: Colors.amber, size: 20,),
                    Icon(Icons.star, color: Colors.amber, size: 20,),
                  ],
                ),
              ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Our contemporary resort is a tropical wonderland, located just a 40 minutes speedboat ride from Velana International Airport Malé. Featuring world-class diving sites and surfing on our doorstep, our spacious villas are dotted around the island and appeal to a wide variety of guests, offering access to the beach, ocean or lagoon. For families, the two- and three-bedroom villas offer ample space for fun and relaxation as you discover Kandooma. Parents can introduce the kids to the thrill of island life through activities such as PADI Bubblemaker, Surf Camps, swimming lessons, and best of all, the Kandoo Kids' Club with a daily activities plan. Along with Holiday Inn®'s Kids Stay and Eat Free programme, we provide a tropical adventure that the family will always"),
            ),

          ),

          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                SizedBox(
                  width: 150 ,
                  child: OutlinedButton(onPressed: (){}, child: Text("\$800/person"))
                ),
                Spacer(),
                SizedBox(
                  width: 150,
                  child: FilledButton(onPressed: (){}, child: Text("Visit Site"))
                  )
              ],
            ),
          )

        ],
      ),
    
      
    );
  }
}