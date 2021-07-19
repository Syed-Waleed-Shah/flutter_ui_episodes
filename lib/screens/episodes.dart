import 'package:flutter/material.dart';
import 'package:flutter_ui_episodes/screens/screens.dart';

class Episodes extends StatelessWidget {
  Episodes({Key? key}) : super(key: key);

  final episodes = [
    {
      "name": "EPISODE # 1",
      "image": "episodes/episode1.png",
      "route": Episode1()
    },
    {
      "name": "EPISODE # 2",
      "image": "episodes/episode2.jpg",
      "route": Episode2()
    },
    {
      "name": "EPISODE # 3",
      "image": "episodes/episode3.png",
      "route": Episode3()
    },
    {
      "name": "EPISODE # 4",
      "image": "episodes/episode4.webp",
      "route": Episode4Login()
    },
    {
      "name": "EPISODE # 5",
      "image": "episodes/episode5.jpg",
      "route": Episode5()
    },
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Episodes"),
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: ListView.builder(
          itemCount: episodes.length,
          itemBuilder: (context, index) {
            return Card(
              child: Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    Container(
                      width: size.width - 16,
                      height: size.width - 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(episodes[index]['image'] as String),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          episodes[index]['name'] as String,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        episodes[index]['route'] as Widget));
                          },
                          icon: Icon(Icons.remove_red_eye),
                        ),
                      ],
                    ),
                    // Container(
                    //   width: 100,
                    //   height: 150,
                    //   decoration: BoxDecoration(
                    //     color: Colors.amber,
                    //   ),
                    // ),
                    // Container(
                    //   width: 50,
                    //   height: 80,
                    //   decoration: BoxDecoration(
                    //     color: Colors.amber,
                    //   ),
                    // ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
