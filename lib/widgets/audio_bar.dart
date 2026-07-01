import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:rafeeq_app/helper/constants.dart';

class AudioPlayerBar extends StatefulWidget {
  final String audioUrl;

  const AudioPlayerBar({super.key, required this.audioUrl});

  @override
  State<AudioPlayerBar> createState() => _AudioPlayerBarWidgetState();
}

class _AudioPlayerBarWidgetState extends State<AudioPlayerBar> {
  bool isPlaying = false;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = kPrimaryColor.withValues(alpha: 0.7);

    return Container(
      width: double.infinity,
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsets.only(bottom: 35),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(45),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () async {
              setState(() {
                isPlaying = !isPlaying;
              });
              // if (isPlaying) {
              //   await _audioPlayer.pause();
              //   isPlaying = false;
              // } else {
              //   await _audioPlayer.play(UrlSource(widget.audioUrl));
              //   isPlaying = true;
              // }
            },
            child: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                color: kPrimaryColor,
                size: 38,
              ),
            ),
          ),

          const SizedBox(width: 16),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(22, (index) {
                final List<double> heights = [
                  15,
                  25,
                  35,
                  20,
                  40,
                  55,
                  30,
                  45,
                  60,
                  35,
                  20,
                  45,
                  55,
                  25,
                  40,
                  50,
                  35,
                  20,
                  30,
                  25,
                  15,
                  10,
                ];

                return Container(
                  width: 3.5,
                  height: heights[index % heights.length],
                  decoration: BoxDecoration(
                    color: isPlaying
                        ? Colors.white
                        : Colors.white.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(2),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
