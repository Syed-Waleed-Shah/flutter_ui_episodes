// I will create simple dummy data for all games here

// simple class which holds image, rating, name and desc of game
class Game {
  final String image;
  final double rating;
  final String name;
  final String desc;

  Game({
    required this.image,
    required this.rating,
    required this.name,
    required this.desc,
  });

  // A static function which is returning a list of game

  static List<Game> getGames() {
    return [
      Game(
        image:
            "https://cf.geekdo-images.com/aAwBzPzta4joKfFZt05hCw__opengraph_left/img/nRlLywmRU_1OR9aVm3Fns7wOMZQ=/fit-in/445x445/filters:strip_icc()/pic4385726.jpg",
        name: "Grail",
        rating: 4.3,
        desc: "A brief description of the board game can maybe be put here...1",
      ),
      Game(
        image:
            "https://upload.wikimedia.org/wikipedia/en/9/92/Ticket_to_Ride_Board_Game_Box_EN.jpg",
        name: "Ticket to Ride",
        rating: 4.4,
        desc: "A brief description of the board game can maybe be put here...2",
      ),
      Game(
        image: "https://thesolomeeple.files.wordpress.com/2018/06/imgp6559.jpg",
        name: "Gloomhaven",
        rating: 3.8,
        desc: "A brief description of the board game can maybe be put here...3",
      ),
      Game(
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3_k3x_jODqjk5qIR09yo0D2pTpIuHwIaMiiU-6CLNegEZgFNlLPjjKIm7P9IhGcxF7Q4&usqp=CAU",
        name: "Wingspan",
        rating: 5.0,
        desc: "A brief description of the board game can maybe be put here...4",
      ),
      Game(
        image:
            "https://static-01.daraz.pk/p/759e41897990f25354d5355ef696d7a8.jpg",
        name: "Monopoly",
        rating: 4.2,
        desc: "A brief description of the board game can maybe be put here...5",
      ),
      Game(
        image:
            "https://images-platform.99static.com//HLS1v-iM_mUx2ug29uMBh4usju4=/413x211:1503x1301/fit-in/500x500/projects-files/68/6822/682241/91eec221-546e-4a01-a0c6-37d047e10a64.png",
        name: "Tigerfyre",
        rating: 2.3,
        desc: "A brief description of the board game can maybe be put here...6",
      ),
    ];
  }
}
