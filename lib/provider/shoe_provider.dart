import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:shoe_favorite/models/shoe.dart';

List<Shoe> initialData = List.generate(
  20, 
  (index) => Shoe(
    title: "Tennis $index", 
    price: double.parse((Random().nextInt(100) * index).toString()), 
    image: "image/thumbnail.png"
  )
);

class ShoeProvider extends ChangeNotifier {
  List<Shoe> _shoes = initialData;

  List<Shoe> get shoes => _shoes;

  List<Shoe> _myFavorite = [];
  
  List<Shoe> get myFavorite => _myFavorite;

  void addToMyFavorite(Shoe shoe){
    _myFavorite.add(shoe);
    notifyListeners();
  }

  void removeMyFavorite(Shoe shoe){
    _myFavorite.remove(shoe);
    notifyListeners();
  }


}