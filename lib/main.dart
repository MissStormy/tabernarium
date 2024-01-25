import 'package:flutter/material.dart';
import 'package:tabernarium/nexus.dart';
import 'package:tabernarium/theme/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(//Load the provider
      ChangeNotifierProvider(
          create: (_) => ThemeLoader(0), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    //Load the actual theme
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return MaterialApp(theme: actualTheme, home: const NexusPage());
  }
}
