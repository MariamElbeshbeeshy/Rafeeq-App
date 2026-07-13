import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:audioplayers/audioplayers.dart';

part 'audio_state.dart';

/// AudioCubit handles TTS audio playback with proper state management.
///
/// Responsibilities:
/// - Load audio from various sources (assets, files, or bytes from backend)
/// - Control playback (play, pause, seek, forward, rewind)
/// - Track playback state and position
/// - Handle playback completion
/// - Manage resource cleanup
///
/// The Cubit maintains a single source of truth and updates state only through
/// player listeners (onDurationChanged, onPositionChanged, onPlayerStateChanged,
/// onPlayerComplete). This ensures the UI always reflects actual player state.
class AudioCubit extends Cubit<AudioState> {
  AudioCubit() : super(AudioInitial()) {
    _initializePlayer();
  }

  final AudioPlayer _player = AudioPlayer();
  late final StreamSubscription<Duration> _durationSub;
late final StreamSubscription<Duration> _positionSub;
late final StreamSubscription<PlayerState> _playerStateSub;
late final StreamSubscription<void> _playerCompleteSub;

  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  bool _isPlaying = false;
  late final _path ;

  /// Setup all player event listeners.
  ///
  /// These listeners emit new states based on actual player state changes.
  /// This ensures the UI is always in sync with the underlying player.
  /// Register all AudioPlayer listeners.
///
/// Each listener updates the local playback data and emits
/// a new AudioReady state so the UI stays synchronized.
///
/// The subscriptions are stored so they can be cancelled
/// inside close() to prevent memory leaks.
void _initializePlayer() {
  /// Total audio duration.
  _durationSub = _player.onDurationChanged.listen((duration) {
    _duration = duration;
    _emitReadyState();
  });

  /// Current playback position.
  _positionSub = _player.onPositionChanged.listen((position) {
    _position = position;
    _emitReadyState();
  });

  /// Playing / Paused / Stopped state.
  _playerStateSub = _player.onPlayerStateChanged.listen((playerState) {
    _isPlaying = playerState == PlayerState.playing;
    _emitReadyState();
  });

  /// Fired once playback reaches the end.
  _playerCompleteSub = _player.onPlayerComplete.listen((_) {
    _position = Duration.zero;
    _isPlaying = false;
    _emitReadyState();
  });
}

  void _emitReadyState() {
    if (isClosed) return;
    emit(
      AudioReady(
        duration: _duration,
        position: _position,
        isPlaying: _isPlaying,
      ),
    );
  }

  Future<void> loadAudio(String path) async {
    emit(AudioLoading());

    try {
      _path = path;
      await _player.setSource(AssetSource(path));

      // Wait until the player reports a valid duration.
      // onDurationChanged will update _duration automatically.
 
    } catch (e) {
      emit(AudioError(e.toString()));
    }
  }

  /// Start or resume audio playback.
  Future<void> play() async {
    try {
      if (_position == Duration.zero || _position == _duration) {
        await _player.play(AssetSource(_path));
      } else {
        await _player.resume();
      }
    } catch (e) {
      emit(AudioError(e.toString()));
    }
  }

  /// Pause playback.
  Future<void> pause() async {
    try {
      await _player.pause();
    } catch (e) {
      emit(AudioError(e.toString()));
    }
  }

  /// Toggle between play and pause.
  Future<void> togglePlayPause() async {
    if (_isPlaying) {
      await pause();
    } else {
      await play();
    }
  }

  /// Seek to a specific position.
  Future<void> seek(Duration position) async {
    try {
      Duration newPosition = position;

      if (newPosition < Duration.zero) {
        newPosition = Duration.zero;
      }

      if (newPosition > _duration) {
        newPosition = _duration;
      }

      await _player.seek(newPosition);
    } catch (e) {
      emit(AudioError(e.toString()));
    }
  }

  /// Rewind 5 seconds.
  Future<void> rewind5() async {
    await seek(_position - const Duration(seconds: 5));
  }

  /// Forward 5 seconds.
  Future<void> forward5() async {
    await seek(_position + const Duration(seconds: 5));
  }

  /// Stop playback.
  Future<void> stop() async {
    try {
      await _player.stop();
    } catch (e) {
      emit(AudioError(e.toString()));
    }
  }

 @override
Future<void> close() async {
  await _durationSub.cancel();
  await _positionSub.cancel();
  await _playerStateSub.cancel();
  await _playerCompleteSub.cancel();

  await _player.dispose();

  return super.close();
}
}
