import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
  int _selectedIndex = 0;

  List<Widget> _tabs = [
    TinderTab(),
    UserProfileTab(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tinder Clone'),
      ),
      body: _tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}

class TinderTab extends StatefulWidget {
  @override
  _TinderTabState createState() => _TinderTabState();
}

class _TinderTabState extends State<TinderTab> {
  List<Profile> profiles = [
    // Add your profiles here...
  ];
  final CardController _cardController = CardController();

  @override
  Widget build(BuildContext context) {
    return Center(
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
                    builder: (context) => ProfilePage(profile: profiles[index]),
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
                        errorWidget: (context, url, error) => Icon(Icons.error),
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
                        icon:
                            Icon(Icons.favorite, size: 32, color: Colors.green),
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
          swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
            // Get orientation & index on swipe
          },
        ),
      ),
    );
  }
}

class UserProfileTab extends StatefulWidget {
  @override
  _UserProfileTabState createState() => _UserProfileTabState();
}

class _UserProfileTabState extends State<UserProfileTab> {
  // Example user profile
  Profile userProfile = Profile(
    name: 'User',
    age: 25,
    bio: 'I love coding and working on exciting projects!',
    images: [
      'https://example.com/image1.jpg',
      'https://example.com/image2.jpg',
      'https://example.com/image3.jpg',
    ],
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider.builder(
            itemCount: userProfile.images.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return CachedNetworkImage(
                imageUrl: userProfile.images[index],
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
                  '${userProfile.name}, ${userProfile.age}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text(userProfile.bio),
              ],
            ),
          ),
        ],
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
