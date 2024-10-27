import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePage createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  bool _isEditing = false; // Flag to check if in editing mode

  @override
  void initState() {
    super.initState();
    // Set initial values for profile fields (replace with real user data)
    _nameController.text = "Joliana Emad";
    _phoneController.text = "01210370304";
    _emailController.text = "juliana.ata1593@gmail.com";
    _ageController.text = "22";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 450,
                backgroundColor: Colors.black,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/profile.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          colors: [
                            Colors.black,
                            Colors.black.withOpacity(.3),
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            _isEditing
                                ? TextField(
                              controller: _nameController,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter Name',
                                hintStyle: TextStyle(
                                    color: Colors.white60),
                              ),
                            )
                                : Text(
                              _nameController.text,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              "Born",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 8),
                            Text(
                              "August 19th, 2002, Cairo, Egypt",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              "Nationality",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 8),
                            Text(
                              "Egyptian",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),

                        Row(
                          children: [
                            Icon(Icons.cake, color: Colors.white60),
                            SizedBox(width: 8),
                            _isEditing
                                ? Expanded(
                              child: TextField(
                                controller: _ageController,
                                style: TextStyle(color: Colors.white),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: "Enter Age",
                                  hintStyle: TextStyle(color: Colors.white60),
                                  border: InputBorder.none,
                                ),
                              ),
                            )
                                : Text(
                              _ageController.text,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),

                        // Phone Number Row
                        Row(
                          children: [
                            Icon(Icons.phone, color: Colors.white60),
                            SizedBox(width: 8),
                            _isEditing
                                ? Expanded(
                              child: TextField(
                                controller: _phoneController,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: "Enter Phone Number",
                                  hintStyle:
                                  TextStyle(color: Colors.white60),
                                  border: InputBorder.none,
                                ),
                              ),
                            )
                                : Text(
                              _phoneController.text,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),

                        // Email Row
                        Row(
                          children: [
                            Icon(Icons.email_rounded, color: Colors.white60),
                            SizedBox(width: 8),
                            _isEditing
                                ? Expanded(
                              child: TextField(
                                controller: _emailController,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: "Enter Email",
                                  hintStyle:
                                  TextStyle(color: Colors.white60),
                                  border: InputBorder.none,
                                ),
                              ),
                            )
                                : Text(
                              _emailController.text,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),

                        // Toggle Edit/Save Button
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (_isEditing) {
                                  // Save logic can be added here
                                  print("Name: ${_nameController.text}");
                                  print("Phone: ${_phoneController.text}");
                                  print("Email: ${_emailController.text}");
                                  print("Age: ${_ageController.text}");
                                }
                                _isEditing = !_isEditing;
                              });
                            },
                            child: Text(_isEditing ? 'Save' : 'Edit'),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 30),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
