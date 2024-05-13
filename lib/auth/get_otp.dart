import 'dart:developer';

import 'package:brink_app/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class getOtpScreen extends StatefulWidget {
  const getOtpScreen({super.key, required this.verificationId});
  final String verificationId;
  @override
  State<getOtpScreen> createState() => _getOtpScreenState();
}

class _getOtpScreenState extends State<getOtpScreen> {
  final otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF3778FF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'We have sent an OTP to your phone. \n Please Verify',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            TextFormField(
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Enter OTP',
                labelStyle: TextStyle(color: Colors.black),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
              controller: otpController,
            ),
            const SizedBox(height: 30),

            // Register button
            SizedBox(
              width: screenWidth * 0.8, // Take 80% of the screen width
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    final cred = PhoneAuthProvider.credential(
                        verificationId: widget.verificationId,
                        smsCode: otpController.text);

                    await FirebaseAuth.instance.signInWithCredential(cred);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WelcomeScreen(),
                        ));
                  } catch (e) {
                    log(e.toString());
                  }
                },
                // onPressed: () {
                //   Navigator.push(context, MaterialPageRoute(builder: (context) => const RoleBasedLoginScreen()));
                //   // Implement registration logic
                // },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white, // Black text
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Verify',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}