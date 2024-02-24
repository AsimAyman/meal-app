import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled9/data/dummy_data.dart';

import '../model/meal.dart';

final  favoriteProvider =
    StateNotifierProvider<FavoriteNotifier,List<Meal>>((ref) => FavoriteNotifier());

class FavoriteNotifier extends StateNotifier<List<Meal>> {
  FavoriteNotifier() : super(favorite);

  void addToFavorite(Meal meal){

    if(state.contains(meal)){
      state = state.where((element) => element.id != meal.id).toList();
       print("removed");
    }
    else {
      state = [...state, meal];
      print('add');
    }

  }

  bool isExist(Meal meal){
   // print(state.contains(meal));
    return state.contains(meal);
  }
}
