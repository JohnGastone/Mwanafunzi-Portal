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
  bool isSubmitting = false;

  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleSignup() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isSubmitting = true;
      });

      // Simulate API call
      await Future.delayed(Duration(seconds: 2));

      setState(() {
        isSubmitting = false;
      });

      // Navigate to login or show success message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Account created successfully!'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Loginpage()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 1024;
    final isTablet = size.width > 600 && size.width <= 1024;

    // Responsive dimensions and font sizes
    final containerWidth =
        isDesktop ? 450.0 : (isTablet ? 350.0 : size.width * 0.85);
    final containerHeight = isDesktop ? 60.0 : 50.0;
    final inputFontSize = isDesktop ? 16.0 : 14.0;
    final titleFontSize = isDesktop ? 70.0 : (isTablet ? 60.0 : 50.0);
    final subtitlePaddingLeft = isDesktop ? 200.0 : (isTablet ? 150.0 : 105.0);
    final buttonWidth = isDesktop ? 350.0 : (isTablet ? 280.0 : 230.0);
    final buttonHeight = isDesktop ? 55.0 : 50.0;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 36, 48, 79),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 36, 48, 79),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: isDesktop ? 70 : (isTablet ? 50 : 40)),
              Padding(
                padding: EdgeInsets.only(
                  right: isDesktop ? 30 : (isTablet ? 25 : 20),
                ),
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.06),
              Container(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.65,
                  minHeight: MediaQuery.of(context).size.height * 0.55,
                ),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: isDesktop ? 50 : 40),
                    _buildInputContainer(
                      "Enter your username i.e. Msambi Nungwa",
                      containerWidth,
                      containerHeight,
                      inputFontSize,
                      _usernameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        if (value.length < 3) {
                          return 'Username must be at least 3 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30),
                    _buildInputContainer(
                      "Enter your email address",
                      containerWidth,
                      containerHeight,
                      inputFontSize,
                      _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        final emailRegex = RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                        );
                        if (!emailRegex.hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
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
                      _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
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
                      _confirmPasswordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30),

                    // Sign Up Button
                    InkWell(
                      onTap: isSubmitting ? null : _handleSignup,
                      child: Container(
                        width: buttonWidth,
                        height: buttonHeight,
                        decoration: BoxDecoration(
                          color:
                              isSubmitting
                                  ? Colors.white.withOpacity(0.6)
                                  : Colors.white,
                          borderRadius: BorderRadius.circular(26),
                        ),
                        child: Center(
                          child:
                              isSubmitting
                                  ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                const Color.fromARGB(
                                                  255,
                                                  36,
                                                  48,
                                                  79,
                                                ),
                                              ),
                                        ),
                                      ),
                                      SizedBox(width: 12),
                                      Text(
                                        'Creating Account...',
                                        style: GoogleFonts.poppins(
                                          fontSize: inputFontSize + 2,
                                          fontWeight: FontWeight.w600,
                                          color: const Color.fromARGB(
                                            255,
                                            36,
                                            48,
                                            79,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                  : Text(
                                    'Sign Up',
                                    style: GoogleFonts.poppins(
                                      fontSize: inputFontSize + 4,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(
                                        255,
                                        36,
                                        48,
                                        79,
                                      ),
                                    ),
                                  ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isDesktop ? 80 : (isTablet ? 60 : 40),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Have an account?",
                            style: GoogleFonts.poppins(
                              fontSize: inputFontSize + 2,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 10),
                          InkWell(
                            child: Text(
                              "Sign In",
                              style: GoogleFonts.poppins(
                                fontSize: inputFontSize + 2,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
                              ),
                            ),
                            onTap: () {
                              Navigator.pushReplacement(
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
      ),
    );
  }

  Widget _buildInputContainer(
    String hint,
    double width,
    double height,
    double fontSize,
    TextEditingController controller, {
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
        child: TextFormField(
          controller: controller,
          style: GoogleFonts.poppins(fontSize: fontSize),
          keyboardType: keyboardType,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.poppins(fontSize: fontSize - 1),
            border: InputBorder.none,
            errorStyle: GoogleFonts.poppins(fontSize: fontSize - 2),
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
    TextEditingController controller, {
    String? Function(String?)? validator,
  }) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
        child: TextFormField(
          controller: controller,
          style: GoogleFonts.poppins(fontSize: fontSize),
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.poppins(fontSize: fontSize - 1),
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
            errorStyle: GoogleFonts.poppins(fontSize: fontSize - 2),
          ),
          obscureText: isObscured,
        ),
      ),
    );
  }
}
