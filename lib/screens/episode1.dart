import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Episode1 extends StatelessWidget {
  const Episode1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Lets add some image urls in a list from internet
    final List<String> imageUrls = [
      "https://images.unsplash.com/photo-1589802829985-817e51171b92?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80",
      "https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bW91bnRhaW5zfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80",
      "https://images.unsplash.com/photo-1469212044023-0e55b4b9745a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTN8fHxlbnwwfHx8fA%3D%3D&w=1000&q=80",
      "https://images-na.ssl-images-amazon.com/images/I/7172GO732JL.jpg",
      "https://images.unsplash.com/photo-1503401639559-b16332601594?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBF4LrgShMe3w2C83nIYK7iixTRP-PMShk-A&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuZa30MBbjHnxeEw2aLBcEf2VTZRMkp8NyUQ&usqp=CAU",
      "https://images.all-free-download.com/images/graphicthumb/the_snow_mountain_which_burns_514266.jpg",
      "https://media.istockphoto.com/photos/todra-gorge-morocco-africa-picture-id474289763?k=6&m=474289763&s=612x612&w=0&h=vIv-5PVtNX-Tevquxr_jakEioiIvEwsaCZtw-KsJZHI=",
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // 1) Creating AppBar
          SliverAppBar(
            backgroundColor: Colors.white,
            // pinned: true,
            leading: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
            ),
          ),

          // 2) Creating profile area
          SliverToBoxAdapter(
            child: Container(
              child: Column(
                children: [
                  // 2.1) Creating profile image
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("images/e1_profile.jpg"),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // 2.2) Creating username
                  Text(
                    "Catherine Massey",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // 2.3) Creating profession area
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "UI/UX Designer",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                        ),
                      ),
                      VerticalDivider(
                        thickness: 1,
                        color: Colors.grey,
                        width: 10,
                      ),
                      Text(
                        "Daily",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 18,
                        width: 18,
                        decoration: BoxDecoration(
                          color: Colors.blue[700],
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          "UI",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  // 3) Creating social media buttons
                  Wrap(
                    direction: Axis.horizontal,
                    spacing: 20.0,
                    runSpacing: 10.0,
                    children: [
                      CustomSocialButton(
                        backgroundColor: Colors.pink[50]!,
                        imagePath: "images/e1_dribble.png",
                        onTap: () {},
                      ),
                      CustomSocialButton(
                        backgroundColor: Colors.blue[50]!,
                        imagePath: "images/e1_facebook.png",
                        onTap: () {},
                      ),
                      CustomSocialButton(
                        backgroundColor: Colors.grey[100]!,
                        imagePath: "images/e1_instagram.png",
                        onTap: () {},
                      ),
                      CustomSocialButton(
                        backgroundColor: Colors.blue[50]!,
                        imagePath: "images/e1_linkedin.png",
                        onTap: () {},
                      ),
                    ],
                  ),

                  SizedBox(height: 22),
                  // 4) Creating stats area
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      StatsItem(
                        value: 80,
                        label: "Posts",
                      ),
                      StatsItem(
                        value: 110,
                        label: "Followers",
                      ),
                      StatsItem(
                        value: 152,
                        label: "Following",
                      ),
                    ],
                  ),
                  SizedBox(height: 22),
                  // 5) Creating own custom buttons
                  Wrap(
                    spacing: 15,
                    children: [
                      CustomButton(
                        backgroundColor: Colors.white,
                        borderColor: Colors.blue,
                        text: "Message",
                        textColor: Colors.blue,
                      ),
                      CustomButton(
                        backgroundColor: Colors.blue,
                        borderColor: Colors.blue,
                        text: "Follow",
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // 6) Creating images gallery
          SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: SliverGrid.count(
              crossAxisCount: 3,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              children: imageUrls
                  .map((url) => Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: NetworkImage(url),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final Color borderColor;
  final Color textColor;
  final String text;
  final Color backgroundColor;

  const CustomButton({
    Key? key,
    required this.borderColor,
    required this.textColor,
    required this.text,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(4.0),
      color: backgroundColor,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(4.0),
        child: Container(
          alignment: Alignment.center,
          height: 45,
          width: (MediaQuery.of(context).size.width / 2) - 30,
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor,
            ),
            borderRadius: BorderRadius.circular(4.0),
            color: Colors.transparent,
          ),
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}

class StatsItem extends StatelessWidget {
  final int value;
  final String label;

  const StatsItem({
    Key? key,
    required this.value,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        Text(label),
      ],
    );
  }
}

class CustomSocialButton extends StatelessWidget {
  final Color backgroundColor;
  final String imagePath;
  final GestureTapCallback onTap;

  const CustomSocialButton({
    Key? key,
    required this.backgroundColor,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(14),
      color: backgroundColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.transparent,
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
