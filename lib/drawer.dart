import 'package:flutter/material.dart';
import 'package:lab4/companies.dart';
import 'package:lab4/placement_stats.dart';
import 'home.dart';
import 'registration.dart';
import 'profile.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white, // Light Background
      child: Column(
        children: [
          // 🔹 Expanded Drawer Header for Full Width
          Container(
            width: double.infinity, // Full width
            decoration: BoxDecoration(color: Color(0xFF0A3D62)), // Dark Blue
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30), // Increased height
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50, // Larger Logo
                    backgroundImage: AssetImage(
                      "assets/images/spitlogo.png",
                    ), // College Logo
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(height: 12),
                  Text(
                    "TPO Menu",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26, // Larger Text
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 🔹 Menu Items with Unique Icons
          _buildDrawerItem(
            icon: Icons.dashboard_rounded,
            title: "Home",
            context: context,
            page: HomePage(),
          ),
          _buildDrawerItem(
            icon: Icons.assignment_rounded,
            title: "Registration",
            context: context,
            page: RegistrationPage(),
          ),
          _buildDrawerItem(
            icon: Icons.account_circle_rounded,
            title: "Profile",
            context: context,
            page: ProfilePage(),
          ),
          _buildDrawerItem(
            icon: Icons.business_rounded,
            title: "Companies",
            context: context,
            page: CompaniesPage(), // Replace with CompaniesPage() if available
          ),
          _buildDrawerItem(
            icon: Icons.bar_chart_rounded,
            title: "Placement Stats",
            context: context,
            page:
                PlacementStatsPage(), // Replace with a placeholder or another available page
          ),

          Spacer(), // Push Logout button to the bottom
          // 🔹 Logout Button
          ListTile(
            leading: Icon(Icons.exit_to_app_rounded, color: Colors.red),
            title: Text(
              "Logout",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            onTap: () {
              // TODO: Implement Logout Logic
              Navigator.pop(context); // Closes Drawer
            },
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  // 🔹 Reusable Drawer Item Widget
  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required BuildContext context,
    required Widget page,
  }) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFF0A3D62)), // Dark Blue Icon
      title: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      onTap: () {
        Navigator.pop(context); // Close drawer before navigating
        Navigator.push(context, MaterialPageRoute(builder: (_) => page));
      },
    );
  }
}
