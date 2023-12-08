import 'package:flutter/material.dart';
// hive packages
import 'package:hive_flutter/hive_flutter.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  Box <Map<String, dynamic>> resInfoBox = Hive.box('restaurantInfo');
  List<Map<String, dynamic>> restaurants = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      restaurants = List.from(resInfoBox.values);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
       padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(restaurants[0]['name'].toString()),
            accountEmail: Text(restaurants[0]['email'].toString()),
            currentAccountPicture: CircleAvatar(
                child: ClipOval(
              child: Image.network(
                restaurants[0]['img'].toString(),
                errorBuilder:(_,__,___){

                  return const Icon(
                    Icons.image,
                    size:32,
                  );
                },
                height: 90,
                width: 90,
                fit: BoxFit.cover,
              ),
            )),
              decoration:const BoxDecoration(
                  gradient:LinearGradient(
                      begin:Alignment.topRight,
                      end:Alignment.bottomLeft,
                      colors:[
                        Colors.amber,
                        Colors.cyan
                      ]
                  )
              )
          ),
          Padding(
            padding:const EdgeInsets.only(left:5),
            child:ListTile(
              onTap:(){
                Navigator.pop(context);
              },
              leading:const Icon(Icons.home),
              title:const Text('Home'),
              contentPadding:const EdgeInsets.all(5),
            ),
          ),
          const Padding(
            padding:EdgeInsets.only(left:5),
            child: ListTile(
              leading:Icon(Icons.attach_money),
              title:Text('My Earnings'),
              contentPadding:EdgeInsets.all(5),
            ),
          ),
          const Padding(
            padding:EdgeInsets.only(left:5),
            child: ListTile(
              leading:Icon(Icons.list),
              title:Text('New orders'),
              contentPadding:EdgeInsets.all(5),
            ),
          ),
          const Padding(
            padding:EdgeInsets.only(left:5),
            child: ListTile(
              leading:Icon(Icons.history),
              title:Text('History-orders'),
              contentPadding:EdgeInsets.all(5),
            ),
          ),
          const Padding(
            padding:EdgeInsets.only(left:5),
            child: ListTile(
              leading:Icon(Icons.logout),
              title:Text('Logout'),
              contentPadding:EdgeInsets.all(5),
            ),
          ),
        ],
      ),
    );
  }
}
