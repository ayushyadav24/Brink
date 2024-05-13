import 'dart:developer';

import 'package:brink_app/auth/get_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class phoneLoginScreen extends StatefulWidget {
  @override
  State<phoneLoginScreen> createState() => _phoneLoginScreenState();
}

class _phoneLoginScreenState extends State<phoneLoginScreen> {
  String _selectedRole = '';
  final phoneController = TextEditingController();

  @override
  void dispose() {
    // Dispose the controllers when the screen is disposed to avoid memory leaks
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      backgroundColor: const Color(0xFF3778FF),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 30),
            const Text(
              'Login Using Phone number',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
            TextFormField(
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Enter Phone Number',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              controller: phoneController,
            ),

            const SizedBox(height: 30),
            SizedBox(
              width: screenWidth * 0.8,
              child: ElevatedButton(
                onPressed: () async {
                  FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: phoneController.text,
                    verificationCompleted: (phoneAuthCredential) {},
                    verificationFailed: (error) {
                      log(error.toString());
                    },
                    codeSent: (verificationId, forceResendingToken) {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => getOtpScreen(verificationId: verificationId)));
                    },

                    codeAutoRetrievalTimeout: (verificationId) {
                      log("Auto Retireval timeout");
                    },
                  );
                },

                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Get OTP',
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
}