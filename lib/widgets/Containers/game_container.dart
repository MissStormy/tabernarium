import 'package:flutter/material.dart';
import 'package:tabernarium/theme/theme.dart';
import 'package:provider/provider.dart';

class GameAccordion extends StatefulWidget {
  final String title;
  //final Image creator;
  final String players;
  final String location;
  final String description;

  const GameAccordion({super.key, 
    required this.title,
    //required this.creator,
    required this.players,
    required this.location,
    required this.description,
  });

  @override
  _GameAccordionState createState() => _GameAccordionState();
}

class _GameAccordionState extends State<GameAccordion> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    final backgroundColor = actualTheme.colorScheme.primary;
    final collapsedColor =
        actualTheme.colorScheme.primary; // Adjust the color as needed
    const greyBorderColor = Colors.grey; // Adjust the color as needed

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: greyBorderColor), // Add border decoration
      ),
      child: ExpansionTile(
        backgroundColor: backgroundColor, // Set background color
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Image.asset('assets/d20.png'),
              title: Text(
                widget.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold, // Make title bold
                  fontSize: 18, // Increase title font size
                ),
              ),
              subtitle: Text(widget.players),
            ),
            _isExpanded
                ? const SizedBox() // Empty SizedBox if expanded
                : ElevatedButton(
                    onPressed: () {
                      // Action when "Unirse" button is pressed
                    },
                    child: const Text("Unirse"),
                  ),
          ],
        ),
        trailing: Icon(
          _isExpanded
              ? Icons.expand_less
              : Icons.expand_more, // Adjust icons as needed
          size: 32, // Adjust icon size as needed
        ),
        children: <Widget>[
          ListTile(
            title: Text(widget.location),
          ),
          ListTile(
            title: Text(widget.description),
          ),
          ListTile(
            trailing: IconButton(
              icon: const Icon(Icons.favorite_border), // Heart-shaped icon
              onPressed: () {
                // Action when heart icon is pressed
              },
            ),
          ),
          _isExpanded
              ? ListTile(
                  trailing: ElevatedButton(
                    onPressed: () {
                      // Action when "Unirse" button is pressed
                    },
                    child: const Text("Unirse"),
                  ),
                )
              : const SizedBox(), // Empty SizedBox if not expanded
        ],
        onExpansionChanged: (value) {
          setState(() {
            _isExpanded = value;
          });
        },
      ),
    );
  }
}
