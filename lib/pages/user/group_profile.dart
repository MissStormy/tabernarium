import 'package:flutter/material.dart';
import 'package:tabernarium/widgets/Containers/member_container.dart';

class GroupProfilePage extends StatefulWidget {
  const GroupProfilePage({super.key});

  @override
  State<GroupProfilePage> createState() => _GroupProfilePageState();
}

class _GroupProfilePageState extends State<GroupProfilePage> {
  @override
  Widget build(BuildContext context) {
    // Mock member data (replace with actual data from your backend)
    final List<Map<String, String>> members = [
      {
        'imageUrl': 'assets/d20.png',
        'name': 'John Doe',
        'position': 'Boss',
        'description':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
      },
      {
        'imageUrl': 'assets/pfp.jpeg',
        'name': 'Lilith',
        'position': 'Masters',
        'description':
            'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.'
      },
      // Add more member data as needed
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Miembros'),),
      body:
       ListView.builder(
        itemCount: members.length,
        itemBuilder: (BuildContext context, int index) {
          return MemberContainer(
            imageUrl: members[index]['imageUrl']!,
            name: members[index]['name']!,
            position: members[index]['position']!,
            description: members[index]['description']!,
          );
        },
      ),
    );
  }
}
