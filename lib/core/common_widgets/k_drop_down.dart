// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class KDropdown<T> extends StatelessWidget {
  final List<T> items;
  final T? selectedValue;
  final String Function(T) itemLabel;
  final ValueChanged<T?> onChanged;
  final String hint;
  final Color borderColor;
  final Color dropdownColor;
  final double borderRadius;
  final String? Function(T?)? validator;

  const KDropdown({
    super.key,
    required this.items,
    this.selectedValue,
    required this.itemLabel,
    required this.onChanged,
    this.hint = "Select an item",
    this.borderColor = Colors.grey,
    this.dropdownColor = Colors.white,
    this.borderRadius = 8.0,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      validator: validator,
      value: selectedValue,
      hint: Text(hint),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        enabledBorder: OutlineInputBorder(
          // Default border
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          // Border when dropdown is focused
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: Colors.grey), // Grey on selection
        ),
      ),
      dropdownColor: dropdownColor,
      items: items.map((T item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(itemLabel(item)),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
