import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> friends = [
    {
      'name': 'Mariam',
      'profilePic': 'assets/images.png',
      'events': ['Birthday Party', 'Wedding Gift List'],
    },
    {
      'name': 'Tina',
      'profilePic': 'assets/girl1.jpg',
      'events': ['Housewarming Party'],
    },
    {
      'name': 'Yara',
      'profilePic': 'assets/girl2.webp',
      'events': [],
    },
    {
      'name': 'Antoine',
      'profilePic': 'assets/boy1.png',
      'events': ['Graduation Ceremony Party'],
    },
  ];

  List<Map<String, dynamic>> filteredFriends = []; // List to store filtered friends
  TextEditingController searchController = TextEditingController(); // Controller for the search field
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    filteredFriends = friends; // Initially show all friends
  }

  void _filterFriends(String query) {
    setState(() {
      filteredFriends = friends
          .where((friend) =>
          friend['name'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        title: isSearching
            ? TextField(
          controller: searchController,
          onChanged: _filterFriends,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search Friends...',
            hintStyle: TextStyle(color: Colors.white54),
            border: InputBorder.none,
          ),
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images.jpg',
              height: 60,
            ),
            SizedBox(width: 10),
            Text(
              "Hedieaty",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.purple[200],
                fontFamily: 'IndieFlower',
              ),
            ),
          ],
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(isSearching ? Icons.clear : Icons.search),
            onPressed: () {
              setState(() {
                isSearching = !isSearching; // Toggle search state
                if (!isSearching) {
                  searchController.clear(); // Clear the search when not searching
                  filteredFriends = friends; // Reset to original list
                }
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/route3');
            },
            child: Text(
              " + Event / List",
              style: TextStyle(
                color: Colors.purple[200],
                fontWeight: FontWeight.bold,
                fontSize: 25,
                fontFamily: 'IndieFlower',
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: filteredFriends.length,
              itemBuilder: (context, index) {
                final friend = filteredFriends[index];
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(friend['profilePic']),
                            radius: 30,
                          ),
                          SizedBox(width: 10),
                          Text(
                            friend['name'],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Upcoming Events:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            '${friend['events'].length}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.purple[200],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      if (friend['events'].isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: friend['events']
                              .map<Widget>((event) => Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Text(
                              '- $event',
                              style: TextStyle(fontSize: 16),
                            ),
                          ))
                              .toList(),
                        )
                      else
                        Text(
                          'No Upcoming Events',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.person, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, '/route2');
              },
            ),
            IconButton(
              icon: Icon(Icons.event, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, '/route3');
              },
            ),
            IconButton(
              icon: Icon(Icons.card_giftcard, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, '/route4');
              },
            ),
          ],
        ),
      ),
    );
  }
}
