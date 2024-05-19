import 'package:firebase_database/firebase_database.dart';

class UserDetails {
  String name;
  String currentLocation;
  String higherStudies;
  String examsPreparing;
  String workingInPSU;
  String govtJob;
  String preparingForGATE;
  String nextGATEExam;
  String previousGATEScore;
  String branchForGATE;
  String aimingForIT;
  String workingCurrently;
  String internedPreviously;
  String opportunitySource;
  String planningForJobSwitch;
  String resumeLink;
  String portfolioLink;
  String linkedInId;

  UserDetails({
    required this.name,
    required this.currentLocation,
    required this.higherStudies,
    required this.examsPreparing,
    required this.workingInPSU,
    required this.govtJob,
    required this.preparingForGATE,
    required this.nextGATEExam,
    required this.previousGATEScore,
    required this.branchForGATE,
    required this.aimingForIT,
    required this.workingCurrently,
    required this.internedPreviously,
    required this.opportunitySource,
    required this.planningForJobSwitch,
    required this.resumeLink,
    required this.portfolioLink,
    required this.linkedInId,
  });
  factory UserDetails.fromSnapshot(DataSnapshot snapshot) {
    Map<dynamic, dynamic>? data = snapshot.value as Map<dynamic, dynamic>?;

    return UserDetails(
      name: data?['name'] ?? '',
      currentLocation: data?['current_location'] ?? '',
      higherStudies: data?['higher_studies'] ?? '',
      examsPreparing: data?['exams_preparing'] ?? '',
      workingInPSU: data?['working_in_psu'] ?? '',
      govtJob: data?['govt_job'] ?? '',
      preparingForGATE: data?['preparing_for_gate'] ?? '',
      nextGATEExam: data?['next_gate_exam'] ?? '',
      previousGATEScore: data?['previous_gate_score'] ?? '',
      branchForGATE: data?['branch_for_gate'] ?? '',
      aimingForIT: data?['aiming_for_it'] ?? '',
      workingCurrently: data?['working_currently'] ?? '',
      internedPreviously: data?['interned_previously'] ?? '',
      opportunitySource: data?['opportunity_source'] ?? '',
      planningForJobSwitch: data?['planning_for_job_switch'] ?? '',
      resumeLink: data?['resume_link'] ?? '',
      portfolioLink: data?['portfolio_link'] ?? '',
      linkedInId: data?['linkedin_id'] ?? '',
    );
  }
}
