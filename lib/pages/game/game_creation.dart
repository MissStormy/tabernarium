import 'package:flutter/material.dart';

class GameCreationPage extends StatefulWidget {
  const GameCreationPage({Key? key}) : super(key: key);

  @override
  _GameCreationPageState createState() => _GameCreationPageState();
}

class _GameCreationPageState extends State<GameCreationPage> {
  int _currentStep = 0;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _typeController = TextEditingController();
  TextEditingController _maxPlayersController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _durationController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _typeController.dispose();
    _maxPlayersController.dispose();
    _descriptionController.dispose();
    _locationController.dispose();
    _durationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Game'),
      ),
      body: Stepper(
        currentStep: _currentStep,
        onStepContinue: () {
          setState(() {
            _currentStep < 5 ? _currentStep += 1 : null;
          });
        },
        onStepCancel: () {
          setState(() {
            _currentStep > 0 ? _currentStep -= 1 : null;
          });
        },
        steps: [
          Step(
            title: Text('Step 1'),
            content: TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Game Name'),
            ),
          ),
          Step(
            title: Text('Step 2'),
            content: TextFormField(
              controller: _typeController,
              decoration: InputDecoration(labelText: 'Game Type'),
            ),
          ),
          Step(
            title: Text('Step 3'),
            content: TextFormField(
              controller: _maxPlayersController,
              decoration: InputDecoration(labelText: 'Max Players'),
            ),
          ),
          Step(
            title: Text('Step 4'),
            content: TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
          ),
          Step(
            title: Text('Step 5'),
            content: TextFormField(
              controller: _locationController,
              decoration: InputDecoration(labelText: 'Location'),
            ),
          ),
          Step(
            title: Text('Step 6'),
            content: TextFormField(
              controller: _durationController,
              decoration: InputDecoration(labelText: 'Duration'),
            ),
          ),
        ],
      ),
    );
  }
}
