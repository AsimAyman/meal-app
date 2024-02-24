import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../model/meal.dart';
import '../screen/meal_detail.dart';

class MealItem extends StatelessWidget {
  const MealItem({required this.meal, super.key});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery
        .of(context)
        .size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => MealDetail(meal: meal),)
          );
        },
        splashColor: Colors.blue,
        child: Stack(children: [
          Container(
            height: screenSize.height * .4,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Card(
              elevation: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(meal.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 3,
            left: 3,
            right: 3,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                color: Colors.black.withOpacity(.6),
              ),
              height: screenSize.height * .13,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    meal.title,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildRow(
                          text: '${meal.duration} min', icon: Icons.timelapse),
                      buildRow(
                          text: meal.complexityString,
                          icon: Icons.work_outline),
                      buildRow(
                          text: meal.affordabilityString,
                          icon: Icons.monetization_on_outlined),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Row buildRow({required icon, required text}) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          '$text',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
