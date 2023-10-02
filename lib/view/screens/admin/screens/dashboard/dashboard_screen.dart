import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sotl/routes/routes_name.dart';
import '../../../../../resources/constants/style.dart';
import '../../../../../view_models/user/user_view_model.dart';
import '../../../../widgets/app_bar/my_app_bar.dart';
import '../../../../widgets/header_tag/header_tag.dart';
import '../../../../widgets/indicator/indicator.dart';
import '../../../../widgets/text_field/my_text_field.dart';
import '../../widgets/welcome_container.dart';
import 'widgets/observations_list.dart';
import 'widgets/user_records.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final TextEditingController campusController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();

  bool isHOD = false;
  bool setStateOnce = false;
  String userName = "";

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);

    userViewModel.getUser().then((value) {
      debugPrint("role: ${value.role}");
      if (context.mounted) {
        if (setStateOnce == false) {
          setState(() {
            setStateOnce = true;
            if (value.role == "Head_of_Department") {
              isHOD = true;
            }
            userName = value.name!;
          });
        }
      }
    });

    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: MyAppBar(
            title: "SOTL SYSTEM",
            isActionButtonCircle: false,
            onTapAction: () {
              Navigator.pushNamed(context, RoutesName.notification);
            },
            actionIcon: Icons.notifications_none_outlined),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20).copyWith(top: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hi $userName,", style: Styles.h1),
                      const SizedBox(height: 15),
                      const SotlWelcomeContainer(),
                      const SizedBox(height: 25),
                      const UserRecords(),
                      const SizedBox(height: 40),
                      const HeaderTag(title: "Observation Analytics"),
                      const SizedBox(height: 10),
                      graph(width: width),
                      const SizedBox(height: 40),
                      const HeaderTag(title: "Observations"),
                      const SizedBox(height: 10),
                      const ObservationsList()
                    ]))));
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style =
        TextStyle(color: grey, fontWeight: FontWeight.bold, fontSize: 14);
    String text;
    if (value == 0) {
      text = '0';
    } else if (value == 5) {
      text = '5';
    } else if (value == 10) {
      text = '10';
    } else {
      return Container();
    }
    return SideTitleWidget(
        axisSide: meta.axisSide, space: 5, child: Text(text, style: style));
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>['Spring', 'Summer', 'Fall'];

    final Widget text = Text(titles[value.toInt()],
        style: const TextStyle(
            color: grey, fontWeight: FontWeight.normal, fontSize: 15));

    return SideTitleWidget(axisSide: meta.axisSide, child: text);
  }

  Widget graph({required double width}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          SizedBox(
              width: width * 0.5,
              child: MyTextField(
                  isReadable: true,
                  dropDownList: const [
                    "Main Campus",
                    "Bahria Campus",
                    "North Campus",
                    "Gulshan Campus",
                    "Airport Campus"
                  ],
                  contentPadding: 10,
                  controller: campusController,
                  hint: "Select Campus"))
        ]),
        const SizedBox(height: 20),
        const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Indicator(color: active, text: "Pending"),
          Indicator(color: secondary, text: "Ongoing"),
          Indicator(color: primary, text: "Completed"),
        ]),
        const SizedBox(height: 20),
        SizedBox(
            height: 300,
            child: BarChart(BarChartData(
                borderData: FlBorderData(border: Border.all(color: grey)),
                maxY: 10,
                barGroups: [
                  BarChartGroupData(x: 1, barRods: [
                    BarChartRodData(color: primary, toY: 0),
                    BarChartRodData(color: active, toY: 4),
                    BarChartRodData(color: secondary, toY: 0)
                  ]),
                ],
                titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                            showTitles: true, getTitlesWidget: bottomTitles)),
                    leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                            showTitles: true,
                            interval: 1,
                            getTitlesWidget: leftTitles)),
                    topTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false))),
                backgroundColor: Colors.transparent))),
      ],
    );
  }
}
