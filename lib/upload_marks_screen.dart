import 'package:brink_app/faculty_home_page.dart';
import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

class SelectSubjectMarks extends StatefulWidget {
  const SelectSubjectMarks({Key? key}) : super(key: key);

  @override
  _SelectSubjectState createState() => _SelectSubjectState();
}

class _SelectSubjectState extends State<SelectSubjectMarks> {
  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
  TextEditingController _controller = TextEditingController();
  List<String> subjects = [
    'Instrumentation System Design',
    'Industrial Safety',
    'Digital Image Processing',
    'Advanced Sensors',
    'Advanced Process Control',
    'Industrial Automation and Robotics',
    'Physiological Control System',
    'Circuit Theory',
    'Electrical Measurements and Measuring Instruments',
    'Electronic Devices and Analog Integrated Circuits',
    'Numerical Methods',
    'EMF Theory',
    'Electrical Machines',
    'Transducers and Signal Conditioning',
    'Industrial Measurement System',
    'Electrical Power System',
    'Data Structures and Algorithms',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Select the Subject!',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
      body: Center(

        child: Padding(
          padding: const EdgeInsets.all(20.0),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25, // 25% of screen height
                child: Image.asset(
                  'assets/upload_marks.jpg', // Path to your image file
                  fit: BoxFit.contain, // Adjust the image to cover the space
                ),
              ),
              const SizedBox(height: 40), // Add spacing
              AutoCompleteTextField<String>(
                key: key,
                clearOnSubmit: false,
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Enter Subject Name',
                  border: OutlineInputBorder(),
                ),
                suggestions: subjects,
                itemBuilder: (BuildContext context, String suggestion) {
                  return ListTile(
                    title: Text(suggestion),
                  );
                },
                itemFilter: (String suggestion, String query) {
                  return suggestion.toLowerCase().startsWith(query.toLowerCase());
                },
                itemSorter: (String a, String b) {
                  return a.compareTo(b);
                },
                itemSubmitted: (String suggestion) {
                  _controller.text = suggestion;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Logic to proceed to the next screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UploadMarksScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16), // Adjust button padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Adjust button border radius
                  ),
                  backgroundColor: Colors.blueAccent, // Set button background color to blue
                ),
                child: const Text(
                  'Proceed', // Button text
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Set text color to white
                  ),
                ), // Button text
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class UploadMarksScreen extends StatelessWidget {
  const UploadMarksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 4,
          centerTitle: true,
          backgroundColor: Color(0xFF3778FF),
          title: Text('Upload Marks',
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
              const SizedBox(height: 85),
              // upload image
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25, // 25% of screen height
                  child: Image.asset(
                    'assets/upload_marks.jpg', // Path to your image file
                    fit: BoxFit.contain, // Adjust the image to cover the space
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // upload document button

              MaterialButton(
                minWidth: 300,
                height: 60,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const FacultyHomePage()));

                },
                // defining the shape
                shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Color(0xFF3778FF),
                    ),
                    borderRadius: BorderRadius.circular(50)
                ),
                child: const Text(
                  "Attach Marks List",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF3778FF),
                      fontSize: 18
                  ),
                ),
              ),


              // creating the view document button

              const SizedBox(height:25),

              MaterialButton(
                minWidth: 300,
                height: 60,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const FacultyHomePage()));

                },
                color: const Color(0xFF3778FF),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)
                ),
                child: const Text(
                  "Upload",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18
                  ),
                ),
              ),
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
