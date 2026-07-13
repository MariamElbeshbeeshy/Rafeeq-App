import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/helper/constants.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rafeeq_app/cubits/audio cubit/audio_cubit.dart';

/// A comprehensive audio player UI for TTS (Text-to-Speech) playback.
///
/// Features:
/// - Progress slider with millisecond precision for smooth movement
/// - Current and total time display
/// - Playback controls (rewind 5s, play/pause, forward 5s)
/// - Real-time state updates via BLoC
///
/// This widget delegates all playback logic to [AudioCubit], maintaining
/// clean separation between UI and business logic.
class TTSAudioPlayer extends StatefulWidget {
  final String? text;

  const TTSAudioPlayer({super.key, this.text});

  @override
  State<TTSAudioPlayer> createState() => _TTSAudioPlayerState();
}

class _TTSAudioPlayerState extends State<TTSAudioPlayer> {
  late final AudioCubit _cubit;

  @override
  void initState() {
    super.initState();

    _cubit = AudioCubit();

    if ((widget.text ?? '').isNotEmpty) {
      _cubit.loadAudio(widget.text!);
    }
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  /// Format duration to MM:SS format.
  String formatTime(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(d.inMinutes.remainder(60));
    final seconds = twoDigits(d.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AudioCubit>.value(
      value: _cubit,
      child: BlocBuilder<AudioCubit, AudioState>(
        builder: (context, state) {
          // Show loading indicator while fetching audio
          if (state is AudioLoading || state is AudioInitial) {
            return const Center(
              child: CircularProgressIndicator(color: kPrimaryColor),
            );
          }

          // Show error message if audio loading failed
          if (state is AudioError) {
            return Text(
              'حدث خطأ: ${state.message}',
              style: const TextStyle(color: Colors.red),
            );
          }

          // Show player UI when audio is ready
          if (state is AudioReady) {
            final duration = state.duration;
            final position = state.position;
            final isPlaying = state.isPlaying;

            return Column(
              children: [
                // Progress slider with millisecond precision
                SliderTheme(
                  data: SliderThemeData(
                    trackHeight: 6.h,
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 0,
                    ),
                    overlayShape: const RoundSliderOverlayShape(
                      overlayRadius: 0,
                    ),
                  ),
                  child: Slider(
                    // Use milliseconds for smooth slider movement
                    value: position.inMilliseconds.toDouble(),
                    min: 0,
                    max: duration.inMilliseconds <= 0
                        ? 1
                        : duration.inMilliseconds.toDouble(),
                    activeColor: kPrimaryColor,
                    inactiveColor: const Color(0xFFE2E8F0),
                    // Update position when user drags the slider
                    onChanged: (value) {
                      _cubit.seek(Duration(milliseconds: value.toInt()));
                    },
                  ),
                ),
                SizedBox(height: 6.h),

                // Display current time and total duration
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

                // Playback controls: Rewind 5s, Play/Pause, Forward 5s
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Rewind 5 seconds button
                    IconButton(
                      icon:  Icon(
                        Icons.forward_5_rounded,
                        size: 32,
                        color: Colors.grey[400],
                      ),
                      onPressed: () async {
                        await context.read<AudioCubit>().rewind5();
                      },
                    ),
                    
                    SizedBox(width: 24.w),

                    // Play/Pause button
                    GestureDetector(
                      onTap: _cubit.togglePlayPause,
                      child: Container(
                        width: 54.r,
                        height: 54.r,
                        decoration: const BoxDecoration(
                          color: kPrimaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          isPlaying
                              ? Icons.pause_rounded
                              : Icons.play_arrow_rounded,
                          size: 36.r,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 24.w),

                    // Forward 5 seconds button
                    IconButton(
                      icon:  Icon(
                        Icons.replay_5,
                        size: 32,
                        color: Colors.grey[400],
                      ),
                      onPressed: () async {
                        await context.read<AudioCubit>().forward5();
                      },
                    ),
                    /////
                    
                  ],
                ),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
