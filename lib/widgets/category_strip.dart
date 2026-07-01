import 'package:flutter/material.dart';

class CategoryStrip extends StatelessWidget {
  const CategoryStrip({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onSelected,
  });

  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: 46,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: categories.length,
        separatorBuilder: (_, _) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final category = categories[index];
          final selected = category == selectedCategory;

          return ChoiceChip(
            selected: selected,
            label: Text(category),
            onSelected: (_) => onSelected(category),
            labelStyle: TextStyle(
              color: selected ? Colors.black : const Color(0xFFC7CEDB),
              fontWeight: FontWeight.w700,
              letterSpacing: 0,
            ),
            selectedColor: colorScheme.primary,
            backgroundColor: const Color(0xFF171D28),
            side: BorderSide(
              color: selected ? colorScheme.primary : const Color(0xFF2A3342),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          );
        },
      ),
    );
  }
}
