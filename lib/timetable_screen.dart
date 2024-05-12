import 'package:flutter/material.dart';
import 'package:brink_app/faculty_home_page.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(MaterialApp(
    home: FacultyHomePage(),
  ));
}

class TimetableScreen extends StatelessWidget {
  const TimetableScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('TIMETABLE',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 75),

              // upload image
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25, // 25% of screen height
                child: Image.asset(
                  'assets/time_table_clg.png', // Path to your image file
                  fit: BoxFit.scaleDown, // Adjust the image to cover the space
                ),
              ),

              const SizedBox(height: 70),



              const SizedBox(height:25),

              MaterialButton(
                minWidth: 300,
                height: 60,
                onPressed: (){
                  launchUrlString('https://xceed.nitj.ac.in/timetable');
                },
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Color(0xFF3778FF),
                      ),
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: const Text(
                    "View Time Table",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF3778FF),
                        fontSize: 18
                    ),
                  ),
              ),
            ],
          ),
        )
    );
  }
}
