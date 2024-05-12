import 'package:flutter/material.dart';

class FacultyProfileScreen extends StatelessWidget {
  const FacultyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Faculty\'s Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey[200],
                    child: const Icon(
                      Icons.camera_alt,
                      size: 40,
                      color: Colors.grey,
                    ),
                  ),
                  const Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Text(
                      'Add Picture',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const ProfileTextField(label: 'Name'),
            const SizedBox(height: 10),
            const ProfileTextField(label: 'Designation'),
            const SizedBox(height: 10),
            const ProfileTextField(label: 'Department'),
            const SizedBox(height: 10),
            const ProfileTextField(label: 'Qualifications'),
            const SizedBox(height: 10),
            const ProfileTextField(label: 'Address'),
            const SizedBox(height: 10),
            const ProfileTextField(label: 'Phone Number'),
            const SizedBox(height: 10),
            const ProfileTextField(label: 'Email'),
            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                // Handle button press (upload data)
                // Add your upload data functionality here
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20), // Adjust button padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Adjust button border radius
                ),
                backgroundColor: Colors.blue, // Set button background color to blue
              ),
              child: const Text(
                'Upload Data', // Button text
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Set text color to white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class ProfileTextField extends StatelessWidget {
  final String label;

  const ProfileTextField({super.key, required this.label});

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