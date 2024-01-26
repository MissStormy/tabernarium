import 'package:flutter/material.dart';

class GameCreationPage extends StatefulWidget {
  const GameCreationPage({Key? key}) : super(key: key);

  @override
  _GameCreationPageState createState() => _GameCreationPageState();
}

class _GameCreationPageState extends State<GameCreationPage> {
  int _currentStep = 0;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _maxPlayersController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();

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
        title: const Text('Create New Game'),
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
            title: const Text('Step 1'),
            content: TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Game Name'),
            ),
          ),
          Step(
            title: const Text('Step 2'),
            content: TextFormField(
              controller: _typeController,
              decoration: const InputDecoration(labelText: 'Game Type'),
            ),
          ),
          Step(
            title: const Text('Step 3'),
            content: TextFormField(
              controller: _maxPlayersController,
              decoration: const InputDecoration(labelText: 'Max Players'),
            ),
          ),
          Step(
            title: const Text('Step 4'),
            content: TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
          ),
          Step(
            title: const Text('Step 5'),
            content: TextFormField(
              controller: _locationController,
              decoration: const InputDecoration(labelText: 'Location'),
            ),
          ),
          Step(
            title: const Text('Step 6'),
            content: TextFormField(
              controller: _durationController,
              decoration: const InputDecoration(labelText: 'Duration'),
            ),
          ),
        ],
      ),
    );
  }
}
