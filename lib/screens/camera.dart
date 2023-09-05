import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

List<CameraDescription> cameras = [];

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  int index = 0;
  CameraController? _cameraController;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    if (cameras.isNotEmpty) {
      _cameraController =
          CameraController(cameras[index], ResolutionPreset.high);
      _initializeControllerFuture = _cameraController!.initialize();
    } else {
      // Initialize to a dummy CircularProgressIndicator while cameras are loading.
      _cameraController =
          CameraController(cameras[index], ResolutionPreset.high);
      _initializeControllerFuture = Future.value();
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CameraPreview(_cameraController!);
            } else {
              // Show a loading indicator while the camera is initializing.
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(
                  Icons.insert_photo,
                  size: 50,
                  color: Colors.white,
                ),
                const InkWell(
                  child: Icon(
                    Icons.panorama_fish_eye,
                    size: 100,
                    color: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      index = (index == 0) ? 1 : 0;
                      _cameraController = CameraController(
                          cameras[index], ResolutionPreset.high);
                      _initializeControllerFuture =
                          _cameraController!.initialize();
                    });
                  },
                  child: const Icon(
                    Icons.switch_camera_sharp,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Your other code for camera initialization and app setup remains the same.
