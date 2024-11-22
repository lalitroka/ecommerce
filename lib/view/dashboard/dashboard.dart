import 'package:demoproject/view/dashboard/bottompage/account_tab.dart';
import 'package:demoproject/view/dashboard/bottompage/card_tab.dart';
import 'package:demoproject/view/dashboard/bottompage/home_tab.dart';
import 'package:demoproject/view/dashboard/bottompage/setting_tab.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeTab(),
    CardTab(),
    SettingTab(),
    AccountTab(),
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Column(
                children: [
                  Container(
                    height: screenHeight * 0.3,
                    width: screenWidth,
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Pos',
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromRGBO(
                                        255, 255, 255, 1))),
                            const SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              height: screenHeight * 0.05,
                              child: FilledButton.icon(
                                onPressed: () {},
                                label: Text('Logout',
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.blue)),
                                icon: const Icon(
                                  Icons.login_outlined,
                                  size: 18,
                                  color: Colors.blue,
                                ),
                                style: const ButtonStyle(
                                    padding: WidgetStatePropertyAll(
                                        EdgeInsets.symmetric(horizontal: 12)),
                                    backgroundColor: WidgetStatePropertyAll(
                                        Color.fromRGBO(255, 255, 255, 1))),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: screenWidth,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                left: 0, right: 0, top: 0, child: _pages[_selectedIndex]),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel_outlined, color: Colors.black),
            label: 'Card',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.black),
            label: 'Setting',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
