import 'package:flutter/material.dart';
import 'package:sotl/view/widgets/app_bar/my_app_bar.dart';
import '../../../resources/constants/style.dart';
import '../../widgets/header_tag/header_tag.dart';
import '../../widgets/search_bar/my_search_bar.dart';

class ObservationScreen extends StatelessWidget {
  ObservationScreen({super.key});

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(scaffoldKey, context, title: "Observations"),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              // Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              //   const HeaderTag(title: "Observations"),
              //   Container(
              //       decoration: BoxDecoration(
              //           color: primary,
              //           borderRadius: BorderRadius.circular(10)),
              //       child: IconButton(
              //           onPressed: () {},
              //           icon: const Icon(Icons.add, color: Colors.white)))
              // ]),
              // const SizedBox(height: 20),
              MySearchBar(
                  onTapSufix: () {},
                  sufixIcon: Icons.filter_list_rounded,
                  hint: "Search",
                  controller: searchController,
                  onChanged: (value) {}),
              const SizedBox(height: 40),
              Container(
                  padding: const EdgeInsets.all(5).copyWith(right: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(columns: [
                        DataColumn(label: Text("ID")),
                        DataColumn(label: Text("Course")),
                        DataColumn(label: Text("Faculty")),
                        DataColumn(label: Text("Observer")),
                        DataColumn(label: Text("HOD")),
                        DataColumn(label: Text("Date/Time")),
                        DataColumn(label: Text("Progress")),
                        DataColumn(label: Text("Status")),
                        DataColumn(label: Text(""))
                      ], rows: [
                        DataRow(cells: [
                          DataCell(Text("01")),
                          DataCell(Text("DAA")),
                          DataCell(Text("Krish")),
                          DataCell(Text("Haris")),
                          DataCell(Text("Dr. Mansoor")),
                          DataCell(Text(DateTime.now().toString())),
                          DataCell(Text("69%")),
                          DataCell(Text("Ongoing")),
                          DataCell(Icon(Icons.remove_red_eye_outlined))
                        ]),
                        DataRow(cells: [
                          DataCell(Text("02")),
                          DataCell(Text("DSA")),
                          DataCell(Text("Sheraz")),
                          DataCell(Text("Bilal")),
                          DataCell(Text("Dr. Mansoor")),
                          DataCell(Text(DateTime.now().toString())),
                          DataCell(Text("69%")),
                          DataCell(Text("Ongoing")),
                          DataCell(Icon(Icons.remove_red_eye_outlined))
                        ]),
                        DataRow(cells: [
                          DataCell(Text("03")),
                          DataCell(Text("DAA")),
                          DataCell(Text("Krish")),
                          DataCell(Text("Haris")),
                          DataCell(Text("Dr. Mansoor")),
                          DataCell(Text(DateTime.now().toString())),
                          DataCell(Text("69%")),
                          DataCell(Text("Ongoing")),
                          DataCell(Icon(Icons.remove_red_eye_outlined))
                        ]),
                        DataRow(cells: [
                          DataCell(Text("04")),
                          DataCell(Text("DSA")),
                          DataCell(Text("Sheraz")),
                          DataCell(Text("Bilal")),
                          DataCell(Text("Dr. Mansoor")),
                          DataCell(Text(DateTime.now().toString())),
                          DataCell(Text("69%")),
                          DataCell(Text("Ongoing")),
                          DataCell(Icon(Icons.remove_red_eye_outlined))
                        ]),
                        DataRow(cells: [
                          DataCell(Text("05")),
                          DataCell(Text("DAA")),
                          DataCell(Text("Krish")),
                          DataCell(Text("Haris")),
                          DataCell(Text("Dr. Mansoor")),
                          DataCell(Text(DateTime.now().toString())),
                          DataCell(Text("69%")),
                          DataCell(Text("Ongoing")),
                          DataCell(Icon(Icons.remove_red_eye_outlined))
                        ]),
                        DataRow(cells: [
                          DataCell(Text("06")),
                          DataCell(Text("DSA")),
                          DataCell(Text("Sheraz")),
                          DataCell(Text("Bilal")),
                          DataCell(Text("Dr. Mansoor")),
                          DataCell(Text(DateTime.now().toString())),
                          DataCell(Text("69%")),
                          DataCell(Text("Ongoing")),
                          DataCell(Icon(Icons.remove_red_eye_outlined))
                        ]),
                        DataRow(cells: [
                          DataCell(Text("07")),
                          DataCell(Text("DAA")),
                          DataCell(Text("Krish")),
                          DataCell(Text("Haris")),
                          DataCell(Text("Dr. Mansoor")),
                          DataCell(Text(DateTime.now().toString())),
                          DataCell(Text("69%")),
                          DataCell(Text("Ongoing")),
                          DataCell(Icon(Icons.remove_red_eye_outlined))
                        ]),
                        DataRow(cells: [
                          DataCell(Text("08")),
                          DataCell(Text("DSA")),
                          DataCell(Text("Sheraz")),
                          DataCell(Text("Bilal")),
                          DataCell(Text("Dr. Mansoor")),
                          DataCell(Text(DateTime.now().toString())),
                          DataCell(Text("69%")),
                          DataCell(Text("Ongoing")),
                          DataCell(Icon(Icons.remove_red_eye_outlined))
                        ])
                      ])))
            ])));
  }
}
