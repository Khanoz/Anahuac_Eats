import 'package:anahuac_eats/Contact.dart';
import 'package:anahuac_eats/Items.dart';
import 'package:anahuac_eats/main.dart';
import 'package:flutter/material.dart';

class MyMenu extends StatelessWidget {
  const MyMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: SwipeList()),
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Contact()),
          );
        },
          child: Icon(Icons.question_mark),
      ),
    );
  }
}

class SwipeList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListItemWidget();
  }
}

class ListItemWidget extends State<SwipeList> {
  List<Items> items = getDummyList();

  @override
  Widget build(BuildContext context) {
    items = il;
    return Container(
        child: ListView.builder(

          itemCount: items.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: Key(items[index].name),
              background: Container(
                alignment: AlignmentDirectional.centerEnd,
                color: Colors.red,
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              onDismissed: (direction) {
                setState(() {
                  items.removeAt(index);
                });
              },
              direction: DismissDirection.endToStart,
              child: Card(
                elevation: 5,
                child: Container(
                  height: 100.0,
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 100.0,
                        width: 70.0,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(5),
                                topLeft: Radius.circular(5)
                            ),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(items[index].image) // TO DO: IMAGEN
                            )
                        ),
                      ),
                      Container(
                        height: 100,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                items[index].name,

                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
                                child: Container(
                                  child: Text(items[index].price.toString(),textAlign: TextAlign.center,), //TO DO: CAMBIAR 3D POR CUALQUIER OTRA COSA
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                                child: Container(
                                  width: 260,
                                  child: Text(items[index].description,style: const TextStyle( //TO DO: DESCRIPCIÓN
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 48, 48, 54)
                                  ),),


                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }

  static List<Items> getDummyList() {
    List<Items> list = List.generate(10, (i) {
      return Items(
          name: "name",
          description: "description",
          image: "https://www.saborusa.com/wp-content/uploads/2019/10/Animate-a-disfrutar-una-deliciosa-pizza-de-salchicha-Foto-destacada.png",
          price: i); //TODO: CAMBIAR NOMBRE ITEM POR COMIDA O LO QUE SEA
    });
    return list;
  }
}


class FabExample extends StatelessWidget {
  const FabExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FloatingActionButton Sample'),
      ),
      body: const Center(child: Text('Press the button below!')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.navigation),
      ),
    );
  }
}
