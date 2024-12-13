import 'package:flutter/material.dart';

class VideoPlayerDesign extends StatelessWidget {
  const VideoPlayerDesign({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double heightAppBar = size.height * 0.1;
    double heightAlbumPlayer = size.height * 0.7;
    double heightContinueWatching = size.height * 0.2;

    return Scaffold(
      body: Column(
        children: [
          AppBar(
            height: heightAppBar,
          ),
          AlbumPlayer(
            height: heightAlbumPlayer,
          ),
          ContinueWatching(
            height: heightContinueWatching,
          ),
        ],
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  final double height;
  const AppBar({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: height,
      child: const Center(child: Text("AppBar")),
    );
  }
}

class AlbumPlayer extends StatelessWidget {
  final double height;
  const AlbumPlayer({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: height,
      color: Colors.black,
      child: Stack(
        children: [
          Container(
            width: size.width,
            height: 60,
            color: Colors.red,
          ),
          Positioned(
            top: 60,
            child: SizedBox(
              width: size.width,
              height: height - 90,
              child: images(),
            ),
          ),
          Positioned(
            bottom: 10,
            left: size.width * 0.25,
            right: size.width * 0.25,
            child: SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  bulletPoints(true),
                  bulletPoints(true),
                  bulletPoints(true),
                  bulletPoints(false),
                  bulletPoints(true),
                  bulletPoints(true),
                  bulletPoints(true),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bulletPoints(bool isCircle) {
    return Container(
      width: isCircle ? 8 : 36,
      height: 8,
      decoration: BoxDecoration(
        color: isCircle ? Colors.grey : Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Widget images() {
    return Container(
      padding: const EdgeInsets.only(
        top: 16,
        bottom: 8,
      ),
      child: Stack(
        children: [
          Positioned(
            top: 30,
            bottom: 0,
            left: -120,
            child: Transform.rotate(
              angle: -0.20,
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
          ),
          Positioned(
            top: 30,
            bottom: 0,
            right: -120,
            child: Transform.rotate(
              angle: 0.20,
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 45,
            right: 45,
            bottom: 30,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ContinueWatching extends StatelessWidget {
  final double height;
  const ContinueWatching({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: height,
      child: const Center(child: Text("Continue Watching")),
    );
  }
}

// repasar ListView 