import 'package:flutter/material.dart';
import 'package:rafeeq_app/views/game_play/game_play_view.dart';

class HomeViewHelper extends StatelessWidget {
  const HomeViewHelper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            child: Text("ابدأ التدريبات"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GamePlayView(levelId: 2),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
