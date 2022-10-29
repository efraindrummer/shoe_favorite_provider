import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_favorite/models/shoe.dart';
import 'package:shoe_favorite/provider/shoe_provider.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    final myFavorite = context.watch<ShoeProvider>().myFavorite;
    final shoes = context.watch<ShoeProvider>().shoes;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Productos", style: TextStyle(color: Colors.blueGrey)),
        actions: [
          Badge(
            position: BadgePosition.topEnd(top: 5, end: 5),
            badgeContent: Text(
              myFavorite.length.toString(), 
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            badgeColor: Colors.red,
            child: IconButton(
              icon: Icon(Icons.bookmark, color: Colors.blueGrey),
              onPressed: (){

              },
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView.builder(
          itemCount: shoes.length,
          itemBuilder: (context, index){
            Shoe shoe = shoes[index];
            return Card(
              key: ObjectKey(shoe),
              color: Colors.white,
              elevation: 1,
              child: ListTile(
                contentPadding: EdgeInsets.all(4),
                leading: Image.asset(shoe.image, width: 100, height: 100),
                title: Text(shoe.title),
                subtitle: Text("\$ ${shoe.price.toString()}"),
                trailing: IconButton(
                  icon: Icon(Icons.bookmark),
                  color: myFavorite.contains(shoe) ? Colors.red : Colors.grey,
                  onPressed: (){
                    if(!myFavorite.contains(shoe)){
                      context.read<ShoeProvider>().addToMyFavorite(shoe);
                    }else{
                      context.read<ShoeProvider>().removeMyFavorite(shoe);
                    }
                  },
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}