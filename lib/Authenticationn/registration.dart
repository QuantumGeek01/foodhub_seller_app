import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  final TextEditingController _nameTextEditingController =
      TextEditingController();
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _phoneTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final TextEditingController _confirmPasswordTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
      child: SingleChildScrollView(
          child: Form(
              key: formState,
              child: Column(children: [
                const SizedBox(height: 15),
                TextFormField(
                    controller: _nameTextEditingController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Name",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.cyan)),
                        errorBorder:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:const BorderSide(color:Colors.red))),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'enter your name';
                      } else {
                        return null;
                      }
                    }),
                const SizedBox(height: 15.0),
                TextFormField(
                    controller: _emailTextEditingController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Email",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.cyan)),
                        errorBorder:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:const BorderSide(color:Colors.red))),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'enter e-mail address';
                      } else {
                        return null;
                      }
                    }),
                const SizedBox(height: 15.0),
                TextFormField(
                    controller: _passwordTextEditingController,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Password",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.cyan)),
                        errorBorder:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:const BorderSide(color:Colors.red))),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'enter password';
                      } else {
                        return null;
                      }
                    }),
                const SizedBox(height: 15.0),
                TextFormField(
                    controller: _confirmPasswordTextEditingController,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Confirm-password",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.cyan)),
                        errorBorder:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:const BorderSide(color:Colors.red))),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'enter confirm-password';
                      } else {
                        return null;
                      }
                    }),
                const SizedBox(height:25),
                SizedBox(
                  width:double.infinity,
                  height:50,
                  child: ElevatedButton(
                      onPressed: () {
                        if(formState.currentState!.validate()){
                          print("validate");
                          _nameTextEditingController.clear();
                          _emailTextEditingController.clear();
                          _passwordTextEditingController.clear();
                          _confirmPasswordTextEditingController.clear();

                        }
                      },
                      style: TextButton.styleFrom(
                           backgroundColor:Colors.amber,
                           shape:RoundedRectangleBorder(
                              borderRadius:BorderRadius.circular(10.0)
                          )
                          ),
                      child: const Text('Sign Up',style:TextStyle(color:Colors.white))
                  ),
                )
              ]))),
    );
  }
}
