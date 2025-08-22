import 'package:flutter/material.dart';
import 'package:journal_app/Screens/Home_Screen.dart';
import 'package:journal_app/Screens/Signup_Screen.dart';
import 'package:journal_app/main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF1E1E2C),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(height * 0.03),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.22),
              const Text(
                "Login to your\nAccount",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: height * 0.05),
              const TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.email, color: Colors.white70),
                  filled: true,
                  fillColor: Color(0xFF2C2C3E),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
              ),
              SizedBox(height: height * 0.025),
              TextField(
                obscureText: _obscurePassword,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.lock, color: Colors.white70),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.white70,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  filled: true,
                  fillColor: Color(0xFF2C2C3E),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
              ),
              SizedBox(height: height * 0.015),
              Row(
                children: [
                  Checkbox(
                    value: rememberMe,
                    activeColor: Colors.purple,
                    onChanged: (value) {
                      setState(() {
                        rememberMe = value!;
                      });
                    },
                  ),
                  const Text(
                    "Remember Me",
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
              SizedBox(height: height * 0.005),
              ElevatedButton(
                onPressed: () {
                  if (rememberMe) {
                    print("Remember me checked!");
                  }
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const MainNavigation()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  minimumSize: Size(double.infinity, height * 0.065),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              SizedBox(height: height * 0.05),
              const Center(
                child: Text(
                  "or continue with",
                  style: TextStyle(color: Colors.white54, fontSize: 14),
                ),
              ),
              SizedBox(height: height * 0.06),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    padding: EdgeInsets.all(height * 0.01),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white24, width: 1),
                    ),
                    child: IconButton(
                      onPressed: () {
                        print("Facebook Login");
                      },
                      icon: Icon(
                        Icons.facebook,
                        color: Colors.blue,
                        size: height * 0.04,
                      ),
                    ),
                  ),
                  SizedBox(width: height * 0.025),
                  Container(
                    width: 100,
                    padding: EdgeInsets.all(height * 0.01),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white24, width: 1),
                    ),
                    child: IconButton(
                      onPressed: () {
                        print("Google Login");
                      },
                      icon: Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/0/09/IOS_Google_icon.png",
                        height: height * 0.04,
                        width: height * 0.04,
                      ),
                    ),
                  ),
                  SizedBox(width: height * 0.025),
                  Container(
                    width: 100,
                    padding: EdgeInsets.all(height * 0.01),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white24, width: 1),
                    ),
                    child: IconButton(
                      onPressed: () {
                        print("Apple Login");
                      },
                      icon: Icon(
                        Icons.apple,
                        color: Colors.white,
                        size: height * 0.04,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.039),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don’t have an account?",
                    style: TextStyle(color: Colors.white70),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const SignupScreen()),
                      );
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(color: Colors.purple),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
