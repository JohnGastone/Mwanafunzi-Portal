import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mwanafunziportal/Authentication/signIn.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool isObscured = true;
  bool isObscuredSecond = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 1024;
    final isTablet = size.width > 600 && size.width <= 1024;

    // Responsive dimensions and font sizes
    final containerWidth =
        isDesktop ? 400.0 : (isTablet ? 300.0 : size.width * 0.85);
    final containerHeight = isDesktop ? 60.0 : 50.0;
    final inputFontSize = isDesktop ? 18.0 : 15.0;
    final titleFontSize = isDesktop ? 70.0 : (isTablet ? 60.0 : 50.0);
    final subtitlePaddingLeft = isDesktop ? 200.0 : (isTablet ? 150.0 : 105.0);
    final buttonWidth = isDesktop ? 300.0 : (isTablet ? 250.0 : 200.0);

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
                      fontSize: titleFontSize,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: subtitlePaddingLeft),
                    child: Text(
                      "Up",
                      style: GoogleFonts.poppins(
                        fontSize: titleFontSize,
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
              height: isDesktop ? 700 : 600,
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
                  _buildInputContainer(
                    "Enter your username i.e. Msambi Nungwa",
                    containerWidth,
                    containerHeight,
                    inputFontSize,
                  ),
                  SizedBox(height: 30),
                  _buildInputContainer(
                    "Enter your email address",
                    containerWidth,
                    containerHeight,
                    inputFontSize,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 30),
                  _buildPasswordContainer(
                    "Enter your password",
                    containerWidth,
                    containerHeight,
                    inputFontSize,
                    isObscured,
                    () {
                      setState(() {
                        isObscured = !isObscured;
                      });
                    },
                  ),
                  SizedBox(height: 30),
                  _buildPasswordContainer(
                    "Repeat your password",
                    containerWidth,
                    containerHeight,
                    inputFontSize,
                    isObscuredSecond,
                    () {
                      setState(() {
                        isObscuredSecond = !isObscuredSecond;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Row(
                      children: [
                        Text(
                          "Have an account?",
                          style: GoogleFonts.poppins(
                            fontSize: inputFontSize + 3,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 40),
                        InkWell(
                          child: Text(
                            "Sign In",
                            style: GoogleFonts.poppins(
                              fontSize: inputFontSize + 3,
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

  Widget _buildInputContainer(
    String hint,
    double width,
    double height,
    double fontSize, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: TextField(
          style: GoogleFonts.poppins(fontSize: fontSize),
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.poppins(fontSize: fontSize),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordContainer(
    String hint,
    double width,
    double height,
    double fontSize,
    bool isObscured,
    VoidCallback toggleVisibility,
  ) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: TextField(
          style: GoogleFonts.poppins(fontSize: fontSize),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.poppins(fontSize: fontSize),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: IconButton(
                icon: Icon(
                  isObscured ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: toggleVisibility,
              ),
            ),
            border: InputBorder.none,
          ),
          obscureText: isObscured,
        ),
      ),
    );
  }
}
