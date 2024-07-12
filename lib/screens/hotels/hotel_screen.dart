import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel/models/hotel.dart';
import 'package:travel/screens/componets/custom_chip.dart';
import 'package:travel/screens/reservations/create_reservation_sheet.dart';

class HotelScreen extends StatefulWidget {
  final Hotel hotel;
  const HotelScreen({super.key, required this.hotel});

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  final String placeholdeImage = 'https://media.cntraveler.com/photos/64c284eef3e99758036e92c4/master/w_1920%2Cc_limit/raffles_royal_residence__aerial_view-jan21-pr.jpg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.hotel.name.toString()),
      ),

      body: Column(
        children: [
          Stack(
            children: [
              Image.network(placeholdeImage, height: 300,fit: BoxFit.cover,),
              Positioned(
                right: 10,
                child: SizedBox(
                  height: 300,
                  width: 60,
                  child: ListView(
                    children: widget.hotel.mediaImages.map((image) => SizedBox(
                      width: 60,
                      height: 60,
                      child: Card(
                        clipBehavior: Clip.hardEdge,
                        child:  Image.network(placeholdeImage,fit:BoxFit.cover ,)
                      ),
                    )).toList(),
                  ),
                )
              )
            ],
          ),
          ListTile(
            leading: const Icon(Icons.location_on_outlined, size: 30,),
            title: Text(widget.hotel.address.toString()),
            subtitle: Text("${widget.hotel.location ?? widget.hotel.constituency}, ${widget.hotel.country ?? widget.hotel.state}"),
             trailing:  SizedBox(
                width: 100,
                child:  Row(
                  children: List.generate(4, (index) => const Icon(Icons.star, color: Colors.amber, size: 20,))
                    
                ),
              ),
          ),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              children: [
                Wrap(
                  children: [
                    CustomChip(label:"⭐ ${ widget.hotel.classification ?? 'Unrated'}"),
                    CustomChip(label:"💒 ${ widget.hotel.town ?? widget.hotel.street}"),
                    CustomChip(label:"📬 ${ widget.hotel.zipcode ?? 'No ZipCode'}"),
                  ],
                ),
                const SizedBox(height: 10,),
                Text(widget.hotel.description ?? '')
              ],
            ),
          ),
          

          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                SizedBox(
                  width: 150 ,
                  child: OutlinedButton(onPressed: (){}, child: const Text("\$800/person"))
                ),
                const Spacer(),
                SizedBox(
                  width: 150,
                  child: FilledButton(
                    onPressed: ()=>showModalBottomSheet(context: context, showDragHandle: true, builder: (_)=>CreateReservationSheet(hotel: widget.hotel)),
                    child: const Text("Visit Site")
                  )
                )
              ],
            ),
          )

        ],
      ),
    
      
    );
  }
}