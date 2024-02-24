import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled9/provider/favorite_provider.dart';
import 'package:untitled9/ui/widget/meal_item.dart';

import '../../model/meal.dart';

class FavoriteScreen extends ConsumerWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context,ref) {
    List<Meal> favorite = ref.watch(favoriteProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
      ),
      body: ListView.builder(
        itemCount:favorite.length ,
        itemBuilder: (context, index) => MealItem(meal: favorite[index]),
      ),
    );
  }
}
