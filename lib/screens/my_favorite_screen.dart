import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_favorite/models/shoe.dart';
import 'package:shoe_favorite/provider/shoe_provider.dart';

class MyFavoriteScreen extends StatefulWidget {

  @override
  State<MyFavoriteScreen> createState() => _MyFavoriteScreenState();
}

class _MyFavoriteScreenState extends State<MyFavoriteScreen> {

  @override
  Widget build(BuildContext context) {

    final myFavorite = context.watch<ShoeProvider>().myFavorite;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Mis Favoritos", style: TextStyle(color: Colors.blueGrey)),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0
          ),
          itemCount: myFavorite.length,
          itemBuilder: (context, index){
            Shoe shoe = myFavorite[index];
            return Card(
              key: ObjectKey(shoe),
              color: Colors.white,
              elevation: 1,
              child: Column(
                children: [
                  Image.asset(shoe.image, width: 100, height: 100),
                  Text(shoe.title),
                  Text(shoe.price.toString()),
                  Expanded(
                    child: TextButton(
                      onPressed: (){
                        context.read<ShoeProvider>().removeMyFavorite(shoe);
                      }, 
                      child: Text("Eliminar", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)) 
                    ),
                  )
                ],
              )
            );
          }
        ),
      ),
    );
  }
}