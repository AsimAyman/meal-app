
import 'package:flutter/material.dart';


import '../../data/dummy_data.dart';

import '../widget/category_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Category',
        ),
      ),
      drawer: const Drawer(),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: size.height * .01,
          crossAxisSpacing: size.width * .01,
          childAspectRatio: 3 / 2,
        ),
        children: [
          ...availableCategories.map(
            (category) => CategoryItem(
              category: category,
            ),
          ),
        ],
      ),
    );
  }
}

