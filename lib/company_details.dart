import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class CompanyDetailsPage extends StatelessWidget {
  final Map<String, dynamic> company;

  CompanyDetailsPage({required this.company});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(company["name"]),
        backgroundColor: Color(0xFF0A3D62),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              company["banner"],
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    company["name"],
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(company["description"], style: TextStyle(fontSize: 16)),
                  SizedBox(height: 20),
                  _buildPlacementStats(company["stats"]),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // TODO: Implement Apply Now
                      },
                      icon: Icon(Icons.send),
                      label: Text("Apply Now"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0A3D62),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 📊 Placement Stats Chart Section
  Widget _buildPlacementStats(List<int> stats) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "📊 Placement Stats (Last 5 Years)",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(height: 200, child: _buildBarChart(stats)), // Bar Chart
        SizedBox(height: 20),
        Container(height: 200, child: _buildPieChart(stats)), // Pie Chart
      ],
    );
  }

  // 📊 Bar Chart for yearly placements
  Widget _buildBarChart(List<int> stats) {
    return BarChart(
      BarChartData(
        barGroups: List.generate(
          stats.length,
          (index) => BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                toY: stats[index].toDouble(),
                color: Colors.blue,
                width: 20,
                borderRadius: BorderRadius.circular(4),
              ),
            ],
          ),
        ),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, _) {
                int year =
                    DateTime.now().year - (stats.length - 1 - value.toInt());
                return Text("$year", style: TextStyle(fontSize: 12));
              },
            ),
          ),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
        ),
      ),
    );
  }

  // 🥧 Pie Chart for placement distribution
  Widget _buildPieChart(List<int> stats) {
    int totalPlacements = stats.reduce((a, b) => a + b);
    return PieChart(
      PieChartData(
        sections: List.generate(stats.length, (index) {
          double percentage = (stats[index] / totalPlacements) * 100;
          return PieChartSectionData(
            value: percentage,
            title: "${percentage.toStringAsFixed(1)}%",
            color: Colors.primaries[index % Colors.primaries.length],
            radius: 50,
          );
        }),
      ),
    );
  }
}
