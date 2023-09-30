import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sotl/resources/constants/icons.dart';
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
      {super.key,
      this.validator,
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
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
                  child: SvgPicture.asset(IconUtils.search)),
              suffixIcon: sufixIcon != null
                  ? Padding(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                          onTap: onTapSufix,
                          child: Icon(sufixIcon, color: grey)),
                    )
                  : null,
              hintText: hint,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(12)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(12)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(12)))),
    );
  }
}
