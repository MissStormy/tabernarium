import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> userProfile = {
      'imageUrl': 'assets/pfp.jpeg',
      'name': 'Lilith',
      'position': 'Master',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'currentGame': 'Dungeons & Dragons',
    };

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              backgroundColor:
                  Colors.transparent, 
              radius: 60.0, 
              child: ClipOval(
                child: Image.asset(
                  userProfile['imageUrl'],
                  fit: BoxFit.cover, 
                  width: 2 * 60.0, 
                  height: 2 * 60.0, 
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              userProfile['name'],
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              userProfile['position'],
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            Text(
              userProfile['description'],
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16.0),
            userProfile['currentGame'] != null
                ? Column(
                    children: [
                      Text(
                        'Current Game: ${userProfile['currentGame']}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16.0),
                    ],
                  )
                : SizedBox(),
            // Add settings section below
            Text(
              'Settings',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            SizedBox(height: 16.0),
            // Theme dropdown
            DropdownButton<String>(
              items: <String>[
                'Dungeon Master',
                'Cleric',
                'Bard',
                'Paladin',
                'Wizard',
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Handle theme change
              },
              hint: Text('Select Theme'),
            ),
            SizedBox(height: 16.0),
            // Help & Support accordion
            ExpansionTile(
              title: Text('Help & Support'),
              children: [
                ListTile(
                  title: Text('FAQs'),
                  onTap: () {
                    // Handle FAQ tap
                  },
                ),
                ListTile(
                  title: Text('Contact Us'),
                  onTap: () {
                    // Handle contact tap
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),
            // Credits accordion
            ExpansionTile(
              title: Text('Credits'),
              children: [
                ListTile(
                  title: Text('Developers'),
                  onTap: () {
                    // Handle developers tap
                  },
                ),
                ListTile(
                  title: Text('Designers'),
                  onTap: () {
                    // Handle designers tap
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),
            // Logout button
            ElevatedButton(
              onPressed: () {
                // Handle logout
              },
              child: Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }
}
