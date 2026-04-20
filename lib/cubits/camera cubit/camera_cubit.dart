import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:meta/meta.dart';

part 'camera_state.dart';

class CameraCubit extends Cubit<CameraState> {
  CameraCubit() : super(CameraInitial());

  CameraController? _cameraController;
  CameraController? get cameraController => _cameraController;

  Future initCamera() async {
    try {
      emit(CameraLoading());
      final cameras = await availableCameras();
      _cameraController = CameraController(
        cameras.first,
        ResolutionPreset.high,
      );
      await _cameraController!.initialize();
      emit(CameraReady());
    } catch (e) {
      emit(CameraError("حدث خطأ في تشغيل الكاميرا: ${e.toString()}"));
    }
  }

  Future captureImage() async {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      emit(CameraError("الكاميرا غير جاهزة"));
      return;
    }
    try {
      final XFile image = await _cameraController!.takePicture();
      emit(CameraCaptured(image));
    } catch (e) {
      emit(CameraError("حدث خطأ في التقاط الصورة: ${e.toString()}"));
    }
  }

  @override
  Future<void> close() {
    _cameraController?.dispose();
    return super.close();
  }
}
