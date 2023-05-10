import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import '../../../models/course/course_model.dart';
import '../../../resources/constants/style.dart';

class SearchDropDown extends StatelessWidget {
  final String? header;
  final bool isRequired;
  final String hint;
  final List<String> items;
  final String? selectedItem;
  final Function(String?) onChanged;

  const SearchDropDown(
      {super.key,
      required this.items,
      required this.hint,
      required this.onChanged,
      this.selectedItem,
      this.header,
      this.isRequired = false});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      if (header != null)
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text(header!, style: const TextStyle(fontSize: 16)),
          const SizedBox(width: 3),
          if (isRequired)
            const Text("*", style: TextStyle(fontSize: 16, color: Colors.red))
        ]),
      const SizedBox(height: 5),
      Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: grey)),
          child: DropdownSearch<String>(
              popupProps: const PopupProps.menu(
                showSearchBox: true,
                showSelectedItems: true,
              ),
              selectedItem: selectedItem,
              items: items,
              dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(hintText: hint)),
              onChanged: onChanged))
    ]);
  }
}

class CourseDropDown extends StatelessWidget {
  final String? header;
  final bool isRequired;
  final String hint;
  final List<CourseModel> items;
  final CourseModel? selectedItem;
  final Function(CourseModel?) onChanged;

  const CourseDropDown(
      {super.key,
      required this.items,
      required this.hint,
      required this.onChanged,
      this.selectedItem,
      this.header,
      this.isRequired = false});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      if (header != null)
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text(header!, style: const TextStyle(fontSize: 16)),
          const SizedBox(width: 3),
          if (isRequired)
            const Text("*", style: TextStyle(fontSize: 16, color: Colors.red))
        ]),
      const SizedBox(height: 5),
      Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: grey)),
          child: DropdownSearch<CourseModel>(
              itemAsString: (CourseModel course) {
                List<String> slots = course.slots!
                    .map((slot) => "(${slot.time}) (${slot.location})")
                    .toList();
                return "${course.name} ${slots.join('\n\n${course.name} ')}";
              },
              popupProps: const PopupProps.menu(
                showSearchBox: true,
                // showSelectedItems: true,
              ),
              items: items,
              // selectedItem: selectedItem,
              dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(hintText: hint)),
              onChanged: onChanged))
    ]);
  }
}