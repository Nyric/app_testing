import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tinder Clone',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: TinderCloneHomePage(),
    );
  }
}

class Profile {
  final String name;
  final int age;
  final String bio;
  final List<String> images;

  Profile(
      {required this.name,
      required this.age,
      required this.bio,
      required this.images});
}

class TinderCloneHomePage extends StatefulWidget {
  @override
  _TinderCloneHomePageState createState() => _TinderCloneHomePageState();
}

class _TinderCloneHomePageState extends State<TinderCloneHomePage> {
  List<Profile> profiles = [
    Profile(
      name: 'Emile',
      age: 29,
      bio:
          'Killing Squidfaced fuckers is my thing, If you ask about the scar your blocked. You should see me with the suit off ;)',
      images: [
        'https://halo.wiki.gallery/images/thumb/9/9a/EmileWaypoint.jpg/300px-EmileWaypoint.jpg',
        'https://static.wikia.nocookie.net/halo/images/2/2a/Grenadier_%28Noble_Team%29.jpg/revision/latest?cb=20091215082518',
        'https://static.wikia.nocookie.net/halo/images/6/65/Reach_947096_Medium.jpg/revision/latest?cb=20100919084603',
      ],
    ),
    Profile(
      name: 'Jorge',
      age: 41,
      bio:
          'Im a big softy, colony raised, nukes covanant flagships on weekends',
      images: [
        'https://halo.wiki.gallery/images/thumb/1/1c/Official_-_Jorge.jpg/300px-Official_-_Jorge.jpg',
        'https://static.wikia.nocookie.net/halo/images/7/7f/Jorge3.jpg/revision/latest/scale-to-width-down/1000?cb=20100817123631',
        'https://static.wikia.nocookie.net/halo/images/8/87/Reach_16065337_Medium.jpg/revision/latest?cb=20110428042218',
      ],
    ),
    Profile(
      name: 'Kat',
      age: 22,
      bio: 'Passanger Princess, UNSC proud, watch your head.',
      images: [
        'https://halo.wiki.gallery/images/thumb/5/50/Kat.PNG/300px-Kat.PNG',
        'https://halo.wiki.gallery/images/thumb/6/69/Noble_2.jpg/1600px-Noble_2.jpg',
        'https://static.wikia.nocookie.net/halo/images/6/60/Kat_Death.jpg/revision/latest?cb=20131107010403',
      ],
    ), // Add your profiles here...
  ];
  final CardController _cardController = CardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tinder Clone'),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          child: TinderSwapCard(
            orientation: AmassOrientation.BOTTOM,
            totalNum: profiles.length,
            stackNum: 3,
            maxWidth: MediaQuery.of(context).size.width * 0.9,
            maxHeight: MediaQuery.of(context).size.height * 0.6,
            minWidth: MediaQuery.of(context).size.width * 0.8,
            minHeight: MediaQuery.of(context).size.height * 0.5,
            cardController: _cardController,
            cardBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProfilePage(profile: profiles[index]),
                    ),
                  );
                },
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: CachedNetworkImage(
                          imageUrl: profiles[index].images[0],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      Positioned(
                        left: 16,
                        bottom: 16,
                        child: Text(
                          '${profiles[index].name}, ${profiles[index].age}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                blurRadius: 6.0,
                                color: Colors.black,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 16,
                        top: 16,
                        child: IconButton(
                          onPressed: () {
                            _cardController.triggerLeft();
                          },
                          icon: Icon(Icons.close, size: 32, color: Colors.red),
                        ),
                      ),
                      Positioned(
                        right: 16,
                        top: 16,
                        child: IconButton(
                          onPressed: () {
                            _cardController.triggerRight();
                          },
                          icon: Icon(Icons.favorite,
                              size: 32, color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
              // Get swiping direction
            },
            swipeCompleteCallback:
                (CardSwipeOrientation orientation, int index) {
              // Get orientation & index on swipe
            },
          ),
        ),
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  final Profile profile;

  ProfilePage({required this.profile});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.profile.name}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider.builder(
              itemCount: widget.profile.images.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return CachedNetworkImage(
                  imageUrl: widget.profile.images[index],
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                );
              },
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.5,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                autoPlay: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.profile.name}, ${widget.profile.age}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(widget.profile.bio),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
