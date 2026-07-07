import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/helper/constants.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';

class TTSAudioPlayer extends StatefulWidget {
  const TTSAudioPlayer({super.key});

  @override
  State<TTSAudioPlayer> createState() => _TTSAudioPlayerState();
}

class _TTSAudioPlayerState extends State<TTSAudioPlayer> {
  late AudioPlayer audioPlayer;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();

    audioPlayer.onDurationChanged.listen((d) {
      if (mounted) {
        setState(() => duration = d);
      }
    });

    audioPlayer.onPositionChanged.listen((p) {
      if (mounted) {
        setState(() => position = p);
      }
    });

    audioPlayer.setSourceUrl(
      "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
    );
  }

  @override
  void dispose() {
    audioPlayer.stop();
    audioPlayer.dispose();
    super.dispose();
  }

  String formatTime(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final minutes = twoDigits(d.inMinutes.remainder(60));
    final seconds = twoDigits(d.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SliderTheme(
          data: SliderThemeData(
            trackHeight: 6.h,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 0),
          ),
          child: Slider(
            value: position.inSeconds.toDouble(),
            min: 0,
            max: duration.inSeconds > 0 ? duration.inSeconds.toDouble() : 100,
            activeColor: kPrimaryColor,
            inactiveColor: const Color(0xFFE2E8F0),
            onChanged: (value) async {
              final newPosition = Duration(seconds: value.toInt());
              await audioPlayer.seek(newPosition);
            },
          ),
        ),
        SizedBox(height: 6.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              formatTime(position),
              style: TextStyle(fontSize: 12.sp, color: Colors.grey),
            ),
            Text(
              formatTime(duration),
              style: TextStyle(fontSize: 12.sp, color: Colors.grey),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(
                Icons.forward_5_rounded,
                size: 32,
                color: Color(0xFF4A5568),
              ),
              onPressed: () async {
                final newPosition = position - const Duration(seconds: 5);
                if (newPosition > Duration.zero) {
                  await audioPlayer.seek(newPosition);
                } else {
                  await audioPlayer.seek(Duration.zero);
                }
              },
            ),
            SizedBox(width: 24.w),
            GestureDetector(
              onTap: () async {
                if (isPlaying) {
                  await audioPlayer.pause();
                } else {
                  await audioPlayer.resume();
                }
                setState(() => isPlaying = !isPlaying);
              },

              child: Container(
                width: 54.r,
                height: 54.r,
                decoration: const BoxDecoration(
                  color: kPrimaryColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                  size: 36.r,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 24.w),
            IconButton(
              icon: const Icon(
                Icons.replay_5_rounded,
                size: 32,
                color: Color(0xFF4A5568),
              ),
              onPressed: () async {
                final newPosition = position + const Duration(seconds: 5);
                if (newPosition < duration) {
                  await audioPlayer.seek(newPosition);
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
