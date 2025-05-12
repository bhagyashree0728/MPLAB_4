import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PlacementStatsPage extends StatelessWidget {
  // 🔹 Dynamic Data for Placement Stats
  final Map<String, int> yearlyPlacements = {
    "2019": 120,
    "2020": 150,
    "2021": 170,
    "2022": 180,
    "2023": 200,
    "2024": 220, // Added latest year
  };

  final Map<String, int> departmentPlacements = {
    "CSE": 100,
    "IT": 80,
    "EXTC": 60,
    "MECH": 50,
    "MCA": 60,
    "AI/ML": 70, // Added AI/ML branch
  };

  final List<Map<String, dynamic>> companyData = [
    {"name": "Google", "offers": 10, "avgPackage": "₹45 LPA"},
    {"name": "Amazon", "offers": 12, "avgPackage": "₹35 LPA"},
    {"name": "Microsoft", "offers": 8, "avgPackage": "₹40 LPA"},
    {"name": "TCS", "offers": 30, "avgPackage": "₹8 LPA"},
    {"name": "Infosys", "offers": 25, "avgPackage": "₹7 LPA"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("📊 Placement Stats"),
        backgroundColor: Color(0xFF0A3D62),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Yearly Placement Stats Card
              _buildStatCard(
                title: "📊 Yearly Placement Trends",
                child: Container(height: 250, child: _buildBarChart()),
              ),

              SizedBox(height: 20),

              // 🔹 Department-Wise Placement Card
              _buildStatCard(
                title: "🥧 Department-wise Placement Distribution",
                child: Container(height: 250, child: _buildPieChart()),
              ),

              SizedBox(height: 20),

              // 🔹 Placement Overview (Highest & Avg Packages)
              _buildPlacementSummary(),

              SizedBox(height: 20),

              // 🔹 Top Companies Hiring
              _buildStatCard(
                title: "🏢 Top Recruiting Companies",
                child: _buildCompanyList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 📊 Yearly Placement Bar Chart
  Widget _buildBarChart() {
    return BarChart(
      BarChartData(
        barGroups:
            yearlyPlacements.entries.map((entry) {
              return BarChartGroupData(
                x: yearlyPlacements.keys.toList().indexOf(entry.key),
                barRods: [
                  BarChartRodData(
                    toY: entry.value.toDouble(),
                    color: Colors.blueAccent,
                    width: 18,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ],
              );
            }).toList(),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, _) {
                return Text(
                  yearlyPlacements.keys.elementAt(value.toInt()),
                  style: TextStyle(fontSize: 12),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
        ),
      ),
    );
  }

  // 🥧 Department-Wise Placement Pie Chart
  Widget _buildPieChart() {
    final int total = departmentPlacements.values.reduce((a, b) => a + b);

    return PieChart(
      PieChartData(
        sections:
            departmentPlacements.entries.map((entry) {
              double percentage = (entry.value / total) * 100;
              return PieChartSectionData(
                value: percentage,
                title: "${entry.key} (${percentage.toStringAsFixed(1)}%)",
                color:
                    Colors.primaries[departmentPlacements.keys.toList().indexOf(
                          entry.key,
                        ) %
                        Colors.primaries.length],
                radius: 50,
              );
            }).toList(),
      ),
    );
  }

  // 🔹 Placement Overview (Highest & Avg Package)
  Widget _buildPlacementSummary() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildSummaryTile("🏆 Highest Package", "₹50 LPA"),
        _buildSummaryTile("📉 Avg Package", "₹12 LPA"),
      ],
    );
  }

  // 🔹 Summary Tile UI
  Widget _buildSummaryTile(String title, String value) {
    return Container(
      width: 160,
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.blueGrey[50],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Top Companies Hiring
  Widget _buildCompanyList() {
    return Column(
      children:
          companyData.map((company) {
            return Card(
              elevation: 3,
              margin: EdgeInsets.symmetric(vertical: 6),
              child: ListTile(
                leading: Icon(Icons.business_rounded, color: Colors.blue),
                title: Text(
                  company["name"],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Offers: ${company["offers"]} | Avg: ${company["avgPackage"]}",
                ),
              ),
            );
          }).toList(),
    );
  }

  // 🔹 Reusable Stat Card Widget
  Widget _buildStatCard({required String title, required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}
