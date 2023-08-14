import 'package:flutter/material.dart';
import '../../../resources/constants/style.dart';

class MySearchBar extends StatelessWidget {
  final String? Function(String?)? validator;
  final Function()? onTap;
  final String hint;
  final bool isReadOnly;
  final Color filledColor;
  final IconData prefixIcon;
  final TextEditingController controller;
  final Function(String) onChanged;
  final IconData? sufixIcon;
  final Function()? onTapSufix;

  const MySearchBar(
      {super.key, this.validator,
      this.onTap,
      required this.hint,
      this.filledColor = light,
      this.isReadOnly = false,
      this.prefixIcon = Icons.search,
      required this.controller,
      required this.onChanged,
      this.sufixIcon,
      this.onTapSufix});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: validator,
        readOnly: isReadOnly,
        onTap: onTap,
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(0),
            filled: true,
            fillColor: Colors.white,
            prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: Icon(prefixIcon, color: grey)),
            suffixIcon: sufixIcon != null
                ? Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                        onTap: onTapSufix, child: Icon(sufixIcon, color: grey)),
                  )
                : null,
            hintText: hint,
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20))));
  }
}
