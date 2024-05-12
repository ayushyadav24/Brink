import 'package:flutter/material.dart';
import 'package:brink_app/faculty_home_page.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(MaterialApp(
    home: FacultyHomePage(),
  ));
}

class StudentAspirations extends StatelessWidget {
  const StudentAspirations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text('Student Goals',
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
                height: MediaQuery.of(context).size.height * 0.35, // 25% of screen height
                child: Image.asset(
                  'assets/img_1.png', // Path to your image file
                  fit: BoxFit.contain, // Adjust the image to cover the space
                ),
              ),

              const SizedBox(height: 30),



              const SizedBox(height:25),

              MaterialButton(
                minWidth: 300,
                height: 60,
                onPressed: (){
                  launchUrlString('https://docs.google.com/spreadsheets/d/1cTIuA7ALIfxc3NS-R2UCK1XVGUCXau4Q/edit?usp=sharing&ouid=117953397339168428723&rtpof=true&sd=true');
                },
                shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Color(0xFF3778FF),
                    ),
                    borderRadius: BorderRadius.circular(50)
                ),
                child: const Text(
                  "View Student Aspirations",
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
