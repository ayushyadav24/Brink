import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'AluminiProfilePage.dart';
import 'FeaturePage_alumini.dart';
import 'Announcement_Page_alumini.dart';
import 'Student_Details_Alumini.dart';

class AlumniProfileApp extends StatelessWidget {
  const AlumniProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Welcome back!', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25, // 25% of screen height
            child: Image.asset(
              'assets/11.jpg', // Path to your image file
              fit: BoxFit.cover, // Adjust the image to cover the space
            ),
          ),
          const SizedBox(height: 10), // Add spacing
          const Text(
            'Features',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10), // Add spacing
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                // physics: const NeverScrollableScrollPhysics(), // Disable scrolling within GridView
                shrinkWrap: true, // Allow GridView to adapt its size within a Column
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: [
                  _buildResourceButton(
                    context,
                    'Alumini Profile',
                    const AluminiProfilePage(), // Link to UploadMarksScreen widget
                  ),
                  _buildResourceButton(
                    context,
                    'Placement Cell', // Change label to Timetable
                    const FeaturePage('Placement Cell'), // Link to TimetableScreen
                  ),
                  _buildResourceButton(
                    context,
                    'Announcement',
                    const AnnouncementsPage(),
                  ),
                  _buildResourceButton(
                    context,
                    'Student Details',
                    const StudentDetailsPage(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20), // Add spacing
          const SizedBox(height: 30)
        ],
      ),
    );
  }

  Widget _buildResourceButton(BuildContext context, String label, Widget screen) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(0xFF3778FF), // Updated background color
            boxShadow: const [
              BoxShadow(
                blurRadius: 8,
                color: Color(0xffbbd9f6fa),
                spreadRadius: 8,
                offset: Offset(20.0, 0),
              ),
            ],
            shape: BoxShape.rectangle,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.home,
                size: 40,
                color: Colors.white,
              ),
              const SizedBox(height: 5),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileTextField extends StatelessWidget {
  final String label;

  const ProfileTextField({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        TextFormField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: 'Enter $label',
          ),
        ),
      ],
    );
  }
}

