import 'package:flutter/material.dart';
import 'me.dart';
import 'sr.dart';
import 'dart:async';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String affirmation = "";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // List of random affirmations
  List<String> affirmations = [
    "Resilience flows through you.",
    "Your heart is worthy of love and peace.",
    "Every sunrise offers room to evolve.",
    "Your resilience makes every challenge manageable.",
  ];

  @override
  void initState() {
    super.initState();
    updateAffirmation();
    Timer(Duration(seconds: 3), showAffirmationDialog);
  }

  void updateAffirmation() {
    // Get a random affirmation from the list
    final random = Random();
    final randomIndex = random.nextInt(affirmations.length);
    setState(() {
      affirmation = affirmations[randomIndex];
    });
  }

  void showAffirmationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 59, 255, 134),
          title: Text(
            "Morning Mantra..😎",
            style: TextStyle(color: Colors.black, fontSize: 24),
          ),
          content: Text(
            affirmation,
            style: TextStyle(color: const Color.fromARGB(255, 0, 35, 150), fontSize: 22),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Close the pop-up
                Navigator.of(context).pop();
              },
              child: Text(
                "Proceed..➡️",
                style: TextStyle(color: Colors.black, fontSize: 19),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(228, 255, 252, 196),
      appBar: AppBar(
        title: Text(
          "A Mindfulnes and Stress Relief",
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
        backgroundColor:  const Color.fromARGB(255, 0, 35, 150),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FittedBox(
              child: Image.asset('assets/logo.png', fit: BoxFit.cover),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 59, 255, 134), // Updated parameter
                foregroundColor:  const Color.fromARGB(255, 0, 35, 150),  // Updated parameter
                shadowColor:  const Color.fromARGB(255, 59, 255, 134),
                elevation: 30,
                padding: EdgeInsets.all(30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                minimumSize: Size(100, 42),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MindfulnessExercisesScreen(),
                  ),
                );
              },
              child: Text(
                "Mindfulness Exercises",
                style: TextStyle(fontSize: 22.0),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:const Color.fromARGB(255, 59, 255, 134), // Updated parameter
                foregroundColor: const Color.fromARGB(255, 0, 35, 150),  // Updated parameter
                shadowColor: const Color.fromARGB(255, 59, 255, 134),
                elevation: 30,
                padding: EdgeInsets.all(30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                minimumSize: Size(255, 40), // No change needed
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StressReductionExercisesScreen(),
                  ),
                );
              },
              child: Text(
                "Stress Reduction",
                style: TextStyle(fontSize: 22.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
