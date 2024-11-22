import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              width: screenWidth * 1,
              height: screenHeight * 0.260,
              'assets/login.png',
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      color: Colors.amber,
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    Text(
                      '''Let's get Something''',
                      style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    Text(
                      'Good to see you back',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: const Color.fromRGBO(41, 41, 41, 0.65),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    Text(
                      'Email',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Email',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Forgot?',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(),
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                          style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                                Color.fromRGBO(34, 108, 233, 1)),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Log IN',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('''Don't have an account?'''),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Sign Up',
                            style: GoogleFonts.poppins(
                                color: const Color.fromRGBO(34, 108, 233, 1),
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
