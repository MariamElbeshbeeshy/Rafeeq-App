import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafeeq_app/cubits/audio cubit/audio_cubit.dart';
import 'package:rafeeq_app/helper/constants.dart';

class AudioPlayerBar extends StatefulWidget {
  final String audioPath;

  const AudioPlayerBar({
    super.key,
    required this.audioPath,
  });

  @override
  State<AudioPlayerBar> createState() => _AudioPlayerBarState();
}

class _AudioPlayerBarState extends State<AudioPlayerBar> {
  late final AudioCubit _cubit;

  @override
  void initState() {
    super.initState();

    _cubit = AudioCubit();

    _cubit.loadAudio(widget.audioPath);
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocBuilder<AudioCubit, AudioState>(
        builder: (context, state) {
          bool isPlaying = false;

          if (state is AudioReady) {
            isPlaying = state.isPlaying;
          }

          return Container(
            width: double.infinity,
            height: 70,
            margin: const EdgeInsets.only(bottom: 35),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(.7),
              borderRadius: BorderRadius.circular(45),
            ),
            child: Row(
              children: [
                /// Play / Pause
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(
                      isPlaying
                          ? Icons.pause
                          : Icons.play_arrow_rounded,
                    ),
                    color: kPrimaryColor,
                    onPressed: () {
                      context.read<AudioCubit>().togglePlayPause();
                    },
                  ),
                ),

                const SizedBox(width: 16),

                /// Fake Waveform
                Expanded(
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                    children: List.generate(22, (index) {
                      final heights = [
                        15.0,
                        25.0,
                        35.0,
                        20.0,
                        40.0,
                        55.0,
                        30.0,
                        45.0,
                        60.0,
                        35.0,
                        20.0,
                        45.0,
                        55.0,
                        25.0,
                        40.0,
                        50.0,
                        35.0,
                        20.0,
                        30.0,
                        25.0,
                        15.0,
                        10.0,
                      ];

                      return AnimatedContainer(
                        duration:
                            const Duration(milliseconds: 250),
                        width: 3.5,
                        height: heights[index],
                        decoration: BoxDecoration(
                          color: isPlaying
                              ? Colors.white
                              : Colors.white54,
                          borderRadius:
                              BorderRadius.circular(3),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:rafeeq_app/cubits/audio%20cubit/audio_cubit.dart';
// import 'package:rafeeq_app/helper/constants.dart';

// class AudioPlayerBar extends StatefulWidget {
//   final String audioUrl;

//   const AudioPlayerBar({super.key, required this.audioUrl});

//   @override
//   State<AudioPlayerBar> createState() => _AudioPlayerBarWidgetState();
// }

// class _AudioPlayerBarWidgetState extends State<AudioPlayerBar> {
//   bool isPlaying = false;
//   late final AudioCubit _cubit;

//   @override
//   void initState() {
//     super.initState();
//     _cubit = AudioCubit();
//   }

//   @override
//   void dispose() {
//     _cubit.close();
//     super.dispose();
//   }

//   Future<void> _handlePlayPause() async {
//     if (isPlaying) {
//       await _cubit.pause();
//       if (mounted) {
//         setState(() => isPlaying = false);
//       }
//       return;
//     }

    
   
//     final audioPath = widget.audioUrl.isNotEmpty ? widget.audioUrl : 'audio/test1.mp3';
//     await _cubit.loadAudio(audioPath);
//     await _cubit.play();

//     if (mounted) {
//       setState(() => isPlaying = true);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Color backgroundColor = kPrimaryColor.withValues(alpha: 0.7);

//     return Container(
//       width: double.infinity,
//       height: 70,
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       margin: const EdgeInsets.only(bottom: 35),
//       decoration: BoxDecoration(
//         color: backgroundColor,
//         borderRadius: BorderRadius.circular(45),
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 60,
//             height: 60,
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               shape: BoxShape.circle,
//             ),
//             child: IconButton(
//               icon: isPlaying
//                   ? const Icon(Icons.pause)
//                   : const Icon(Icons.play_arrow_rounded),
//               color: kPrimaryColor,
//               onPressed: _handlePlayPause,
//             ),
//           ),

//           const SizedBox(width: 16),
//           Expanded(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: List.generate(22, (index) {
//                 final List<double> heights = [
//                   15,
//                   25,
//                   35,
//                   20,
//                   40,
//                   55,
//                   30,
//                   45,
//                   60,
//                   35,
//                   20,
//                   45,
//                   55,
//                   25,
//                   40,
//                   50,
//                   35,
//                   20,
//                   30,
//                   25,
//                   15,
//                   10,
//                 ];

//                 return Container(
//                   width: 3.5,
//                   height: heights[index % heights.length],
//                   decoration: BoxDecoration(
//                     color: isPlaying
//                         ? Colors.white
//                         : Colors.white.withValues(alpha: 0.5),
//                     borderRadius: BorderRadius.circular(2),
//                   ),
//                 );
//               }),
//             ),
//           ),
//           const SizedBox(width: 8),
//         ],
//       ),
//     );
//   }
// }
