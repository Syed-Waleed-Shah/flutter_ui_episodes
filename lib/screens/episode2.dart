import 'package:flutter/material.dart';

class Episode2 extends StatelessWidget {
  const Episode2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Creating color for background
    Color backgroundColor = Color.fromRGBO(242, 242, 242, 1);

    // Creating gradient colors for enter button
    List<Color> enterBtnColors = [
      Color.fromRGBO(18, 241, 182, 1),
      Color.fromRGBO(0, 153, 246, 1),
    ];

    // Creating gradient colors for login with FB button
    List<Color> loginWithFbButtonColors = [
      Color.fromRGBO(97, 43, 255, 1),
      Color.fromRGBO(4, 132, 255, 1),
    ];

    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/e2_top.jpg"),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
              vertical: 10,
            ),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Log In",
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Label for username
                            Text(
                              "USERNAME",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                              ),
                            ),
                            // Textfield for username
                            TextField(
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                letterSpacing: 1.1,
                              ),
                            ),
                            SizedBox(height: 25),
                            // Label for password
                            Text(
                              "PASSWORD",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                              ),
                            ),
                            // Textfield for password
                            TextField(
                              obscureText: true,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.remove_red_eye_sharp,
                                  ),
                                ),
                              ),
                            ),

                            // Using gradient custom button
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 40,
                                bottom: 10,
                              ),
                              child: Center(
                                child: CustomGradientButton(
                                  text: "Enter",
                                  icon: Icons.arrow_forward,
                                  gradientColors: enterBtnColors,
                                  onTap: () {
                                    print("Enter button pressed!");
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Creating "OR" text
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Center(
                      child: Text(
                        "OR",
                        style: TextStyle(
                          fontSize: 23,
                        ),
                      ),
                    ),
                  ),
                  // Creating "Login in with Facebook" button
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Center(
                      child: CustomGradientButton(
                        text: "Log in with Facebook",
                        gradientColors: loginWithFbButtonColors,
                        onTap: () {},
                      ),
                    ),
                  ),

                  // Creating "CREATE AN ACCOUNT" text
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Center(
                      child: Text(
                        "New here? CREATE AN ACCOUNT",
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomGradientButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final List<Color> gradientColors;
  final GestureTapCallback onTap;

  const CustomGradientButton({
    Key? key,
    required this.text,
    this.icon,
    required this.gradientColors,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Container(
          child: Wrap(
            children: [
              Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              // We are checking this if because user may not provide icon
              if (icon != null)
                Icon(
                  icon,
                  color: Colors.white,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
