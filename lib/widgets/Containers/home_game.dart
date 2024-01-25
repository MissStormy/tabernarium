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
      padding: EdgeInsets.all(10.0),
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
              SizedBox(width: 8.0), 
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(game),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Expanded(
            child: Text(description)),
          Row(
            children: [
              Icon(Icons.person),
              SizedBox(width: 10.0,),
              Text(members),
              SizedBox(width: 50,),
              ElevatedButton(onPressed: () {}, child: Text('Unirse'))
            ],
          )
        ],
      ),
    );
  }
}
