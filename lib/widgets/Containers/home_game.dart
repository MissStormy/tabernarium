import 'package:flutter/material.dart';

class HomeGameContainer extends StatelessWidget {
  final IconData creator;
  final String game;
  final String title;
  final String description;
  final String members;

  const HomeGameContainer(
      {super.key,
      required this.creator,
      required this.game,
      required this.title,
      required this.description,
      required this.members});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(creator),
              const SizedBox(width: 8.0), 
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(game),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Expanded(
            child: Text(description)),
          Row(
            children: [
              const Icon(Icons.person),
              const SizedBox(width: 10.0,),
              Text(members),
              const SizedBox(width: 50,),
              ElevatedButton(onPressed: () {}, child: const Text('Unirse'))
            ],
          )
        ],
      ),
    );
  }
}
