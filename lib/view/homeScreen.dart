import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('H O M E',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
            shadows: [
              Shadow(
                color: Colors.grey,
                offset: Offset(3, 3),
                blurRadius: 2,
              ),
            ]
          ),
        ),
        centerTitle: true,
        shadowColor: Colors.grey.shade700,
        elevation: 0,
      ),

      body: Center(
        child: Text('H O M E',
          style: TextStyle(
            fontFamily: 'Times Rew Roman',
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
            shadows: [
              Shadow(
                color: Colors.grey.shade700,
                offset: Offset(3, 5),
                blurRadius: 4,
              ),
            ]
          ),
        ),
      ),
    );
  }
}
