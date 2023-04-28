import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../resources/constants/style.dart';
import '../../../resources/data/user_list.dart';
import '../../widgets/app_bar/my_app_bar.dart';
import '../../widgets/header_tag/header_tag.dart';
import '../../widgets/indicator/indicator.dart';
import '../../widgets/info_container/info_container.dart';
import '../../widgets/observation_info_container/observation_info_container.dart';
import '../../widgets/text_field/my_text_field.dart';
import '../users_list/users_list_screen.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  TextEditingController campusController = TextEditingController();
  TextEditingController departmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, title: "SOTL-System"),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20).copyWith(top: 40),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 100,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20,
                                  crossAxisCount: 2),
                          itemCount: facultyList.length,
                          itemBuilder: (context, index) {
                            return InfoContainer(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => UsersListScreen(
                                              title: facultyList[index]
                                                  ["name"])));
                                },
                                title: facultyList[index]["name"],
                                value: facultyList[index]["value"].toString());
                          }),
                      const SizedBox(height: 40),
                      const HeaderTag(title: "Observation Analytics"),
                      const SizedBox(height: 10),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        SizedBox(
                            width: width * 0.5,
                            child: MyTextField(
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
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Indicator(color: primary, text: "Informed"),
                            Indicator(color: active, text: "UnInformed"),
                            Indicator(color: secondary, text: "Completed")
                          ]),
                      const SizedBox(height: 20),
                      SizedBox(
                          height: 300,
                          child: BarChart(BarChartData(
                              borderData:
                                  FlBorderData(border: Border.all(color: grey)),
                              maxY: 10,
                              barGroups: [
                                BarChartGroupData(x: 1, barRods: [
                                  BarChartRodData(color: primary, toY: 5),
                                  BarChartRodData(color: active, toY: 9),
                                  BarChartRodData(color: secondary, toY: 7)
                                ]),
                                BarChartGroupData(x: 2, barRods: [
                                  BarChartRodData(color: primary, toY: 3),
                                  BarChartRodData(color: active, toY: 1),
                                  BarChartRodData(color: secondary, toY: 4)
                                ]),
                                BarChartGroupData(x: 3, barRods: [
                                  BarChartRodData(color: primary, toY: 6),
                                  BarChartRodData(color: active, toY: 9),
                                  BarChartRodData(color: secondary, toY: 7)
                                ]),
                                BarChartGroupData(x: 4, barRods: [
                                  BarChartRodData(color: primary, toY: 5),
                                  BarChartRodData(color: active, toY: 3),
                                  BarChartRodData(color: secondary, toY: 8)
                                ]),
                                BarChartGroupData(x: 5, barRods: [
                                  BarChartRodData(color: primary, toY: 5),
                                  BarChartRodData(color: active, toY: 6),
                                  BarChartRodData(color: secondary, toY: 7)
                                ])
                              ],
                              titlesData: FlTitlesData(
                                  bottomTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                          showTitles: true,
                                          getTitlesWidget: bottomTitles)),
                                  leftTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                          showTitles: true,
                                          interval: 1,
                                          getTitlesWidget: leftTitles)),
                                  topTitles: AxisTitles(
                                      sideTitles:
                                          SideTitles(showTitles: false)),
                                  rightTitles: AxisTitles(
                                      sideTitles:
                                          SideTitles(showTitles: false))),
                              backgroundColor: Colors.transparent))),
                      const SizedBox(height: 40),
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return const ObservationInfoContainer(
                                facultyName: "Sherazi Ahmed",
                                observerName: "Mansoor Ebrahim",
                                status: "Ongoing",
                                obsPeriod: "1/2/23 - 3/4/23");
                          })
                    ]))));
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style =
        TextStyle(color: grey, fontWeight: FontWeight.bold, fontSize: 14);
    String text;
    if (value == 0) {
      text = '1';
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
    final titles = <String>['Jan', 'Feb', 'Mar', 'April', 'May', 'June'];

    final Widget text = Text(titles[value.toInt()],
        style: const TextStyle(
            color: grey, fontWeight: FontWeight.normal, fontSize: 15));

    return SideTitleWidget(axisSide: meta.axisSide, child: text);
  }
}
