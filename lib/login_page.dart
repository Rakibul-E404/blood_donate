import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'signup_page.dart';
import 'dashboard_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!value.contains('@gmail.com')) {
      return 'Please enter a valid Gmail address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    } else if (value.length > 14) {
      return 'Password must be at most 14 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/login_page-DonateBlood.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: validateEmail,
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    counterText: '',
                    hintText: 'At least 8 characters',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  validator: validatePassword,
                  maxLength: 14,
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    String? emailValidationResult =
                    validateEmail(emailController.text);
                    String? passwordValidationResult =
                    validatePassword(passwordController.text);
                    if (emailValidationResult != null ||
                        passwordValidationResult != null) {
                      // Email or password does not meet criteria
                      Get.snackbar('Error', 'Invalid Email or Password',
                          snackPosition: SnackPosition.BOTTOM);
                    } else {
                      // Email and password are valid, proceed with login
                      Get.to(() => DashboardPage());
                      // Handle login logic using emailController.text and passwordController.text
                    }
                  },
                  child: Text('Log In'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                TextButton(
                  onPressed: () {
                    // Navigate to forget password page
                  },
                  child: Text('Forget Password'),
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        // Navigate to signup page
                        Get.to(() => SignupPage());
                      },
                      child: Text('Sign Up'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
