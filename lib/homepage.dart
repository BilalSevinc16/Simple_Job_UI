import 'package:flutter/material.dart';
import 'package:simple_job_ui/util/job_card.dart';
import 'package:simple_job_ui/util/recent_job_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List jobsForYou = [
    // [ companyName, jobTitle, logoImagePath, hourlyRate ]
    ["Uber", "UI Designer", "icons/uber.png", 45],
    ["Google", "Product Dev", "icons/google.png", 80],
    ["Apple", "Software Eng.", "icons/apple.png", 95],
  ];

  final List recentJobs = [
    // [ companyName, jobTitle, logoImagePath, hourlyRate ]
    ["Nike", "Web Designer", "icons/nike.png", 20],
    ["Apple", "Software Eng.", "icons/apple.png", 95],
    ["Google", "Product Dev", "icons/google.png", 44],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 75),
          // app bar
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Container(
              height: 50,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade200,
              ),
              child: Image.asset(
                "icons/menu_from_left.png",
                color: Colors.grey.shade800,
              ),
            ),
          ),
          const SizedBox(height: 25),
          // discover an new path
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              "Discover a New Path",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
          ),
          const SizedBox(height: 25),
          // search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: SizedBox(
                            height: 30,
                            child: Image.asset(
                              "icons/search.png",
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search for a job..",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(
                    "icons/preferences.png",
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          // for you -> job cards
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              "For You",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
          ),
          const SizedBox(height: 25),
          SizedBox(
            height: 160,
            child: ListView.builder(
              itemCount: jobsForYou.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return JobCard(
                  companyName: jobsForYou[index][0],
                  jobTitle: jobsForYou[index][1],
                  logoImagePath: jobsForYou[index][2],
                  hourlyRate: jobsForYou[index][3],
                );
              },
            ),
          ),
          const SizedBox(height: 50),
          // recently add -> job tiles
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              "Recently Added",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView.builder(
                itemCount: recentJobs.length,
                itemBuilder: (context, index) {
                  return RecentJobCard(
                    companyName: recentJobs[index][0],
                    jobTitle: recentJobs[index][1],
                    logoImagePath: recentJobs[index][2],
                    hourlyRate: recentJobs[index][3],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
