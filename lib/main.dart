import 'package:anahuac_eats/Items.dart';
import 'package:anahuac_eats/Menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:anahuac_eats/LoginScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final docSnap = await ref.get();
  item55 = docSnap.data()!;
  final QuerySnapshot<Map<String, dynamic>> query = await FirebaseFirestore.instance.collection("Items").get();
  final itemsTest = await query.docs
    .map((itt) => Items.fromSnapshot(itt)).toList();
  il = itemsTest;
  runApp(const MyApp());
}
final navigatorKey = GlobalKey<NavigatorState>();
List<Items> itemList = [];
final ref = FirebaseFirestore.instance.collection("Items").doc("xFa7iHnmOA85xFndcmvF").withConverter(
    fromFirestore: Items.fromFirestore,
    toFirestore: (Items item, _) => item.toFirestore(),
  );
late Items item55;
List<Items> il = [];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Anáhuac Eats';


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: navigatorKey,
        title: _title,
        debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: Scaffold(
          appBar: AppBar(title: const Text(_title)),
          body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot){
              if(snapshot.hasData){
                return const MyMenu();
              }
              else{
                return const LoginWidget();
              }
            },
          ),
      ),
    );
  }
}
