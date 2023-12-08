import 'package:flutter/material.dart';
import 'add_items.dart';
import 'food_items.dart';
import 'navbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// hive packages
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String resName="nothing";

  void seResName(){
    Box <Map<String, dynamic>> resInfoBox = Hive.box('restaurantInfo');
    List<Map<String, dynamic>> restaurants = List.from(resInfoBox.values);
    setState(() {
      resName = restaurants[0]['name'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    seResName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavBar(),
        appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            title:Text(resName,
                style: const TextStyle(
                    fontFamily: "Lobster",
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w200)),
            centerTitle: true,
            flexibleSpace: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.cyan, Colors.amber],
                        begin: FractionalOffset(0.0, 0.0),
                        end: FractionalOffset(1.0, 0.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp)))),
        floatingActionButton:FloatingActionButton.extended(
            onPressed:(){
              Navigator.push(context,MaterialPageRoute(builder:(c)=>const AddItems()));
            },
            label:const Text('Add',
                style:TextStyle(
                    fontSize:17,
                    color:Colors.white)),
            icon:const Icon(Icons.add,color:Colors.white),
            backgroundColor:Colors.deepOrange,
        ),
        body:const FoodItemsScreen());
  }
}
