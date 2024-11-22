import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Circle with a "bite" taken out of it
                ClipPath(
                  clipper: BiteClipper(),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                // Inner icon or symbol
                const Icon(
                  Icons.change_history, // Using a similar triangle shape icon
                  size: 40,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BiteClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();

    path.lineTo(2, 2);
    path.lineTo(2, 2);
    path.quadraticBezierTo(w * 0.5, h - 100, w, h);
    path.lineTo(2, 2);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Column(
      children: [
        Stack(children: [
          Image.asset(
            width: screenWidth * 1,
            height: screenHeight * 0.650,
            'assets/loginpage.png',
            fit: BoxFit.fill,
          ),
          _buildBubbleRect(
              top: -10,
              left: 110,
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              newScreenHeight: 0.053,
              newScreenWidth: 0.1),
          _buildBubbleRect(
              top: -40,
              left: 205,
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              newScreenHeight: 0.077,
              newScreenWidth: 0.085),
          _buildBubble(
              top: 80,
              left: 115,
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              newScreenHeight: 0.08,
              newScreenWidth: 0.08),
          _buildBubble(
              top: 230,
              left: 280,
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              newScreenHeight: 0.06,
              newScreenWidth: 0.06)
        ]),
        SizedBox(
          height: screenHeight * 0.04,
        ),
        Text(
          'NIKKLE',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 45, right: 45),
          child: Text(
            'Simplify everything with Nikkle: accounting, HR, CRM, project management, and credit applications!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        FilledButton.icon(
            onPressed: () {},
            icon: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: const Icon(Icons.login)),
            style: const ButtonStyle(
                backgroundColor:
                    WidgetStatePropertyAll(Color.fromRGBO(34, 108, 233, 1)),
                padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 63, vertical: 10))),
            iconAlignment: IconAlignment.end,
            label: const Text('Login')),
      ],
    ));
  }
}

Widget _buildBubble({
  required double top,
  required double left,
  required double screenHeight,
  required double screenWidth,
  required double newScreenHeight,
  required double newScreenWidth,
}) {
  return Positioned(
    top: top,
    left: left,
    child: Container(
      height: screenHeight * newScreenHeight,
      width: screenWidth * newScreenWidth,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(232, 241, 252, 0.35),
      ),
    ),
  );
}

Widget _buildBubbleRect({
  required double top,
  required double left,
  required double screenHeight,
  required double screenWidth,
  required double newScreenHeight,
  required double newScreenWidth,
}) {
  return Positioned(
    top: top,
    left: left,
    child: Container(
      height: screenHeight * newScreenHeight,
      width: screenWidth * newScreenWidth,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(232, 241, 252, 0.35),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
    ),
  );
}
