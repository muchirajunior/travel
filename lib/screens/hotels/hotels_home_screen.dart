import 'package:flutter/material.dart';
import 'package:travel/models/cartegory.dart';
import 'package:travel/screens/componets/custom_search.dart';
import 'package:travel/screens/componets/shimmer_container.dart';
import 'package:travel/screens/componets/snackbar.dart';
import 'package:travel/screens/hotels/hotel_screen.dart';
import 'package:travel/screens/hotels/hotels_service.dart';
import 'package:travel/utils/requests.dart';

class HotelsHomeScreen extends StatefulWidget {
  const HotelsHomeScreen({super.key});

  @override
  State<HotelsHomeScreen> createState() => _HotelsHomeScreenState();
}

class _HotelsHomeScreenState extends State<HotelsHomeScreen> {
  bool loading = false;

  final String placeholder = 'https://media.cntraveler.com/photos/64c284eef3e99758036e92c4/master/w_1920%2Cc_limit/raffles_royal_residence__aerial_view-jan21-pr.jpg';
  

  getData({bool refresh = false})async{
    if(!refresh && HotelsService.hotels.value.isNotEmpty){return;}
    setState(()=> loading= !refresh);
    await HotelsService.fetchHotels();
    setState(()=> loading= false);
  }

  List<Cartegory> cartegories = [
    Cartegory(title: 'Foods', icon: 'assets/icons/burger.png'),
    Cartegory(title: 'Beach', icon: 'assets/icons/beach.png'),
    Cartegory(title: 'Camping', icon: 'assets/icons/tent.png'),
    Cartegory(title: 'Recreaction', icon: 'assets/icons/holiday.png'),
    Cartegory(title: 'International', icon: 'assets/icons/globe.png'),
  ];

@override
  void initState() {
    getData();
    super.initState();
  }

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

        actions:  [
          Card(
            child: IconButton(onPressed: ()=> CustomSnackbar(message: "message", error: true), icon: const Icon(Icons.settings)),
          ),
          const SizedBox(width: 10,)
        ],
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 60), 
          child: CustomSearchInput(controller: TextEditingController(),)
        ),
      ),

      body: RefreshIndicator(
        onRefresh: () => getData(refresh: true),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: [
            const Text("\nCartegories"),
            //  Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 10),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Chip(label: const Text('All'), deleteIcon: const Icon(Icons.check), onDeleted: (){},),
            //       Chip(label: Text('Nairobi')),
            //       Chip(label: Text('Mombasa')),
            //       Chip(label: Text('Kisumu'))
            //     ],
            //   ),
            // ),
            Card(
              child: SizedBox(
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
        
            const SizedBox(height: 10,),
        
            
            loading ? GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 5,
              crossAxisCount: 2,
              children: List.generate(5, (index) => const ShimmerContainer()
              ),
            ) : ValueListenableBuilder(
              valueListenable: HotelsService.hotels,
              builder: (context,hotels,_) {
                return GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 5,
                  crossAxisCount: 2,
                  children: hotels.map((hotel) => InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_)=>HotelScreen(hotel: hotel))),
                    child: Card(
                      clipBehavior: Clip.hardEdge,
                      surfaceTintColor: Colors.amber,
                      elevation: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Card(
                                clipBehavior: Clip.hardEdge,
                                child: Image.network( !loading ?  placeholder : "${ApiRequests.baseURL}/${hotel.mediaImages.first.fileName}")
                              ),
                              Positioned(
                                right: 10,
                                bottom: 5,
                                child: Card(
                                  color: Colors.grey.withOpacity(0.2),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Text(
                                      hotel.classification ?? '',
                                      style: const TextStyle(color: Colors.grey),
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10,5,2,2),
                            child: Text(hotel.name ?? "Hotel ${hotel.id}", style: const TextStyle(fontWeight: FontWeight.bold),),
                          ),
                          Row(
                            children: [
                              const SizedBox(width: 10,),
                              const Icon(Icons.location_on_outlined),
                              Text("${hotel.location}, ${hotel.country ?? ''}", maxLines: 1,overflow: TextOverflow.ellipsis,),
                            ],
                          ),
                         
                        ],
                      )
                    ),
                  )).toList()
                );
              }
            ),
            
          ],
        ),
      ),

    );
  }
}