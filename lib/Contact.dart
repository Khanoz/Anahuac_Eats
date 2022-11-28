import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

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
                        const Text ("About Us", style: TextStyle(
                          fontSize: 30,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                        ),),
                        const SizedBox(height: 150,),
                          Text("Programadores: Vicente Elias y Miguel Nicolau",style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[700],
                          ),),
                        const SizedBox(height: 30,),
                          Text("Universidad Anáhuac Cancún",style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[700],
                          ),),
                          const SizedBox(height: 30,),
                        Text("Escuela de Ingeniería",style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[700],
                        ),),
                        const SizedBox(height: 30,),
                        Text("Versión de la App: 0.1",style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[700],
                        ),),
                        const SizedBox(height: 70,),
                        const Text ("Contact: vicente.elias15@anahuac.mx", style: TextStyle(
                          fontSize: 15,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                        ),),
                        const SizedBox(height: 10,),
                        const Text ("allar.nicolaudo@anahuac.mx", style: TextStyle(
                          fontSize: 15,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                        ),),
                      ],
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
}