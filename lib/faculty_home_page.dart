import 'package:brink_app/ShareNotesScreen.dart';
import 'package:brink_app/timetable_screen.dart';
import 'package:brink_app/upload_marks_screen.dart';
import 'package:flutter/material.dart';
import 'package:brink_app/faculty_profile_screen.dart';
import 'package:brink_app/StudentAspirations.dart';

class FacultyHomePage extends StatelessWidget {
  const FacultyHomePage({super.key});

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
              'assets/class.jpeg', // Path to your image file
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
                    'Upload Marks',
                    const SelectSubjectMarks(), // Link to UploadMarksScreen widget
                  ),
                  _buildResourceButton(
                    context,
                    'Timetable', // Change label to Timetable
                    const TimetableScreen(), // Link to TimetableScreen
                  ),
                  _buildResourceButton(
                    context,
                    'Share Notes',
                    const SelectSubjectNotes(),
                  ),
                  _buildResourceButton(
                    context,
                    'See student Aspirations',
                    const StudentAspirations(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20), // Add spacing
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FacultyProfileScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20), // Adjust button padding
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100), // Adjust button border radius
              ),
              backgroundColor: Colors.blueAccent, // Set button background color to blue
            ),
            child: const Text(
              'Faculty\'s Profile', // Button text
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Set text color to white
              ),
            ),
          ),
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

void main() {
  runApp(const MaterialApp(
    home: FacultyHomePage(),
  ));
}