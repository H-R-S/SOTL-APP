import 'package:flutter/material.dart';
import 'package:sotl/routes/routes_name.dart';
import 'package:sotl/view/widgets/button/my_elevated_button.dart';

void showCourseBottomSheet(BuildContext context) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      showDragHandle: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          margin: const EdgeInsets.only(top: 0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 40),
              MyElevatedButton(
                  title: "Add Course",
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.addCourse);
                  }),
              const SizedBox(height: 20),
              MyElevatedButton(
                  title: "Assigned Course",
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.assignedCourse);
                  }),
              const SizedBox(height: 40)
            ],
          ),
        );
      });
}
