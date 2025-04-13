import 'package:flutter/material.dart';
import 'package:s/view/homeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/image1.png', scale: 1,),

            SizedBox(height: 20,),
            Text('R U I V',
              style: TextStyle(
                fontFamily: 'Serif',
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
                shadows: [
                  Shadow(
                    color: Colors.orange,
                    offset: Offset(3, 3),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),

            Text('--- Random User Info Viewer ---',
              style: TextStyle(
                fontFamily: 'Serif',
                fontSize: 16,      
                color: Colors.white          
              ),
            ),

            SizedBox(height: 20,),
            CircularProgressIndicator(
              backgroundColor: Colors.orange,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
            ),
          ],
        ),
      ),
    );
  }
}
