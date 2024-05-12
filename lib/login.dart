import 'package:flutter/material.dart';
import 'package:brink_app/splashscreen.dart';
import 'package:brink_app/splashscreen_t.dart';
import 'package:brink_app/splashscreen_a.dart';

class RoleBasedLoginScreen extends StatefulWidget {
  const RoleBasedLoginScreen({super.key});

  @override
  _RoleBasedLoginScreenState createState() => _RoleBasedLoginScreenState();
}

class _RoleBasedLoginScreenState extends State<RoleBasedLoginScreen> {
  String _selectedRole = '';

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF3778FF), // Background color
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            const Text(
              'Role Based Login',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            // Role selection buttons
            ToggleButtons(
              isSelected: [
                _selectedRole == 'Teacher',
                _selectedRole == 'Student',
                _selectedRole == 'Alumni',
              ],
              onPressed: (int newIndex) {
                setState(() {
                  _selectedRole = ['Teacher', 'Student', 'Alumni'][newIndex];
                });
              },
              borderRadius: BorderRadius.circular(20),
              fillColor: Colors.white,
              color: Colors.white,
              selectedColor: Colors.black,
              children: [
                _roleButton('Teacher'),
                _roleButton('Student'),
                _roleButton('Alumni'),
              ],
            ),
            const SizedBox(height: 30),
            // Email field
            TextFormField(
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 15),
            // Password field
            TextFormField(
              style: const TextStyle(color: Colors.white),
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Login button
            SizedBox(
              width: screenWidth * 0.8,
              child: ElevatedButton(
                onPressed: () {
                  if (_selectedRole.isNotEmpty) {
                    if (_selectedRole == 'Teacher') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Splash_Screen_t()),
                      );
                    } else if (_selectedRole == 'Student') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Splash_Screen()),
                      );
                    } else if (_selectedRole == 'Alumni') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Splash_Screen_a()),
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, backgroundColor: Colors.white, // Black text
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _roleButton(String role) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        role,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}

class TeacherDashboard extends StatelessWidget {
  const TeacherDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher Dashboard'),
      ),
      body: const Center(
        child: Text(
          'Welcome to Teacher Dashboard!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Dashboard'),
      ),
      body: const Center(
        child: Text(
          'Welcome to Student Dashboard!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class AlumniDashboard extends StatelessWidget {
  const AlumniDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alumni Dashboard'),
      ),
      body: const Center(
        child: Text(
          'Welcome to Alumni Dashboard!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

