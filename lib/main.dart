import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tinder Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TinderCloneHomePage(),
    );
  }
}

class TinderCloneHomePage extends StatefulWidget {
  @override
  _TinderCloneHomePageState createState() => _TinderCloneHomePageState();
}

class _TinderCloneHomePageState extends State<TinderCloneHomePage> {
  List<Profile> profiles = [
    // Add your profiles here...
  ];
  final CardController _cardController = CardController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 4, // Set the default tab to the Tinder swipe cards tab
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tinder Clone'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.settings), text: 'Settings'),
              Tab(icon: Icon(Icons.favorite), text: 'Liked'),
              Tab(icon: Icon(Icons.person), text: 'Profile'),
              Tab(icon: Icon(Icons.message), text: 'Messages'),
              Tab(icon: Icon(Icons.auto_awesome), text: 'Swipe'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SettingsTab(),
            LikedPeopleTab(likedProfiles: []), // Pass the liked profiles list here
            YourProfileTab(profile: null), // Pass your profile here
            MessagesTab(),
            SwipeTab(profiles: profiles, cardController: _cardController),
          ],
        ),
      ),
    );
  }
}

// ... Other widgets code (SettingsTab, LikedPeopleTab, YourProfileTab, ProfilePage, MessagesTab) ...

class SwipeTab extends StatefulWidget {
  final List<Profile> profiles;
  final CardController cardController;

  SwipeTab({required this.profiles, required this.cardController});

  @override
  _SwipeTabState createState() => _SwipeTabState();
}

class _SwipeTabState extends State<SwipeTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TinderSwapCard(
        orientation: AmassOrientation.BOTTOM,
        totalNum: widget.profiles.length,
        stackNum: widget.profiles.length, // Updated to stack all cards on top of each other
        swipeEdge: 4.0,
        maxWidth: MediaQuery.of(context).size.width * 0.9,
        maxHeight: MediaQuery.of(context).size.width * 0.9,
        minWidth: MediaQuery.of(context).size.width * 0.8,
        minHeight: MediaQuery.of(context).size.width * 0.8,
        cardBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(profile: widget.profiles[index]),
              ),
            );
          },
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: CachedNetworkImage(
                    imageUrl: widget.profiles[index].images[0],
                    fit: BoxFit.cover,
                    placeholder: (context, url
