import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class FeaturePage extends StatelessWidget {
  final String featureName;

  const FeaturePage(this.featureName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(featureName),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 75),
            //
            // // upload image
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.35, // 25% of screen height
            //   child: Image.asset(
            //     'assets/TT.jpg', // Path to your image file
            //     fit: BoxFit.fitWidth, // Adjust the image to cover the space
            //   ),
            // ),
            //
            // const SizedBox(height: 30),
            // const SizedBox(height:25),
            MaterialButton(
              minWidth: 300,
              height: 60,
              onPressed: (){
                launchUrlString('https://ctp.nitj.ac.in/');
              },
              shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Color(0xFF3778FF),
                  ),
                  borderRadius: BorderRadius.circular(50)
              ),
              child: const Text(
                "TPO",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF3778FF),
                    fontSize: 18
                ),
              ),
            ),
            const SizedBox(height: 30),
            MaterialButton(
              minWidth: 300,
              height: 60,
              onPressed: (){
                launchUrlString('https://ctp.nitj.ac.in/index_placements');
              },
              shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Color(0xFF3778FF),
                  ),
                  borderRadius: BorderRadius.circular(50)
              ),
              child: const Text(
                "Placements",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF3778FF),
                    fontSize: 18
                ),
              ),
            ),
            const SizedBox(height: 30),
            MaterialButton(
              minWidth: 300,
              height: 60,
              onPressed: (){
                launchUrlString('https://ctp.nitj.ac.in/index_wrecruit');
              },
              shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Color(0xFF3778FF),
                  ),
                  borderRadius: BorderRadius.circular(50)
              ),
              child: const Text(
                "Why Recruit?",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF3778FF),
                    fontSize: 18
                ),
              ),
            ),
            const SizedBox(height: 30),
            MaterialButton(
              minWidth: 300,
              height: 60,
              onPressed: (){
                launchUrlString('https://ctp.nitj.ac.in/index_internship');
              },
              shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Color(0xFF3778FF),
                  ),
                  borderRadius: BorderRadius.circular(50)
              ),
              child: const Text(
                "Internships",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF3778FF),
                    fontSize: 18
                ),
              ),
            ),
            const SizedBox(height: 30),
            MaterialButton(
              minWidth: 300,
              height: 60,
              onPressed: (){
                launchUrlString('https://ctp.nitj.ac.in/index_download');
              },
              shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Color(0xFF3778FF),
                  ),
                  borderRadius: BorderRadius.circular(50)
              ),
              child: const Text(
                "Downloads",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF3778FF),
                    fontSize: 18
                ),
              ),
            ),
            const SizedBox(height: 30),
            MaterialButton(
              minWidth: 300,
              height: 60,
              onPressed: (){
                launchUrlString('https://ctp.nitj.ac.in/index_people');
              },
              shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Color(0xFF3778FF),
                  ),
                  borderRadius: BorderRadius.circular(50)
              ),
              child: const Text(
                "People",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF3778FF),
                    fontSize: 18
                ),
              ),
            ),
            const SizedBox(height: 30),
            MaterialButton(
              minWidth: 300,
              height: 60,
              onPressed: (){
                launchUrlString('mailto:ctp@nitj.ac.in');
              },
              shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Color(0xFF3778FF),
                  ),
                  borderRadius: BorderRadius.circular(50)
              ),
              child: const Text(
                "Contact",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF3778FF),
                    fontSize: 18
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, [String? url]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: ElevatedButton(
          onPressed: () {
            if (url != null) {
              _launchURL(url);
            } else {
              _showContactDialog(context);
            }
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            backgroundColor: Colors.blue,
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _showContactDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Contact'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  _launchURL('mailto:ctp@nitj.ac.in');
                },
                child: const Text(
                  'Mail: ctp@nitj.ac.in',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _launchURL('https://www.linkedin.com/company/centre-of-training-and-placement-national-institute-of-technology-jalandhar/');
                },
                child: const Text(
                  'LinkedIn: Centre of Training and Placement, NIT Jalandhar',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
