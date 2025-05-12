import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController rollNoController = TextEditingController();
  TextEditingController hscCollegeController = TextEditingController();
  TextEditingController hscYearController = TextEditingController();
  TextEditingController cgpaController = TextEditingController();
  TextEditingController percentageController = TextEditingController();
  TextEditingController coursesController = TextEditingController();
  TextEditingController linkedinController = TextEditingController();
  TextEditingController githubController = TextEditingController();

  void saveData() async {
    if (_formKey.currentState!.validate()) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('name', nameController.text);
      await prefs.setString('email', emailController.text);
      await prefs.setString('contact', contactController.text);
      await prefs.setString('rollNo', rollNoController.text);
      await prefs.setString('hscCollege', hscCollegeController.text);
      await prefs.setString('hscYear', hscYearController.text);
      await prefs.setString('cgpa', cgpaController.text);
      await prefs.setString('percentage', percentageController.text);
      await prefs.setString('courses', coursesController.text);
      await prefs.setString('linkedin', linkedinController.text);
      await prefs.setString('github', githubController.text);

      // Show success popup
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: Text("Success"),
              content: Text("Your data has been saved successfully!"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("OK"),
                ),
              ],
            ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Consistent Theme
      appBar: AppBar(
        title: Text("Student Registration"),
        backgroundColor: Color(0xFF0A3D62), // Dark Blue Theme
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField(nameController, "Name", Icons.person),
              _buildTextField(emailController, "Email", Icons.email),
              _buildTextField(contactController, "Contact", Icons.phone),
              _buildTextField(
                rollNoController,
                "Roll No",
                Icons.confirmation_number,
              ),
              _buildTextField(
                hscCollegeController,
                "HSC College",
                Icons.school,
              ),
              _buildTextField(
                hscYearController,
                "HSC Year",
                Icons.calendar_today,
              ),
              _buildTextField(cgpaController, "CGPA", Icons.bar_chart),
              _buildTextField(
                percentageController,
                "Percentage",
                Icons.percent,
              ),
              _buildTextField(
                coursesController,
                "Additional Courses",
                Icons.book,
              ),
              _buildTextField(
                linkedinController,
                "LinkedIn Profile",
                Icons.link,
              ),
              _buildTextField(githubController, "GitHub Profile", Icons.code),

              SizedBox(height: 15),

              // Resume Upload Button
              ElevatedButton.icon(
                onPressed: () {
                  // TODO: Implement file picker
                },
                icon: Icon(Icons.upload_file),
                label: Text("Upload Resume"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0A3D62),
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              SizedBox(height: 20),

              // Submit Button
              ElevatedButton(
                onPressed: saveData,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Success Button
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Submit",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Reusable TextField Widget with Icon
  Widget _buildTextField(
    TextEditingController controller,
    String label,
    IconData icon,
  ) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Color(0xFF0A3D62)), // Themed Icon
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF0A3D62),
              width: 2,
            ), // Themed Focus
          ),
        ),
        validator: (value) => value!.isEmpty ? "Required" : null,
      ),
    );
  }
}
