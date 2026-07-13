part of 'audio_cubit.dart';


/// Base class for all audio states.
///
/// Every state emitted by [AudioCubit] extends this class.
@immutable
sealed class AudioState {}

/// Initial state before any audio is loaded.
final class AudioInitial extends AudioState {}

/// State while loading or preparing the audio source.
final class AudioLoading extends AudioState {}

/// State emitted when an error occurs.
final class AudioError extends AudioState {
  final String message;

  AudioError(this.message);
}

/// State representing a ready audio player.
///
/// It contains everything the UI needs to render itself.
final class AudioReady extends AudioState {
  /// Total duration of the audio.
  final Duration duration;

  /// Current playback position.
  final Duration position;

  /// Whether the audio is currently playing.
  final bool isPlaying;

   AudioReady({
    required this.duration,
    required this.position,
    required this.isPlaying,
  });

  /// Creates a new state by replacing only the provided values.
  AudioReady copyWith({
    Duration? duration,
    Duration? position,
    bool? isPlaying,
  }) {
    return AudioReady(
      duration: duration ?? this.duration,
      position: position ?? this.position,
      isPlaying: isPlaying ?? this.isPlaying,
    );
  }
}