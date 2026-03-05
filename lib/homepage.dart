import 'package:flutter/material.dart';

// ===========================================
// MYAPP WIDGET - The root of our app
// StatelessWidget = This widget never changes (like your ID photo)
// ===========================================
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ========== STATE VARIABLES ==========
  // These variables CAN change over time
  // String = Text data
  String studentName = "Mpho";
  // Current favorite subject (will change when button pressed)
  String favoriteSubject = "TPG316C";
  // int = Whole number
  int subjectIndex = 0; // Tracks which subject we're on
  // List<String> = Collection of text items
  List<String> subjects = [
    "TPG316C", // Index 0
    "SOD316C", // Index 1
    "CMN316C", // Index 2
    "ITS316C", // Index 3
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Student Card"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              print("Settings pressed");
            },
          ),
        ],
      ),
      // ========== BODY WITH VARIABLES ==========
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ===========================================
                // STUDENT INFO CARD - THIS IS WHAT WE WILL EXTRACT
                // ===========================================
                StudentInfoCard(
                  studentName: studentName,
                  favoriteSubject: favoriteSubject,
                ),
                // ===========================================
                // END OF CODE TO EXTRACT
                // ===========================================
                const SizedBox(height: 30),
                // ========== CHANGE SUBJECT BUTTON ==========
                SizedBox(
                  child: ElevatedButton(
                    onPressed: () {
                      // setState = Tell Flutter "Something changed! Redraw!"
                      setState(() {
                        // Move to next subject, wrap around at end
                        // % = modulo operator (remainder after division)
                        subjectIndex = (subjectIndex + 1) % subjects.length;
                        // Update favoriteSubject with new subject from list
                        favoriteSubject = subjects[subjectIndex];
                      });
                    },
                    child: const Text("Change Subject"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // ========== FLOATING ACTION BUTTON ==========
      // Round button at bottom right
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("FAB pressed");
        },
        // child = What's inside the button
        child: const Icon(Icons.add),
      ),
      // ========== BOTTOM NAVIGATION ==========
      // Tabs at the bottom of the screen
      bottomNavigationBar: BottomNavigationBar(
        // items = List of tabs
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

class StudentInfoCard extends StatelessWidget {
  const StudentInfoCard({
    super.key,
    required this.studentName,
    required this.favoriteSubject,
  });

  final String studentName;
  final String favoriteSubject;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding = Space INSIDE the container
      padding: const EdgeInsets.all(20),
      // decoration = Visual styling
      decoration: BoxDecoration(
        // color = Background color
        color: Colors.white, // Light blue
        // borderRadius = Rounded corners
        borderRadius: BorderRadius.circular(15),
        // border = Outline around the container
        border: Border.all(
          color: Colors.blue,
          width: 2, // 2 pixels thick
        ),
      ),
      // child = What's inside the container
      child: Column(
        children: [
          // Student Name Text (using state variable)
          Text(
            "Student Name: $studentName",
            style: const TextStyle(fontSize: 24),
          ),
          // SizedBox = Empty space for spacing
          const SizedBox(height: 10),
          // Favorite Subject Text (using state variable)
          Text(
            "Favorite Subject: $favoriteSubject",
            style: const TextStyle(fontSize: 20, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
