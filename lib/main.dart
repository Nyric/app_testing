import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';

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
  int _currentIndex = 0;
  final List<Widget> _selectedPage = [
    HomeTab(),
    UserProfileTab(),
    MessagesInboxTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/TinderLogo-2017.svg/512px-TinderLogo-2017.svg.png?20181003233135', // Replace with the URL of your image
            width: 213, // You can set the width and height as needed
            height: 48,
            fit: BoxFit.fill,
          ),
        ),
      ),
      body: _selectedPage[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
        ],
      ),
    );
  }
}

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<Profile> profiles = [
    Profile(
      name: 'Donald Trump',
      age: 71,
      bio:
          'Long walks in Mira Lago but short walks to the prison shower ;) Soap Dropper in Chief  ',
      images: [
        'https://images.unsplash.com/photo-1580128660010-fd027e1e587a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1064&q=80',
        'https://images.unsplash.com/photo-1569285645462-a3f9c6332d56?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
        'https://images.unsplash.com/photo-1604595704321-f24afaa2fa6e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
      ],
    ),
    Profile(
      name: 'Patrick Bateman',
      age: 29,
      bio:
          'Let me put your head in my fridge... I mean lets go to Dorsias :) Stocker by day Stalker by night.',
      images: [
        'https://images.english.elpais.com/resizer/9WQlDVqVV-wdwqRAvrRv8z3KqTM=/1200x0/cloudfront-eu-central-1.images.arcpublishing.com/prisa/PYUQSPU2HRDB7PFG7BEEZ232VE.jpg',
        'https://industrialscripts.com/wp-content/uploads/2022/11/Patrick-Bateman-Original-Character.jpg',
        'https://www.looper.com/img/gallery/american-psycho-facts-that-would-even-impress-patrick-bateman/intro-1675976433.webp',
      ],
    ),
    Profile(
      name: 'Rue Bennet',
      age: 18,
      bio:
          'Just got out of rehab so new around here. Fantastic at dodging incoming traffic. ',
      images: [
        'https://media1.popsugar-assets.com/files/thumbor/8j44OD7D1pt39gcXfQrzQHgs_VU/fit-in/2048xorig/filters:format_auto-!!-:strip_icc-!!-/2022/02/07/884/n/45101125/tmp_3JMu4A_8bbc52d0242a631d_zendaya_1_1_.jpg',
        'https://ca-times.brightspotcdn.com/dims4/default/3ab383e/2147483647/strip/true/crop/1920x1280+0+0/resize/1200x800!/format/webp/quality/80/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fee%2F76%2F9d60b74e48f290613602ee0f3375%2Fzendaya.jpg',
        'https://www.thepinknews.com/wp-content/uploads/2021/12/euphoria.jpg',
      ],
    ),
    Profile(
      name: 'Ash Kaash',
      age: 25,
      bio:
          'Twitters original throat GOAT, you bitches are my dupes. If you are not in your bag do not match with me do not DM ',
      images: [
        'https://pbs.twimg.com/media/FsF9phXXoAARB49?format=jpg&name=large',
        'https://pbs.twimg.com/media/Fn6UUFRXoBEu-g-?format=jpg&name=large',
        'https://pbs.twimg.com/media/Fq6sJylWwAIgMcd?format=jpg&name=large',
      ],
    ),
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
                      bottom: 16,
                      left: 16,
                      child: Text(
                        '${profiles[index].name}, ${profiles[index].age}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
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

class UserProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Profile currentUserProfile = Profile(
      name: 'Lonely Dog',
      age: 25,
      bio: 'The lonely stoner needs to free his mind at night... ',
      images: [
        'https://images.unsplash.com/photo-1517849845537-4d257902454a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1035&q=80',
        'https://images.unsplash.com/photo-1518020382113-a7e8fc38eac9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1017&q=80',
        'https://images.unsplash.com/photo-1575425186775-b8de9a427e67?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
      ],
    );

    return SingleChildScrollView(
      child: Column(
        children: [
          CarouselSlider.builder(
            itemCount: currentUserProfile.images.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return CachedNetworkImage(
                imageUrl: currentUserProfile.images[index],
                fit: BoxFit.cover,
                width: double.infinity,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              );
            },
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.4,
              autoPlay: false,
              enlargeCenterPage: false,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${currentUserProfile.name}, ${currentUserProfile.age}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(currentUserProfile.bio),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String sender;
  final String content;
  final DateTime timestamp;
  final String profileImageUrl;
  final bool isFromUser;

  Message(
      {required this.sender,
      required this.content,
      required this.timestamp,
      this.profileImageUrl = '',
      this.isFromUser = false});
}

class MessagesInboxTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Conversation> conversations = [
      Conversation(
        sender: Message(
            sender: 'Ash Kaash',
            content: 'Looking for a throat goat ;)',
            timestamp: DateTime.now().subtract(Duration(minutes: 1)),
            profileImageUrl:
                'https://pbs.twimg.com/media/FsF9phXXoAARB49?format=jpg&name=large'),
        messages: [
          Message(
              sender: 'Ash Kaash',
              content: 'Looking for a throat goat ;)',
              timestamp: DateTime.now().subtract(Duration(minutes: 1)),
              profileImageUrl:
                  'https://pbs.twimg.com/media/FsF9phXXoAARB49?format=jpg&name=large'),
          Message(
              sender: 'You',
              content: 'Ash Kaash 0_0',
              timestamp: DateTime.now().subtract(Duration(minutes: 1)),
              profileImageUrl:
                  'https://images.unsplash.com/photo-1517849845537-4d257902454a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1035&q=80',
              isFromUser: true),
        ],
      ),
      // Add more conversations here...
    ];

    return ListView.builder(
      itemCount: conversations.length,
      itemBuilder: (BuildContext context, int index) {
        Conversation conversation = conversations[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(conversation.sender.profileImageUrl),
          ),
          title: Text(conversation.sender.sender),
          subtitle: Text(conversation.sender.content),
          trailing:
              Text(DateFormat('hh:mm a').format(conversation.sender.timestamp)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatPage(conversation: conversation),
              ),
            );
          },
        );
      },
    );
  }
}

class Conversation {
  final Message sender;
  final List<Message> messages;

  Conversation({required this.sender, required this.messages});
}

class ChatPage extends StatefulWidget {
  final Conversation conversation;

  ChatPage({required this.conversation});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController _messageController = TextEditingController();

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        widget.conversation.messages.add(
          Message(
            sender: 'You',
            content: _messageController.text.trim(),
            timestamp: DateTime.now(),
            profileImageUrl:
                'https://images.unsplash.com/photo-1517849845537-4d257902454a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1035&q=80',
            isFromUser: true,
          ),
        );
      });

      _messageController.clear();
    }
  }

  Widget _buildMessageBubble(Message message, bool isFromUser) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: isFromUser ? Colors.blueAccent : Colors.grey[300],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
          bottomLeft: isFromUser ? Radius.circular(16) : Radius.circular(0),
          bottomRight: isFromUser ? Radius.circular(0) : Radius.circular(16),
        ),
      ),
      child: Text(
        message.content,
        style: TextStyle(
          color: isFromUser ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.conversation.sender.sender}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.conversation.messages.length,
              itemBuilder: (context, index) {
                Message message = widget.conversation.messages[index];
                bool isFromUser = message.isFromUser;

                return Row(
                  mainAxisAlignment: isFromUser
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    if (!isFromUser) ...[
                      CircleAvatar(
                          backgroundImage:
                              NetworkImage(message.profileImageUrl)),
                      SizedBox(width: 8),
                    ],
                    _buildMessageBubble(message, isFromUser),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _sendMessage,
                  icon: Icon(Icons.send),
                  color: Theme.of(context).primaryColor,
                ),
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
//Break
