import 'package:responsive_design/presentation/utils/screen_utils.dart';
import 'package:responsive_design/presentation/widgets/call_to_action.dart';
import 'package:responsive_design/presentation/widgets/course_details.dart';
import 'package:responsive_design/presentation/widgets/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:responsive_design/presentation/widgets/navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final DeviceType deviceType = ScreenUtils.getDeviceType(size.width);

    return SafeArea(
      child: Scaffold(
        drawer: deviceType == DeviceType.mobile ? const NavigationBars() : null,
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: deviceType == DeviceType.mobile
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: const [
              Text(
                "HUMMING\nBIRD .",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
          actions: [
            deviceType == DeviceType.mobile
                ? const SizedBox(width: 10)
                : const Row(children: [
                    Text("Episodes"),
                    SizedBox(width: 40),
                    Text("About"),
                    SizedBox(width: 40)
                  ]),
          ],
        ),
        body: SingleChildScrollView(
          child: ResponsiveBuilder(
            mobile: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                const CourseDetails(),
                const SizedBox(height: 40),
                SizedBox(width: size.width * 0.8, child: const CallToAction()),
              ],
            ),
            tablet: const Padding(
              padding: EdgeInsets.all(40.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CourseDetails(),
                      SizedBox(height: 40),
                      CallToAction(),
                    ],
                  )
                ],
              ),
            ),
            desktop: const Padding(
              padding: EdgeInsets.all(40.0),
              child: Column(
                children: [
                  SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CourseDetails(),
                      Expanded(
                        child: Center(
                          child: CallToAction(),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
