// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mwanafunziportal/Authentication/signIn.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isObscured = true;
  bool _isObscuredSecond = true;

  // Function to toggle password visibility
  void _toggleVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  // Function to toggle password visibility
  void _toggleVisibilitySecond() {
    setState(() {
      _isObscuredSecond = !_isObscuredSecond;
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
            SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Column(
                children: [
                  Text(
                    'Sign',
                    style: GoogleFonts.poppins(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 105),
                    child: Text(
                      "Up",
                      style: GoogleFonts.poppins(
                        fontSize: 50,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 600,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 87, 145, 21),
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
                          hintText: "Enter your username i.e. Msambi Nungwa",
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
                        keyboardType: TextInputType.emailAddress,
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
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: IconButton(
                              icon: Icon(
                                _isObscured
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: _toggleVisibility,
                            ),
                          ),
                          border: InputBorder.none,
                        ),
                        obscureText: _isObscured,
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
                        keyboardType: TextInputType.numberWithOptions(),
                        decoration: InputDecoration(
                          hintText: "Repeat your pasword",
                          hintStyle: GoogleFonts.poppins(fontSize: 15),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscuredSecond
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: _toggleVisibilitySecond,
                          ),
                          border: InputBorder.none,
                        ),
                        obscureText: _isObscuredSecond,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: Colors.white24,
                  //     borderRadius: BorderRadius.circular(16),
                  //   ),
                  //   height: 50,
                  //   width: 170,
                  //   child: TextButton(
                  //     child: Text(
                  //       "Create account",
                  //       style: GoogleFonts.poppins(
                  //         fontSize: 18,
                  //         color: Colors.white,
                  //       ),
                  //     ),
                  //     onPressed: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) => const MyHomePage(),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Row(
                      children: [
                        Text(
                          "Have an account?",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 40),
                        InkWell(
                          child: Text(
                            "Sign In",
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
                                builder: (context) => Loginpage(),
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
