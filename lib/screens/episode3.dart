import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_episodes/dummy/games.dart';

class Episode3 extends StatelessWidget {
  Episode3({Key? key}) : super(key: key);

  // First of all lets create primary color (some darkish green in this UI)
  final Color primaryColor = Color.fromRGBO(0, 178, 95, 1);

  @override
  Widget build(BuildContext context) {
    // Lets call our getGames function to get all games
    List<Game> games = Game.getGames();
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // 1) Creating AppBar
          SliverAppBar(
            pinned: true,
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: primaryColor,
            ),
            backgroundColor: primaryColor,
            centerTitle: true,
            title: Text(
              "Stats",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),

          // 2) Creating Stats items
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  StatItem(
                    label: "Wins",
                    value: "154",
                    badge: MyBadge(
                      icon: Icons.arrow_upward,
                      text: "4%",
                      color: primaryColor,
                    ),
                  ),
                  StatItem(
                    label: "Win Rate",
                    value: "61.5%",
                    badge: MyBadge(
                      icon: Icons.arrow_upward,
                      text: "4%",
                      color: primaryColor,
                    ),
                  ),
                  StatItem(
                    label: "Unique Games",
                    value: "23",
                    badge: MyBadge(
                      icon: Icons.arrow_downward,
                      text: "-2%",
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 3) Creating custom tab buttons
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                bottom: 5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TabButton(
                    text: "My Plays",
                    redCircle: true,
                  ),
                  SizedBox(width: 10),
                  TabButton(
                    text: "All Stats",
                  ),
                  SizedBox(width: 10),
                  TabButton(
                    text: "Week",
                    icon: Icons.arrow_drop_down,
                  ),
                ],
              ),
            ),
          ),

          // 4) Creating divider line
          SliverToBoxAdapter(
            child: Divider(
              height: 10,
              color: Colors.grey,
            ),
          ),

          // Creating list view to show all games. but before that we need data which we
          // have to show....
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                // When index is 0 we will return the text "Recent Plays" other wise a list item
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Recent Plays",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                      ),
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        // Row to show whole game UI
                        Row(
                          children: [
                            // Container to hold image of game
                            Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                image: DecorationImage(
                                  image: NetworkImage(games[index - 1].image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                            SizedBox(width: 10),

                            // Column for rating, game name and desc
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyBadge(
                                    icon: Icons.star,
                                    text: games[index - 1].rating.toString(),
                                    color: primaryColor,
                                  ),
                                  Text(
                                    games[index - 1].name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 40.0),
                                    child: Text(
                                      games[index - 1].desc,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        // Divider
                        Divider(
                          height: 2,
                          thickness: 2,
                        ),
                      ],
                    ),
                  );
                }
              },
              childCount: games.length + 1,
            ),
          ),
        ],
      ),
      floatingActionButton: Material(
        color: primaryColor,
        borderRadius: BorderRadius.circular(7),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(7),
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 25,
            ),
            child: Text(
              "Record Play",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        ),
      ),
    );
  }
}

class TabButton extends StatelessWidget {
  final String text;
  final IconData? icon; // making it nullable because icon is optional
  final bool
      redCircle; // ask user whether we show red circle on button or not..

  const TabButton({
    Key? key,
    required this.text,
    this.icon,
    this.redCircle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[100],
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: () {},
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: icon == null ? 10 : 6,
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                  Text(text),
                  icon != null
                      ? Icon(Icons.arrow_drop_down)
                      : SizedBox.shrink(),
                ],
              ),
            ),

            // Now creating that red circle
            redCircle
                ? Positioned(
                    right: -2,
                    top: -2,
                    child: Container(
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

class StatItem extends StatelessWidget {
  final String label;
  final String value;
  final MyBadge badge;

  const StatItem({
    Key? key,
    required this.label,
    required this.value,
    required this.badge,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
        // Creating badge
        Container(
          child: badge,
        ),
      ],
    );
  }
}

class MyBadge extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  const MyBadge({
    Key? key,
    required this.icon,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: color.withAlpha(40),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 12,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 10,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
