import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class TabernaContainer extends StatelessWidget {
  final String groupName;
  final String numberOfMembers;
  final String groupImage;
  final VoidCallback onPressed;

  TabernaContainer({
    required this.groupName,
    required this.numberOfMembers,
    required this.groupImage,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            // Group image or icon
            Image.asset(
              groupImage,
              width: 40, // Adjust the width as needed
              height: 40, // Adjust the height as needed
            ),
            SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Group name
                Text(
                  groupName,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                // Number of members
                Text(
                  'Members: $numberOfMembers',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            Spacer(),
            // "Unirse" button
            ElevatedButton(
              onPressed: onPressed,
              child: Text('Unirse'),
            ),
          ],
        ),
      ),
    );
  }
}
