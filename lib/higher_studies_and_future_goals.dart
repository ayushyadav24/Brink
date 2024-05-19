import 'package:brink_app/viewUserIDs.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'my_formText_field.dart';
import 'myButton_form.dart';
import 'formDetails.dart';
import 'package:brink_app/models/userDetails_model.dart';

class FutureGoals extends StatefulWidget {
  @override
  _FutureGoalsState createState() => _FutureGoalsState();
}

class _FutureGoalsState extends State<FutureGoals> {

  final _nameController = TextEditingController();
  final _currentLocationController = TextEditingController();
  final _higherStudiesController = TextEditingController();
  final _examsPreparingController = TextEditingController();
  final _workingInPSUController = TextEditingController();
  final _govtJobController = TextEditingController();
  final _preparingForGATEController = TextEditingController();
  final _nextGATEExamController = TextEditingController();
  final _previousGATEScoreController = TextEditingController();
  final _branchForGATEController = TextEditingController();
  final _aimingForITController = TextEditingController();
  final _workingCurrentlyController = TextEditingController();
  final _internedPreviouslyController = TextEditingController();
  final _opportunitySourceController = TextEditingController();
  final _planningForJobSwitchController = TextEditingController();
  final _resumeLinkController = TextEditingController();
  final _portfolioLinkController = TextEditingController();
  final _linkedInIdController = TextEditingController();

  final _productController = TextEditingController();
  final _productDesignController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // late DatabaseReference dbRef;

  Future<void> _submitData() async {
    if (_formKey.currentState!.validate()) {
      DatabaseReference reference = FirebaseDatabase.instance.ref().child('users');
      await reference.push().set({
        'name': _nameController.text,
        // Add other form data here
      });
      DatabaseReference ref = FirebaseDatabase.instance.ref().child('future_goals');
      await ref.push().set({
        'name': _nameController.text,
        'current_location': _currentLocationController.text,
        'higher_studies': _higherStudiesController.text,
        'exams_preparing': _examsPreparingController.text,
        'working_in_psu': _workingInPSUController.text,
        'govt_job': _govtJobController.text,
        'preparing_for_gate': _preparingForGATEController.text,
        'next_gate_exam': _nextGATEExamController.text,
        'previous_gate_score': _previousGATEScoreController.text,
        'branch_for_gate': _branchForGATEController.text,
        'aiming_for_it': _aimingForITController.text,
        'working_currently': _workingCurrentlyController.text,
        'interned_previously': _internedPreviouslyController.text,
        'opportunity_source': _opportunitySourceController.text,
        'planning_for_job_switch': _planningForJobSwitchController.text,
        'resume_link': _resumeLinkController.text,
        'portfolio_link': _portfolioLinkController.text,
        'linkedin_id': _linkedInIdController.text,
      });

      // Notify user of successful submission
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Data submitted successfully!'),
        ),
      );

      // Navigate to the details page and pass the user details
      UserDetails userDetails = UserDetails(
          name: _nameController.text,
          currentLocation: _currentLocationController.text,
          higherStudies: _higherStudiesController.text,
          examsPreparing: _examsPreparingController.text,
          workingInPSU: _workingInPSUController.text,
          govtJob: _govtJobController.text,
          preparingForGATE: _preparingForGATEController.text,
          nextGATEExam: _nextGATEExamController.text,
          previousGATEScore: _previousGATEScoreController.text,
          branchForGATE: _branchForGATEController.text,
          aimingForIT: _aimingForITController.text,
          workingCurrently: _workingCurrentlyController.text,
          internedPreviously: _internedPreviouslyController.text,
          opportunitySource: _opportunitySourceController.text,
          planningForJobSwitch: _planningForJobSwitchController.text,
          resumeLink: _resumeLinkController.text,
          portfolioLink: _portfolioLinkController.text,
        linkedInId: _linkedInIdController.text,
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FormDetails(userDetails: userDetails),
        ),
      );

      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => ViewUserNames(),
      //   ),
      // );

    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 4,
          centerTitle: false,
          backgroundColor: Color(0xFF3778FF),
          title: Text(
            'My Future Aspirations',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 20,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Add the Higher Studies and Your Future Goals in the Form Below - ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF23395d),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  MyTextField(
                    myController: _nameController,
                    fieldName: "Student Name",
                  ),
                  SizedBox(height: 5),
                  MyTextField(
                    myController: _currentLocationController,
                    fieldName: "Where are you currently?",
                  ),
                  SizedBox(height: 5),
                  MyTextField(
                    myController: _higherStudiesController,
                    fieldName: "Are you aiming for any higher studies?",
                  ),
                  SizedBox(height: 5),
                  MyTextField(
                    myController: _examsPreparingController,
                    fieldName: "Which exams are you preparing for?",
                  ),
                  SizedBox(height: 5),
                  MyTextField(
                    myController: _workingInPSUController,
                    fieldName: "Are you working in any PSU?",
                  ),
                  SizedBox(height: 5),
                  MyTextField(
                    myController: _govtJobController,
                    fieldName: "Do you have any Govt Job?",
                  ),
                  SizedBox(height: 5),
                  MyTextField(
                    myController: _preparingForGATEController,
                    fieldName: "Are you preparing for GATE examination?",
                  ),
                  SizedBox(height: 5),
                  MyTextField(
                    myController: _nextGATEExamController,
                    fieldName: "When will you be giving next GATE exam?",
                  ),
                  SizedBox(height: 5),
                  MyTextField(
                    myController: _previousGATEScoreController,
                    fieldName: "What was your previous GATE score and rank?",
                  ),
                  SizedBox(height: 5),
                  MyTextField(
                    myController: _branchForGATEController,
                    fieldName: "Which branch did you opt for GATE?",
                  ),
                  SizedBox(height: 5),
                  MyTextField(
                    myController: _aimingForITController,
                    fieldName: "Are you aiming to work in IT?",
                  ),
                  SizedBox(height: 5),
                  MyTextField(
                    myController: _workingCurrentlyController,
                    fieldName: "If yes, Where are you working currently?",
                  ),
                  SizedBox(height: 5),
                  MyTextField(
                    myController: _internedPreviouslyController,
                    fieldName: "Have you interned there previously?",
                  ),
                  SizedBox(height: 5),
                  MyTextField(
                    myController: _opportunitySourceController,
                    fieldName: "How did you get this opportunity (On/Offcampus)?",
                  ),
                  SizedBox(height: 5),
                  MyTextField(
                    myController: _planningForJobSwitchController,
                    fieldName: "Are you planning for job switch?",
                  ),
                  SizedBox(height: 5),
                  MyTextField(
                    myController: _resumeLinkController,
                    fieldName: "Share your resume link here.",
                  ),
                  SizedBox(height: 5),
                  MyTextField(
                    myController: _portfolioLinkController,
                    fieldName: "Share your portfolio link here.",
                  ),
                  SizedBox(height: 5),
                  MyTextField(
                    myController: _linkedInIdController,
                    fieldName: "Share your LinkedIn Id and mail Id.",
                  ),
                  MyButton(
                    OnPress: _submitData,
                    // OnPress: () {
                    //   if (_formKey.currentState!.validate()) {
                    //     UserDetails userDetails = UserDetails();
                    //     userDetails.productName = _productController.text;
                    //     userDetails.productDetails = _productDesignController.text;
                    //
                    //     // pass to new page
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => FormDetails(userDetails: userDetails),
                    //       ),
                    //     );
                    //   }
                    // },
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
