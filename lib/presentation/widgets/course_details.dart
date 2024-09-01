import 'package:flutter/material.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      //color: Colors.amber,
      width: 600,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "FLUTTER WEB.\nTHE BASICS",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w800, fontSize: 50, height: 1.2),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'In this course we will go over the basics of using Flutter Web for website development.Topics will include Responsive Layout, Deploying, Font Changes, Hover Functionality, Modals and more.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, height: 1.7),
          )
        ],
      ),
    );
  }
}
