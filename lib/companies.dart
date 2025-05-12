import 'package:flutter/material.dart';
import 'company_details.dart';

class CompaniesPage extends StatelessWidget {
  final List<Map<String, dynamic>> companies = [
    {
      "name": "Google",
      "location": "Mountain View, CA",
      "salary": "\$120,000 - \$150,000",
      "logo": "assets/images/google.png",
      "banner": "assets/images/google.png",
      "description":
          "Google is a multinational tech company specializing in search engines, AI, and cloud computing.",
      "stats": [10, 12, 15, 18, 20], // Last 5 years placement stats
    },
    {
      "name": "Microsoft",
      "location": "Redmond, WA",
      "salary": "\$110,000 - \$140,000",
      "logo": "assets/images/microsoft.jpg",
      "banner": "assets/images/microsoft.jpg",
      "description":
          "Microsoft is a leader in enterprise software, cloud computing, and AI development.",
      "stats": [8, 10, 14, 16, 19],
    },
    {
      "name": "Amazon",
      "location": "Seattle, WA",
      "salary": "\$115,000 - \$135,000",
      "logo": "assets/images/amazon.png",
      "banner": "assets/images/amazon.png",
      "description":
          "Amazon dominates e-commerce and cloud computing, leading innovation in logistics and AI.",
      "stats": [12, 15, 18, 22, 25],
    },
    {
      "name": "Facebook",
      "location": "Menlo Park, CA",
      "salary": "\$110,000 - \$130,000",
      "logo": "assets/images/meta.webp",
      "banner": "assets/images/meta.webp",
      "description":
          "Facebook connects billions globally and is a leader in social media and virtual reality innovation.",
      "stats": [9, 13, 17, 21, 23],
    },
    {
      "name": "Tesla",
      "location": "Palo Alto, CA",
      "salary": "\$105,000 - \$125,000",
      "logo": "assets/images/tesla.png",
      "banner": "assets/images/tesla.png",
      "description":
          "Tesla is a pioneer in electric vehicles, AI-driven self-driving cars, and renewable energy solutions.",
      "stats": [6, 9, 14, 19, 22],
    },
    {
      "name": "Apple",
      "location": "Cupertino, CA",
      "salary": "\$115,000 - \$140,000",
      "logo": "assets/images/apple.jpg",
      "banner": "assets/images/apple.jpg",
      "description":
          "Apple is a global leader in smartphones, personal computing, and digital entertainment.",
      "stats": [11, 14, 18, 21, 25],
    },
    {
      "name": "IBM",
      "location": "Armonk, NY",
      "salary": "\$100,000 - \$120,000",
      "logo": "assets/images/ibm.png",
      "banner": "assets/images/ibm.png",
      "description":
          "IBM is a pioneer in AI, quantum computing, and enterprise-level software solutions.",
      "stats": [7, 10, 13, 16, 20],
    },
    {
      "name": "Netflix",
      "location": "Los Gatos, CA",
      "salary": "\$110,000 - \$135,000",
      "logo": "assets/images/netflix.png",
      "banner": "assets/images/netflix.png",
      "description":
          "Netflix revolutionized digital entertainment and streaming services worldwide.",
      "stats": [5, 9, 12, 15, 18],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Companies"),
        backgroundColor: Color(0xFF0A3D62), // Dark Blue Theme
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.85, // Adjust height
          ),
          itemCount: companies.length,
          itemBuilder: (context, index) {
            return _buildCompanyCard(context, companies[index]);
          },
        ),
      ),
    );
  }

  // 🔹 Company Card
  Widget _buildCompanyCard(BuildContext context, Map<String, dynamic> company) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CompanyDetailsPage(company: company),
          ),
        );
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(company["logo"], height: 60),
            SizedBox(height: 10),
            Text(
              company["name"],
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              company["location"],
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 8),
            Text(
              company["salary"],
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
