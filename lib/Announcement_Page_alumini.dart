import 'package:flutter/material.dart';

class AnnouncementsPage extends StatefulWidget {
  const AnnouncementsPage({Key? key}) : super(key: key);

  @override
  createState() => _AnnouncementsPageState();
}

class _AnnouncementsPageState extends State<AnnouncementsPage> {
  String selectedBranch = 'Select Branch';
  String selectedYear = 'Select Year';
  String announcementMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Important Announcements'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.40, // 25% of screen height
              child: Image.asset(
                'assets/Announcement.jfif', // Path to your image file
                fit: BoxFit.cover, // Adjust the image to cover the space
              ),
            ),
            GestureDetector(
              onTap: () {
                _showAnnouncementDialog(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: 75,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.blue, width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Center(
                  child: Text(
                    'Tap to make an announcement',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  void _showAnnouncementDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Make an Announcement'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CustomDropdown<String>(
                items: const [
                  'Select Branch',
                  'Biotechnology',
                  'Mathematics and Computing',
                  'Chemical Engineering',
                  'Civil Engineering',
                  'Computer Science Engineering',
                  'Electronics and Communication',
                  'Electrical Engineering',
                  'Data Science',
                  'Industrial and Production',
                  'Information Technology',
                  'Electronics and VLSI',
                  'Instrumentation and Control',
                  'Textile Engineering'
                ],
                value: selectedBranch,
                itemToString: (item) => item,
                onChanged: (newValue) {
                  setState(() {
                    selectedBranch = newValue;
                  });
                },
              ),
              CustomDropdown<String>(
                items: const [
                  'Select Year',
                  'First Year',
                  'Second Year',
                  'Third Year',
                  'Final Year'
                ],
                value: selectedYear,
                itemToString: (item) => item,
                onChanged: (newValue) {
                  setState(() {
                    selectedYear = newValue;
                  });
                },
              ),
              const SizedBox(height: 10),
              TextField(
                onChanged: (value) {
                  announcementMessage = value;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Write the announcement',
                ),
                maxLines: null,
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement logic to make the announcement with selectedBranch,
                // selectedYear, and announcementMessage
                Navigator.of(context).pop();
              },
              child: const Text('Announce'),
            ),
          ],
        );
      },
    );
  }
}

class CustomDropdown<T> extends StatefulWidget {
  final List<T> items;
  final T value;
  final ValueChanged<T> onChanged;
  final String Function(T)? itemToString;

  const CustomDropdown({super.key,
    required this.items,
    required this.value,
    required this.onChanged,
    this.itemToString,
  });

  @override
  createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  late T _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      value: _value,
      onChanged: (newValue) {
        setState(() {
          _value = newValue as T;
          widget.onChanged(newValue);
        });
      },
      items: widget.items.map<DropdownMenuItem<T>>((item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(widget.itemToString?.call(item) ?? item.toString()),
        );
      }).toList(),
    );
  }
}
