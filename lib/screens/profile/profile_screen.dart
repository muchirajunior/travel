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
    user=await Utils.getLocalUser();
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
        ElevatedButton(onPressed: ()=> Utils.logout(context), child: const Text("Ok"))
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My Profile",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).brightness == Brightness.light ? Theme.of(context).primaryColor : Colors.grey.shade200
          ),
        ),
        scrolledUnderElevation: 0,
        actions:const [
         SizedBox(width: 50,)
        ],
      ),

      body: ListView(
        children: [
          const SizedBox(height: 20,),

         const Center(
            child: CircleAvatar(
             radius: 60,
             
              backgroundImage: AssetImage('assets/icons/profile.png',),
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