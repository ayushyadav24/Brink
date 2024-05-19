import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'models/userDetails_model.dart';
import 'formDetails.dart';

class ViewUserGoals extends StatefulWidget {
  final String userId;
  ViewUserGoals({required this.userId});
  @override
  State<ViewUserGoals> createState() => _ViewUserGoalsState();
}

class _ViewUserGoalsState extends State<ViewUserGoals> {
  late DatabaseReference _userRef;
  UserDetails? _userDetails;
  bool _isLoading = true;

  @override
  void initState() {
    _userRef = FirebaseDatabase.instance.ref().child('future_goals').child(widget.userId);
    super.initState();
    _fetchUserDetails();
  }

  Future<void> _fetchUserDetails() async {
    DatabaseEvent event = await _userRef.once();
    DataSnapshot snapshot = event.snapshot;

    if (snapshot.value != null) {
      final dataMap = snapshot.value as Map<dynamic, dynamic>;
      setState(() {
        _userDetails = UserDetails.fromSnapshot(snapshot);
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _userDetails == null
          ? Center(child: Text('No data available'))
          : FormDetails(userDetails: _userDetails!),
    );
  }
}
