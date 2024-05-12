import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Announcement_Page_alumini.dart';


class StudentDetailsPage extends StatefulWidget {
  const StudentDetailsPage({Key? key}) : super(key: key);

  @override
  createState() => _StudentDetailsPageState();
}

class _StudentDetailsPageState extends State<StudentDetailsPage> {
  String selectedBranch = 'Select Branch';
  String selectedYear = 'Select Year';
  bool showStudentDetailsButton = false;

  get error => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Student Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25, // 25% of screen height
              child: Image.asset(
                'assets/Student_info.png', // Path to your image file
                fit: BoxFit.cover, // Adjust the image to cover the space
              ),
            ),

            const SizedBox(height: 30),
            CustomDropdown<String>(
              items: const [
                'Select Branch',
                'Biotechnology',
                'Mathematics and Computing',
                'Chemical Engineering',
                'Civil Engineering',
                'Computer Science Engineering',
                'Electronics and Communication',
                'Electrical Engineering',
                'Data Science',
                'Industrial and Production',
                'Information Technology',
                'Electronics and VLSI',
                'Instrumentation and Control',
                'Textile Engineering'
              ],
              value: selectedBranch,
              onChanged: (newValue) {
                setState(() {
                  selectedBranch = newValue;
                  checkIfShowButton();
                });
              },
            ),
            const SizedBox(height: 30),
            CustomDropdown<String>(
              items: const [
                'Select Year',
                'First Year',
                'Second Year',
                'Third Year',
                'Final Year'
              ],
              value: selectedYear,
              onChanged: (newValue) {
                setState(() {
                  selectedYear = newValue;
                  checkIfShowButton();
                });
              },
            ),
            const SizedBox(height: 30),
            if (showStudentDetailsButton)
              ElevatedButton(
                onPressed: () {
                  if (selectedBranch != 'Select Branch' && selectedYear != 'Select Year') {
                    String url = 'https://docs.google.com/spreadsheets/d/1cTIuA7ALIfxc3NS-R2UCK1XVGUCXau4Q/edit?usp=sharing&ouid=117953397339168428723&rtpof=true&sd=true';
                    url += '&branch=$selectedBranch&year=$selectedYear';
                    launchUrl(Uri.parse(url)).catchError((error));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please select both branch and year.')),
                    );
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                child: const Text('Student Details', style: TextStyle(color: Colors.white)),
              ),
          ],
        ),
      ),
    );
  }

  void checkIfShowButton() {
    if (selectedBranch != 'Select Branch' && selectedYear != 'Select Year') {
      setState(() {
        showStudentDetailsButton = true;
      });
    } else {
      setState(() {
        showStudentDetailsButton = false;
      });
    }
  }
}