import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// hive packages
import 'package:hive_flutter/hive_flutter.dart';

class AddItems extends StatefulWidget {
  const AddItems({Key? key}) : super(key: key);

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  final TextEditingController _titleTextEditingController = TextEditingController();
  final TextEditingController _descriptionTextEditingController = TextEditingController();
  final TextEditingController _imgTextEditingController = TextEditingController();
  final TextEditingController _priceTextEditingController = TextEditingController();

  sendData(String title, String description, String img, String price)async{
    final db = FirebaseFirestore.instance;
    Box resID = Hive.box('restaurantID');
    String restaurantId =  resID.get('redID');
    final DocumentReference restaurantDocRef = db.collection('restaurant').doc(restaurantId);
    final CollectionReference itemInfoCollection = restaurantDocRef.collection('itemInfo');
    await itemInfoCollection.add({
      'itemName': title,
      'description': description,
      'img':img,
      'price': price,
      // Add other fields as needed
    });

    Navigator.pop(context);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text('Add new food item',
              style: TextStyle(
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
      body:Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
        child: SingleChildScrollView(
            child: Form(
                key: formState,
                child: Column(children: [
                  const SizedBox(height: 15),
                  TextFormField(
                      controller: _titleTextEditingController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Enter food name",
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.amber)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.cyan)),
                          errorBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:const BorderSide(color:Colors.red))),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'enter food name';
                        } else {
                          return null;
                        }
                      }),
                  const SizedBox(height: 15.0),
                  TextFormField(
                      controller: _descriptionTextEditingController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "food description",
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.amber)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.cyan)),
                          errorBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:const BorderSide(color:Colors.red))),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'enter food description';
                        } else {
                          return null;
                        }
                      }),
                  const SizedBox(height: 15.0),
                  TextFormField(
                      controller:_imgTextEditingController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Img url",
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.amber)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.cyan)),
                          errorBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:const BorderSide(color:Colors.red))),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'enter image url';
                        } else {
                          return null;
                        }
                      }),
                  const SizedBox(height: 15.0),
                  TextFormField(
                      controller: _priceTextEditingController,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Enter price",
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.amber)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.cyan)),
                          errorBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:const BorderSide(color:Colors.red))),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'enter price';
                        } else {
                          return null;
                        }
                      }),
                  const SizedBox(height:25.0),
                  SizedBox(
                    width:double.infinity,
                    height:50,
                    child: ElevatedButton(
                        onPressed: () {
                          if(formState.currentState!.validate()){
                            sendData(_titleTextEditingController.text,
                            _descriptionTextEditingController.text,
                            _imgTextEditingController.text,
                            _priceTextEditingController.text);
                            _titleTextEditingController.clear();
                            _descriptionTextEditingController.clear();
                            _imgTextEditingController.clear();
                            _priceTextEditingController.clear();
                          }
                        },
                        style: TextButton.styleFrom(
                            backgroundColor:Colors.amber,
                            shape:RoundedRectangleBorder(
                                borderRadius:BorderRadius.circular(10.0)
                            )
                        ),
                        child: const Text('Save',style:TextStyle(color:Colors.white))
                    ),
                  ),
                ]))),
      )
    );
  }
}
