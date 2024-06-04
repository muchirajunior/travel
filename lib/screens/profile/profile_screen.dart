import 'package:travel/models/user.dart';
import 'package:travel/utils/utils.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? user;
  getUser()async{
    user=await getLocalUser();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  changeTheme()async{}

  logoutUser()async{
    showDialog(context: context, builder: (context)=>AlertDialog(
      title:const  Text("Warning "),
      content:const  Text("Are you sure you want to log out ..?"),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        ElevatedButton(onPressed: ()=> Navigator.pop(context), child: const Text("cancel")),
        ElevatedButton(onPressed: ()=> logout(context), child: const Text("Ok"))
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Profile",style: TextStyle(fontWeight: FontWeight.bold),)),
        elevation: 1,
        actions:const [
         SizedBox(width: 50,)
        ],
      ),

      body: ListView(
        children: [
          const SizedBox(height: 20,),

          Center(
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100)
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.asset('assets/profile.png', fit: BoxFit.cover,),
            ),
          ),
         
          const SizedBox(height: 10,),
            const Padding(
            padding:  EdgeInsets.only(left:15.0),
            child: Text("Personal Info", style: TextStyle(fontSize: 20),),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              child: Column(children: [
                //name
                ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(user?.name ?? "No Name", ),
                ),
                const  Divider(),
                ListTile(
                  leading: const Icon(Icons.email),
                  title: Text(user?.email ?? "No email"),
                ),
                const  Divider(),
                // ListTile(
                //   leading: const Icon(Icons.type_specimen),
                //   title: Text(user.gender ?? "not specified"),
                // ),
                // const  Divider(),
                ListTile(
                  leading: const Icon(Icons.admin_panel_settings),
                  title: Text(user?.role == 1 ? "Super User" : "User"),
                ),
                const Divider(),

                Container(
                  width: double.infinity,
                  padding:const EdgeInsets.all(5),
                  child: ElevatedButton(onPressed: (){}, child: const Text('Update Profile'))
                  )
              ]),
            ),
          ),

          const Padding(
            padding:  EdgeInsets.only(left:15.0),
            child: Text("Settings", style: TextStyle(fontSize: 20),),
          ),

         
            Card(
              margin:const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: ListTile(
                title:const  Text("Change App Theme", ),
                trailing:const Icon(Icons.arrow_forward_ios_sharp),
                onTap: changeTheme,
              ),
            ),

              Card(
              margin:const EdgeInsets.fromLTRB(10, 0, 10, 5),
              child: ListTile(
                title:const  Text('Logout' ),
                trailing:const Icon(Icons.arrow_forward_ios_sharp),
                onTap: logoutUser,
              ),
            ),
        ],
      ),

    );
  }
}