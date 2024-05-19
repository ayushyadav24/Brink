import 'package:flutter/material.dart';
import 'models/userDetails_model.dart';

class FormDetails extends StatelessWidget {
  final UserDetails userDetails;

  FormDetails({required this.userDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        backgroundColor: Color(0xFF3778FF),
        title: Text(
          'User Details',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildDetailRow('Name', userDetails.name),
            _buildDetailRow('Current Location', userDetails.currentLocation),
            _buildDetailRow('Higher Studies', userDetails.higherStudies),
            _buildDetailRow('Exams Preparing', userDetails.examsPreparing),
            _buildDetailRow('Working in PSU', userDetails.workingInPSU),
            _buildDetailRow('Govt Job', userDetails.govtJob),
            _buildDetailRow('Preparing for GATE', userDetails.preparingForGATE),
            _buildDetailRow('Next GATE Exam', userDetails.nextGATEExam),
            _buildDetailRow('Previous GATE Score', userDetails.previousGATEScore),
            _buildDetailRow('Branch for GATE', userDetails.branchForGATE),
            _buildDetailRow('Aiming for IT', userDetails.aimingForIT),
            _buildDetailRow('Working Currently', userDetails.workingCurrently),
            _buildDetailRow('Interned Previously', userDetails.internedPreviously),
            _buildDetailRow('Opportunity Source', userDetails.opportunitySource),
            _buildDetailRow('Planning for Job Switch', userDetails.planningForJobSwitch),
            _buildDetailRow('Resume Link', userDetails.resumeLink),
            _buildDetailRow('Portfolio Link', userDetails.portfolioLink),
            _buildDetailRow('LinkedIn ID', userDetails.linkedInId),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              '$label:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFF23395d),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
