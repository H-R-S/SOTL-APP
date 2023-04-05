import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../resources/constants/style.dart';
import '../../widgets/app_bar/my_app_bar.dart';
import '../../widgets/info_container/info_container.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final double width = 7;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 5, 12);
    final barGroup2 = makeGroupData(1, 16, 12);
    final barGroup3 = makeGroupData(2, 18, 5);
    final barGroup4 = makeGroupData(3, 20, 16);
    final barGroup5 = makeGroupData(4, 17, 6);
    final barGroup6 = makeGroupData(5, 19, 1.5);
    final barGroup7 = makeGroupData(6, 10, 1.5);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: MyAppBar(scaffoldKey, context, title: "SOTL Systems"),
            body: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(children: [
                    GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisExtent: 70,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                crossAxisCount: 2),
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return const InfoContainer(
                              title: "Observers", value: "32");
                        }),
                    const SizedBox(height: 40),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade300),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text(
                                    'Observation',
                                    style:
                                        TextStyle(color: primary, fontSize: 22),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    'Analytics',
                                    style: TextStyle(
                                        color: Color(0xff77839a), fontSize: 16),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 38,
                              ),
                              Expanded(
                                child: BarChart(
                                  BarChartData(
                                    maxY: 20,
                                    barTouchData: BarTouchData(
                                      touchTooltipData: BarTouchTooltipData(
                                        tooltipBgColor: Colors.grey,
                                        getTooltipItem: (a, b, c, d) => null,
                                      ),
                                      touchCallback:
                                          (FlTouchEvent event, response) {
                                        if (response == null ||
                                            response.spot == null) {
                                          setState(() {
                                            touchedGroupIndex = -1;
                                            showingBarGroups =
                                                List.of(rawBarGroups);
                                          });
                                          return;
                                        }

                                        touchedGroupIndex =
                                            response.spot!.touchedBarGroupIndex;

                                        setState(() {
                                          if (!event
                                              .isInterestedForInteractions) {
                                            touchedGroupIndex = -1;
                                            showingBarGroups =
                                                List.of(rawBarGroups);
                                            return;
                                          }
                                          showingBarGroups =
                                              List.of(rawBarGroups);
                                          if (touchedGroupIndex != -1) {
                                            var sum = 0.0;
                                            for (final rod in showingBarGroups[
                                                    touchedGroupIndex]
                                                .barRods) {
                                              sum += rod.toY;
                                            }
                                            final avg = sum /
                                                showingBarGroups[
                                                        touchedGroupIndex]
                                                    .barRods
                                                    .length;

                                            showingBarGroups[
                                                    touchedGroupIndex] =
                                                showingBarGroups[
                                                        touchedGroupIndex]
                                                    .copyWith(
                                              barRods: showingBarGroups[
                                                      touchedGroupIndex]
                                                  .barRods
                                                  .map((rod) {
                                                return rod.copyWith(
                                                    toY: avg, color: primary);
                                              }).toList(),
                                            );
                                          }
                                        });
                                      },
                                    ),
                                    titlesData: FlTitlesData(
                                      show: true,
                                      rightTitles: AxisTitles(
                                        sideTitles:
                                            SideTitles(showTitles: false),
                                      ),
                                      topTitles: AxisTitles(
                                        sideTitles:
                                            SideTitles(showTitles: false),
                                      ),
                                      bottomTitles: AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: true,
                                          getTitlesWidget: bottomTitles,
                                          reservedSize: 42,
                                        ),
                                      ),
                                      leftTitles: AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: true,
                                          reservedSize: 28,
                                          interval: 1,
                                          getTitlesWidget: leftTitles,
                                        ),
                                      ),
                                    ),
                                    borderData: FlBorderData(
                                      show: false,
                                    ),
                                    barGroups: showingBarGroups,
                                    gridData: FlGridData(show: false),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ])),
            )));
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    if (value == 0) {
      text = '10';
    } else if (value == 10) {
      text = '50';
    } else if (value == 19) {
      text = '100';
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>['Mn', 'Te', 'Wd', 'Tu', 'Fr', 'St', 'Su'];

    final Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: Colors.yellow,
          width: width,
        ),
        BarChartRodData(
          toY: y2,
          color: primary,
          width: width,
        ),
      ],
    );
  }

  Widget makeTransactionsIcon() {
    const width = 4.5;
    const space = 3.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 42,
          color: Colors.white.withOpacity(1),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
      ],
    );
  }
}
