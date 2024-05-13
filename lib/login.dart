import 'dart:developer';
import 'package:brink_app/AluminiProfile.dart';
import 'package:brink_app/auth/auth_services.dart';
import 'package:brink_app/dashboardfinal.dart';
import 'package:flutter/material.dart';
import 'faculty_home_page.dart';

class RoleBasedLoginScreen extends StatefulWidget {
  const RoleBasedLoginScreen({Key? key}) : super(key: key);

  @override
  _RoleBasedLoginScreenState createState() => _RoleBasedLoginScreenState();
}

class _RoleBasedLoginScreenState extends State<RoleBasedLoginScreen> {
  String _selectedRole = '';
  final _auth = AuthService();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    // Dispose the controllers when the screen is disposed to avoid memory leaks
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF3778FF),
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
            ToggleButtons(
              isSelected: [
                _selectedRole == 'Teacher',
                _selectedRole == 'Student',
                _selectedRole == 'Alumni',
              ],
              onPressed: (int newIndex) {
                setState(() {
                  // Reset the selected role and clear the text fields
                  _selectedRole = ['Teacher', 'Student', 'Alumni'][newIndex];
                  _email.clear();
                  _password.clear();
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
              controller: _email,
            ),
            const SizedBox(height: 15),
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
              controller: _password,
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: screenWidth * 0.8,
              child: ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
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

  _login() async {
    final user = await _auth.loginUserWithEmailAndPassword(
      _email.text,
      _password.text,
    );

    if (user != null && _selectedRole.isNotEmpty) {
      if (_selectedRole == 'Teacher') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FacultyHomePage()),
        );
      } else if (_selectedRole == 'Student') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StudentHomePage()),
        );
      } else if (_selectedRole == 'Alumni') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AlumniProfileApp()),
        );
      }
    }
  }
}

