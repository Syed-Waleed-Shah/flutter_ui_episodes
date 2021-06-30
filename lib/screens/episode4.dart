import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Color buttonColor = Color.fromRGBO(0, 101, 255, 1);

// Creating a function for constant vertical spacing
Widget spacing(double val) {
  return SizedBox(
    height: val,
  );
}

// Login screen
// both login and signup are identical so lets copy whole login and make some minor changes
class Episode4Login extends StatelessWidget {
  const Episode4Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        backwardsCompatibility: false,
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1) Creating top image illustration
              Container(
                height: 300,
                width: double.infinity,
                child: Image.asset(
                  "images/e4_login_top.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
              spacing(20),
              // 2) Creating login text
              Text(
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              spacing(20),

              // 3) Creating login form
              Form(
                child: Column(
                  children: [
                    // 3.1) Creating email textfield
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.mail),
                        hintText: "Email ID",
                      ),
                    ),
                    spacing(10),
                    // 3.2) Creating password textfield
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.lock),
                        hintText: "Password",
                        suffixText: "Forgot?",
                        suffixStyle: TextStyle(
                          color: buttonColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    spacing(30),
                    // Lets create our own custom button
                    // 3.3) Creating login button
                    CustomLargeButton(
                      backColor: buttonColor,
                      text: "Login",
                      textColor: Colors.white,
                      onTap: () {},
                    ),

                    spacing(20),

                    // 3.4) Creating "or login with" text
                    Text(
                      "Or, login with...",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                    spacing(20),
                    // 4) Lets create our own custom social signin buttons
                    Wrap(
                      spacing: 10,
                      children: [
                        SocialSignInButton(
                          imagePath: "images/e4_google.png",
                          onPressed: () {},
                        ),
                        SocialSignInButton(
                          imagePath: "images/e4_facebook.png",
                          onPressed: () {},
                        ),
                        SocialSignInButton(
                          imagePath: "images/e4_apple.png",
                          onPressed: () {},
                        ),
                      ],
                    ),

                    // 5) Creating "Register"
                    spacing(20),
                    Wrap(
                      spacing: 3,
                      children: [
                        Text("New to iThickLogistics?"),
                        Material(
                          child: InkWell(
                            onTap: () {
                              // Navigating to signup screen on click
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Episode4Signup()));
                            },
                            child: Text(
                              "Register",
                              style: TextStyle(
                                color: buttonColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
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
}

// Signup Screen
class Episode4Signup extends StatelessWidget {
  const Episode4Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        backwardsCompatibility: false,
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1) Creating top image illustration
              Container(
                height: 300,
                width: double.infinity,
                child: Image.asset(
                  "images/e4_signup_top.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
              spacing(20),
              // 2) Creating login text
              Text(
                "Sign up",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              spacing(20),

              Center(
                child: Wrap(
                  spacing: 10,
                  children: [
                    SocialSignInButton(
                      imagePath: "images/e4_google.png",
                      onPressed: () {},
                    ),
                    SocialSignInButton(
                      imagePath: "images/e4_facebook.png",
                      onPressed: () {},
                    ),
                    SocialSignInButton(
                      imagePath: "images/e4_apple.png",
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              spacing(20),
              Center(
                child: Text(
                  "Or, register with email...",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ),

              // 3) Creating login form
              Form(
                child: Column(
                  children: [
                    // 3.1) Creating email textfield
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.mail),
                        hintText: "Email ID",
                      ),
                    ),
                    spacing(10),
                    // 3.2) Creating password textfield
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.lock),
                        hintText: "Password",
                      ),
                    ),
                    spacing(10),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.person),
                        hintText: "Full name",
                      ),
                    ),
                    spacing(10),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.home),
                        hintText: "Company name",
                      ),
                    ),

                    spacing(30),
                    // Lets create our own custom button
                    // 3.3) Creating login button
                    CustomLargeButton(
                      backColor: buttonColor,
                      text: "Signup",
                      textColor: Colors.white,
                      onTap: () {},
                    ),

                    spacing(20),

                    // 4) Lets create our own custom social signin buttons

                    // 5) Creating "Register"
                    spacing(20),
                    Wrap(
                      spacing: 3,
                      children: [
                        Text("Already have iThickLogistics account?"),
                        Material(
                          child: InkWell(
                            onTap: () {
                              // Navigating back to login screen on click
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: buttonColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
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
}

class SocialSignInButton extends StatelessWidget {
  final String imagePath;
  final GestureTapCallback? onPressed;

  const SocialSignInButton({
    Key? key,
    required this.imagePath,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onPressed != null ? onPressed : () {},
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 13,
          ),
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.shade300,
              width: 1.5,
            ),
          ),
          child: Image.asset(
            imagePath,
            height: 20,
            width: 20,
          ),
        ),
      ),
    );
  }
}

// CUSTOM WIDGETS

class CustomLargeButton extends StatelessWidget {
  final Color backColor;
  final String text;
  final Color textColor;
  final GestureTapCallback? onTap;

  // Given some default values to our custom button
  const CustomLargeButton({
    Key? key,
    this.backColor = Colors.blue,
    this.text = "Button",
    this.textColor = Colors.white,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Using Material and InkWell wigdets to see splash on click
    return Material(
      borderRadius: BorderRadius.circular(15),
      color: backColor,
      child: InkWell(
        onTap: onTap != null ? onTap : () {},
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: EdgeInsets.all(17),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.transparent,
          ),
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
