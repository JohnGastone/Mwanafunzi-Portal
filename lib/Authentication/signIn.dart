// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mwanafunziportal/Authentication/signUp.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  bool _isObscured = true;
  // Function to toggle password visibility
  void _toggleVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 36, 48, 79),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 36, 48, 79),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100),
            Center(
              child: Text(
                'Welcome Back!',
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 35, right: 20),
              child: Text(
                "Please enter your credentials below, there is a dish waiting for you",
                style: GoogleFonts.poppins(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 500,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Container(
                    height: 50,
                    width: 270,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextField(
                        style: GoogleFonts.poppins(),
                        decoration: InputDecoration(
                          hintText: "Enter your email address",
                          hintStyle: GoogleFonts.poppins(fontSize: 15),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: 50,
                    width: 270,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextField(
                        style: GoogleFonts.poppins(),
                        decoration: InputDecoration(
                          hintText: "Enter your password",
                          hintStyle: GoogleFonts.poppins(fontSize: 15),
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscured
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed:
                                _toggleVisibility, // Toggles password visibility
                          ),
                        ),
                        obscureText: _isObscured,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: Colors.white24,
                  //     borderRadius: BorderRadius.circular(16),
                  //   ),
                  //   height: 50,
                  //   width: 170,
                  //   child: TextButton(
                  //     child: Text(
                  //       "Login",
                  //       style: GoogleFonts.poppins(
                  //         fontSize: 18,
                  //         color: Colors.white,
                  //       ),
                  //     ),
                  //     onPressed: () {
                  //       Navigator.push(
                  //         // context,
                  //         // MaterialPageRoute(builder: (context) => MyHomePage()),
                  //       );
                  //     },
                  //   ),
                  // ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 78),
                    child: Row(
                      children: [
                        Text(
                          "New User?",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 40),
                        InkWell(
                          child: Text(
                            "Register",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Color.fromARGB(255, 36, 48, 79),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpPage(),
                              ),
                            );
                          },
                        ),
                      ],
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
}
