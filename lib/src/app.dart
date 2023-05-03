import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tv_demo/src/view/home/home_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent(),
      },
      child: MaterialApp(
        theme: ThemeData(focusColor: Colors.grey.shade400),
        home: HomePage(),
      ),
    );
  }
}

