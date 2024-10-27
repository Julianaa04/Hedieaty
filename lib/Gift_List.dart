import 'package:flutter/material.dart';

class GiftListPage extends StatefulWidget {
  @override
  _GiftListPageState createState() => _GiftListPageState();
}

class _GiftListPageState extends State<GiftListPage> {
  List<Map<String, dynamic>> gifts = [
    {
      'name': 'Book',
      'category': 'Education',
      'status': 'Available',
      'pledged': false,
      'icon': Icons.book,
    },
    {
      'name': 'Watch',
      'category': 'Accessory',
      'status': 'Pledged',
      'pledged': true,
      'icon': Icons.access_alarm,
    },
    {
      'name': 'Toy',
      'category': 'Kids',
      'status': 'Available',
      'pledged': false,
      'icon': Icons.toys,
    },
    {
      'name': 'Flowers',
      'category': 'Decoration',
      'status': 'Available',
      'pledged': false,
      'icon': Icons.local_florist,
    },
  ];

  String sortBy = 'name';

  @override
  Widget build(BuildContext context) {
    // Sort gifts based on selected criteria
    gifts.sort((a, b) => a[sortBy].compareTo(b[sortBy]));

    return Scaffold(
      appBar: AppBar(
        title: Text('Gift List'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _addGift, // Placeholder function
          ),
        ],
      ),
      body: Column(
        children: [
          // Sort Dropdown
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: sortBy,
              onChanged: (String? newValue) {
                setState(() {
                  sortBy = newValue!;
                });
              },
              items: <String>['name', 'category', 'status']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text('Sort by ${value[0].toUpperCase()}${value.substring(1)}'),
                );
              }).toList(),
            ),
          ),
          // Gift Grid Layout
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 0.8,
              ),
              itemCount: gifts.length,
              itemBuilder: (context, index) {
                final gift = gifts[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: gift['pledged'] ? Colors.green[100] : Colors.white,
                  elevation: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Gift name at the top in a decorated container
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            gift['name'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(gift['icon'], size: 40, color: Colors.blue),
                              SizedBox(height: 8),
                              Text(
                                'Category: ${gift['category']}',
                                style: TextStyle(color: Colors.grey[600]),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Status: ${gift['status']}',
                                style: TextStyle(color: Colors.grey[600]),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (!gift['pledged']) ...[
                        Divider(height: 1, color: Colors.grey[300]),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit, color: Colors.blue),
                                onPressed: () => _editGift(index), // Placeholder function
                              ),
                              IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () => _deleteGift(index), // Placeholder function
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Placeholder function for adding a gift
  void _addGift() {
    // Functionality to add a gift will go here
  }

  // Placeholder function for editing a gift
  void _editGift(int index) {
    // Functionality to edit a gift will go here
  }

  // Placeholder function for deleting a gift
  void _deleteGift(int index) {
    // Functionality to delete a gift will go here
  }
}
