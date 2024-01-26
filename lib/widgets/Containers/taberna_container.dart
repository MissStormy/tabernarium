import 'package:flutter/material.dart';



class TabernaContainer extends StatelessWidget {
  final String groupName;
  final String numberOfMembers;
  final String groupImage;
  final VoidCallback onPressed;

  const TabernaContainer({super.key, 
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
        padding: const EdgeInsets.all(16.0),
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
            const SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Group name
                Text(
                  groupName,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                // Number of members
                Text(
                  'Members: $numberOfMembers',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const Spacer(),
            // "Unirse" button
            ElevatedButton(
              onPressed: onPressed,
              child: const Text('Unirse'),
            ),
          ],
        ),
      ),
    );
  }
}
