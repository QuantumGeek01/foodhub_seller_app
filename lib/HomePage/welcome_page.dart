import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State< WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State< WelcomeScreen> {
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  final TextEditingController _nameTextEditingController = TextEditingController();
  final TextEditingController _imageTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom !=0;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body:Padding(
          padding:const EdgeInsets.fromLTRB(10.0,0.0,10.0,0.0),
          child: Form(
              key:formState,
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize:MainAxisSize.min,
                children: [
                    ListView(
                      primary: false,
                      shrinkWrap: true,
                      children: [
                        //const SizedBox(height:20),
                        const Text(
                          'Welcome New Restaurant',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        const Text('Please provide restaurant name and image'),
                        const SizedBox(height:20),
                        TextFormField(
                            controller: _nameTextEditingController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Restaurant name",
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
                                return 'enter name';
                              } else {
                                return null;
                              }
                            }
                        ),
                        const SizedBox(height:20),
                        TextFormField(
                            controller: _imageTextEditingController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Img-url",
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
                                return 'enter Image-url';
                              } else {
                                return null;
                              }
                            }
                        ),
                      ],
                    ),

                   const Spacer(),
                   Visibility(
                     visible:!isKeyboard,
                     child: SizedBox(
                       width:double.infinity,
                       height:60,
                       child: Padding(
                         padding:const EdgeInsets.only(bottom:10.0),
                         child: ElevatedButton(
                           onPressed: () {
                             if(formState.currentState!.validate()){
                               _nameTextEditingController.clear();
                               _imageTextEditingController.clear();
                               Navigator.push(context,MaterialPageRoute(builder: (c)=>const HomeScreen()));
                             }
                           },
                           style: TextButton.styleFrom(
                               backgroundColor:Colors.amber,
                               shape:RoundedRectangleBorder(
                                   borderRadius:BorderRadius.circular(30.0)
                               )
                           ),
                           child: const Text('Next',style:TextStyle(color:Colors.white)),
                         ),
                       )),
                   )
                ],
              )
          ),
        ),

    );
  }
}
