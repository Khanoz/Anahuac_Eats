import 'package:anahuac_eats/Items.dart';
import 'package:anahuac_eats/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:anahuac_eats/Register.dart';
import 'package:anahuac_eats/ForgotPassword.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String nombre = "df";
  final db = FirebaseFirestore.instance;
  final cities = FirebaseFirestore.instance.collection("Items");
  setNombre() => { FirebaseFirestore.instance.collection("Items").doc("xFa7iHnmOA85xFndcmvF").get()
      .then((DocumentSnapshot doc) {
        final data = Items.fromJson(doc.data() as Map<String, dynamic>);
        nombre = data.name;
        print(nombre);
        print("hola");
    })};


  /*final Stream<List<Items>> itemsData = FirebaseFirestore.instance
      .collection("Items")
      .snapshots()
      .map((snapshot) =>
        snapshot.docs.map((docs) => Items.fromJson(docs.data())).toList());*/


  @override
  Widget build(BuildContext context) {
    setNombre();
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Anáhuac Eats',
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Sign in',
                  style: TextStyle(fontSize: 18),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 50),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: Login/*() {
                    print(nameController.text);
                    print(passwordController.text);
                  },*/
                ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign up',
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    //signIn screen
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupPage()),
                    );},
                )
              ],
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForgotPassword()));
              },
              child: const Text('Forgot Password',),
            ),
          ],
        ));

  }
  Future Login() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: nameController.text.trim(),
        password: passwordController.text.trim(),
    );


  }
}