import 'package:brink_app/dashboardfinal.dart' as DashBoard;
import 'package:brink_app/branch_placement_stats.dart';
import 'package:brink_app/placement_graph.dart';
import 'package:brink_app/placement_opportunities.dart';
import 'package:brink_app/six_month_intern_stats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PlacementSection extends StatelessWidget {  @override
Widget build(BuildContext context) {
  // TODO: implement build
  return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 4,
          centerTitle: true,
          backgroundColor: Color(0xFF3778FF),
          title: Text('Placement Records and Details',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 20,
              fontStyle: FontStyle.normal,
            ),),
        ),

        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 75),

              // upload image
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35, // 25% of screen height
                child: Image.asset(
                  'assets/img_1.png', // Path to your image file
                  fit: BoxFit.contain, // Adjust the image to cover the space
                ),
              ),

              const SizedBox(height: 30),



              const SizedBox(height:25),

              MaterialButton(
                minWidth: 300,
                height: 60,
                onPressed: (){
                  launchUrlString('https://docs.google.com/spreadsheets/d/1mvojxM1p5I1XNE96zGyqUDRWOm6XSuGc/edit?usp=sharing&ouid=112225135540589073224&rtpof=true&sd=true');
                },
                shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Color(0xFF3778FF),
                    ),
                    borderRadius: BorderRadius.circular(50)
                ),
                child: const Text(
                  "View Placement Records",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF3778FF),
                      fontSize: 18
                  ),
                ),
              ),
            ],
          ),
        ),
      )
  );
}
}



