import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:untitled9/data/dummy_data.dart';
import 'package:untitled9/provider/favorite_provider.dart';

import '../../model/meal.dart';

class MealDetail extends ConsumerWidget {
   MealDetail({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context, ref) {
    Size size = MediaQuery.of(context).size;
    bool isExist = ref.watch(favoriteProvider.notifier).isExist(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(favoriteProvider.notifier).addToFavorite(meal);
              print(isExist);
              isExist= ref.watch(favoriteProvider.notifier).isExist(meal);
            },
            icon:  Icon(
              Icons.star,
              color: isExist==true?Colors.blue:Colors.grey,

            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: size.height * .4,
              width: double.infinity,
            ),
            buildDetailColumn(title: 'Ingredients', details: meal.ingredients),
            buildDetailColumn(title: 'Steps', details: meal.steps),
          ],
        ),
      ),
    );
  }

  Column buildDetailColumn({required String title, required List details}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        ...details.map((e) => Text(
              e,
              textAlign: TextAlign.center,
            ))
      ],
    );
  }
}
