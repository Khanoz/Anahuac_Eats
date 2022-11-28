
import 'package:anahuac_eats/LoginScreen.dart';
import 'package:anahuac_eats/main.dart';
import 'package:flutter/material.dart';
import  'package:firebase_auth/firebase_auth.dart';



class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading:
        IconButton( onPressed: (){
          Navigator.pop(context);
        },icon:const Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text ("Sign up", style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),),
                        const SizedBox(height: 20,),
                        Text("Create an account for Anáhuac Eats.",style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[700],
                        ),),
                        const SizedBox(height: 30,)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40
                      ),
                      child: Column(
                        children: [
                          makeInput(label: "Email", obsureText: false, controller: nameController),
                          makeInput(label: "Password",obsureText: true, controller: passwordController),
                          //makeInput(label: "Confirm Password",obsureText: true)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        padding: const EdgeInsets.only(top: 3,left: 3),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height:50,
                          onPressed: Register,
                          color: Colors.deepOrange,
                          child: const Text("Sign Up",style: TextStyle(
                            fontWeight: FontWeight.w600,fontSize: 16, color: Colors.white,
                          ),),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future Register() async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: nameController.text.trim(),
        password: passwordController.text.trim(),
      );
      navigatorKey.currentState!.pop(navigatorKey.currentContext);
    } on FirebaseAuthException catch (e){
      print(e);
    }
  }
}

Widget makeInput({label,obsureText = false, controller}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label,style:const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87
      ),),
      const SizedBox(height: 5,),
      TextField(
        controller: controller,
        obscureText: obsureText,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)
          ),
        ),
      ),
      const SizedBox(height: 30,)

    ],
  );
}