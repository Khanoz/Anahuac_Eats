import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class Items{
  String id;
  final String name;
  final String description;
  final String image;
  final int price;

  Items({
    this.id = '',
    required this.name,
    required this.description,
    required this.image,
    required this.price,
  });

  static Items fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot) => Items (
    id : snapshot['id'],
    name : snapshot['name'],
    description : snapshot['description'],
    image : snapshot['image'],
    price : snapshot['price'],
  );

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'description' : description,
    'image' : image,
    'price' : price,
  };

  static Items fromJson(Map<String, dynamic> json) => Items (
    id : json['id'],
    name : json['name'],
    description : json['description'],
    image : json['image'],
    price : json['price'],
  );

  factory Items.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Items(
      id: data?['id'],
      name: data?['name'],
      description: data?['description'],
      image: data?['image'],
      price: data?['price'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (name != null) "name": name,
      if (description != null) "description": description,
      if (image != null) "image": image,
      if (price != null) "price": price,
    };
  }


}