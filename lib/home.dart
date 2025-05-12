import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'drawer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(SPITPlacementApp());
}

class SPITPlacementApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF0A3D62), // Dark Blue
        scaffoldBackgroundColor: Colors.white, // Background
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF0A3D62), // Dark Blue
          foregroundColor: Colors.white, // White Text
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.black), // Default text color
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFE58E26), // Orange Button
            foregroundColor: Colors.white, // White Text
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(title: Text("TPO - Placement Portal")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CollegeLogoSection(),
            BannerSection(),
            CollegeDescriptionSection(),
            SizedBox(height: 20),
            PlacementCompaniesSection(),
            SizedBox(height: 20),
            StudentTestimonials(),
            SizedBox(height: 20),
            PlacementGraph(),
            SizedBox(height: 20),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}

class CollegeLogoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Image.asset(
        'assets/images/spitlogo.png', // Replace with actual college logo
        height: 100,
      ),
    );
  }
}

class BannerSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/banner.jpg'), // Dummy banner image
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Text(
            "Welcome to TPO Portal",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Your gateway to top placements and internships!",
            style: TextStyle(fontSize: 16, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

class CollegeDescriptionSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "About SPIT",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A3D62),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "The institute is located in 47 acres of green campus at Andheri (W), the fastest growing suburb of Mumbai. "
            "The campus also houses four Bhavan’s Institutions of great repute namely Bhavan’s College, Sardar Patel College of Engineering, "
            "S.P. Jain Institute of Management and Research, and A.H. Wadia Higher Secondary School.\n\n"
            "In 1957, the Bharatiya Vidya Bhavan conceived the idea of establishing an engineering college in Mumbai. "
            "Sardar Patel College of Engineering was inaugurated on 19th August 1962.\n\n"
            "Bharatiya Vidya Bhavan’s Sardar Patel Institute of Technology was established in 2005 and is affiliated with Mumbai University.",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class PlacementCompaniesSection extends StatelessWidget {
  final List<String> companyLogos = [
    'assets/images/google.png',
    'assets/images/microsoft.jpg',
    'assets/images/amazon.png',
    'assets/images/meta.webp',
    'assets/images/tesla.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Top Recruiters",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0A3D62),
          ),
        ),
        SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children:
              companyLogos.map((logo) {
                return Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade300, blurRadius: 5),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset(logo, fit: BoxFit.contain),
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}

class StudentTestimonials extends StatelessWidget {
  final List<Map<String, String>> testimonials = [
    {
      "name": "Aarav Sharma",
      "review":
          "SPIT provided me with great placement opportunities! Got placed in Google.",
    },
    {
      "name": "Priya Patel",
      "review": "Amazing placement support! Landed a job at Microsoft.",
    },
    {
      "name": "Rajesh Gupta",
      "review":
          "The TPO team was very supportive. Secured a position at Amazon!",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Student Testimonials",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0A3D62),
          ),
        ),
        SizedBox(height: 10),
        Column(
          children:
              testimonials.map((testimonial) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: ListTile(
                    leading: Icon(Icons.person, color: Color(0xFFE58E26)),
                    title: Text(
                      testimonial["name"]!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(testimonial["review"]!),
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}

class PlacementGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            "Placement Statistics",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A3D62),
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 200,
            child: LineChart(
              LineChartData(
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(2019, 75),
                      FlSpot(2020, 80),
                      FlSpot(2021, 85),
                      FlSpot(2022, 90),
                      FlSpot(2023, 92),
                    ],
                    isCurved: true,
                    color: Colors.orange,
                    barWidth: 3,
                    dotData: FlDotData(show: true),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Color(0xFF0A3D62), // Dark Blue Background
      child: Column(
        children: [
          Text(
            "SPIT Placement Office",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Sardar Patel Institute of Technology, Mumbai\n"
            "Andheri (W), Mumbai - 400058",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _socialIcon(Icons.email, "mailto:tpo@spit.ac.in"),
              SizedBox(width: 15),
              _socialIcon(Icons.public, "https://www.spit.ac.in"),
              SizedBox(width: 15),
              _socialIcon(Icons.phone, "tel:+912228356753"),
            ],
          ),
          SizedBox(height: 10),
          Divider(color: Colors.white24, thickness: 1),
          SizedBox(height: 10),
          Text(
            "© 2025 SPIT Placement Office. All Rights Reserved.",
            style: TextStyle(color: Colors.white54, fontSize: 12),
          ),
        ],
      ),
    );
  }

  // 🔹 Social Icon Button (Handles Tap to Open URL)
  Widget _socialIcon(IconData icon, String url) {
    return InkWell(
      onTap: () => _launchUrl(url),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 22,
        child: Icon(icon, color: Color(0xFF0A3D62), size: 22), // Dark Blue Icon
      ),
    );
  }

  // 🔹 Launch URL Function (Requires `url_launcher` package)
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      print("Could not launch $url");
    }
  }
}
