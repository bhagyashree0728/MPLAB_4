import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = "", email = "", contact = "", rollNo = "";
  String hscCollege = "",
      hscYear = "",
      cgpa = "",
      percentage = "",
      courses = "";
  String linkedin = "", github = "", resumePath = "";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? "N/A";
      email = prefs.getString('email') ?? "N/A";
      contact = prefs.getString('contact') ?? "N/A";
      rollNo = prefs.getString('rollNo') ?? "N/A";
      hscCollege = prefs.getString('hscCollege') ?? "N/A";
      hscYear = prefs.getString('hscYear') ?? "N/A";
      cgpa = prefs.getString('cgpa') ?? "N/A";
      percentage = prefs.getString('percentage') ?? "N/A";
      courses = prefs.getString('courses') ?? "N/A";
      linkedin = prefs.getString('linkedin') ?? "";
      github = prefs.getString('github') ?? "";
      resumePath = prefs.getString('resume') ?? "";
    });
  }

  void pickResume() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('resume', result.files.single.path!);
      setState(() {
        resumePath = result.files.single.path!;
      });
    }
  }

  void openResume() {
    if (resumePath.isNotEmpty) {
      File file = File(resumePath);
      if (file.existsSync()) {
        // Open the PDF using a third-party package like `open_file`
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Theme Consistency
      appBar: AppBar(
        title: Text("My Profile"),
        backgroundColor: Color(0xFF0A3D62), // Dark Blue Theme
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // Profile Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey.shade200,
                      child: Icon(
                        Icons.person,
                        size: 50,
                        color: Color(0xFF0A3D62),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0A3D62),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      email,
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            // Details Card
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    profileInfoTile(Icons.phone, "Contact", contact),
                    profileInfoTile(
                      Icons.confirmation_number,
                      "Roll No",
                      rollNo,
                    ),
                    profileInfoTile(Icons.school, "HSC College", hscCollege),
                    profileInfoTile(Icons.calendar_today, "HSC Year", hscYear),
                    profileInfoTile(Icons.bar_chart, "CGPA", cgpa),
                    profileInfoTile(Icons.percent, "Percentage", percentage),
                    profileInfoTile(Icons.book, "Additional Courses", courses),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            // Resume Upload & View
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Text(
                      "Resume",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0A3D62),
                      ),
                    ),
                    SizedBox(height: 10),
                    resumePath.isNotEmpty
                        ? Column(
                          children: [
                            Text(
                              "Resume Uploaded",
                              style: TextStyle(color: Colors.green),
                            ),
                            SizedBox(height: 10),
                            ElevatedButton.icon(
                              onPressed: openResume,
                              icon: Icon(Icons.picture_as_pdf),
                              label: Text("View Resume"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                              ),
                            ),
                          ],
                        )
                        : ElevatedButton.icon(
                          onPressed: pickResume,
                          icon: Icon(Icons.upload_file),
                          label: Text("Upload Resume"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF0A3D62),
                          ),
                        ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            // LinkedIn & GitHub Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                linkedin.isNotEmpty
                    ? socialButton("LinkedIn", Icons.link, linkedin)
                    : socialButton(
                      "Add LinkedIn",
                      Icons.add_link,
                      "https://linkedin.com",
                    ),
                github.isNotEmpty
                    ? socialButton("GitHub", Icons.code, github)
                    : socialButton(
                      "Add GitHub",
                      Icons.code,
                      "https://github.com",
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget profileInfoTile(IconData icon, String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Icon(icon, color: Color(0xFF0A3D62), size: 24),
          SizedBox(width: 10),
          Text(
            "$title: ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 16, color: Colors.black87),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget socialButton(String label, IconData icon, String url) {
    return ElevatedButton.icon(
      onPressed: () async {
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Cannot open $label")));
        }
      },
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF0A3D62),
        foregroundColor: Colors.white,
        textStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
