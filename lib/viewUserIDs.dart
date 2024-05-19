import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'viewUserGoals.dart';

class ViewUserIDs extends StatefulWidget {
  @override
  State<ViewUserIDs> createState() => _ViewUserIDsState();
}

class _ViewUserIDsState extends State<ViewUserIDs> {
  late DatabaseReference _userRef;
  final List<String> _userIds = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    _userRef = FirebaseDatabase.instance.ref().child('future_goals');
    _fetchUserNames();
  }

  Future<void> _fetchUserNames() async {
    DatabaseEvent event = await _userRef.once();
    DataSnapshot snapshot = event.snapshot;

    if (snapshot.value != null) {
      snapshot.children.forEach((childSnapshot) {
        // final value = childSnapshot.value as Map<dynamic, dynamic>;
        // if (value['name'] != null) {
        //   String userName = value['name'];
        //   print("User name: $userName");
        //   _addUserName(userName);
        // }
        String id = childSnapshot.key ?? ''; // Get the ID of each child
        print("ID: $id");
        _addUserName(id);
      });
    }
  }

  void _addUserName(String userName) {
    setState(() {
      _userIds.add(userName);
      _listKey.currentState?.insertItem(_userIds.length - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3778FF),
        title: const Text(
          'Student Names',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: _userIds.length,
        itemBuilder: (context, index, animation) {
          return SizeTransition(
            sizeFactor: animation,
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: ListTile(
                leading: CircleAvatar( // Display a placeholder user icon
                  backgroundColor: Color(0xFF3778FF),
                  child: Icon(Icons.person, color: Colors.white),
                ),
                title: Text(
                  'Student ${index + 1}', // Display a generic user name
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Color(0xFF3778FF)),
                ),
                trailing: Icon(Icons.arrow_forward, color: Color(0xFF3778FF),),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewUserGoals(userId: _userIds[index]), // Pass the userId to ViewUserGoals
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
