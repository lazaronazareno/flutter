import 'package:flutter/material.dart';

class VideoPlayerDesign extends StatelessWidget {
  const VideoPlayerDesign({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double heightAppBar = size.height * 0.15;
    double heightAlbumPlayer = size.height * 0.7;
    double heightContinueWatching = size.height * 0.15;

    return Scaffold(
      backgroundColor: Colors.grey[900],
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
    return SizedBox(
      width: double.infinity,
      height: height,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 24,
          left: 16,
          right: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey,
                  backgroundImage: AssetImage("assets/images/avatar.png"),
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HappyWatching!",
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                    Row(
                      children: [
                        Text("Finnie Rose",
                            style: TextStyle(color: Colors.white)),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(32)),
                  child: IconButton(
                    icon: const Icon(Icons.search),
                    color: Colors.white,
                    iconSize: 22,
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(32)),
                  child: IconButton(
                    icon: const Icon(Icons.notifications_none),
                    color: Colors.white,
                    iconSize: 22,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AlbumPlayer extends StatelessWidget {
  final double height;
  const AlbumPlayer({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: height,
      child: Stack(
        children: [
          SizedBox(
            width: size.width,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 36,
                  height: 24,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text("All", style: TextStyle(color: Colors.red)),
                ),
                Container(
                  width: 42,
                  height: 24,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text("Series",
                      style: TextStyle(color: Colors.grey)),
                ),
                Container(
                  width: 42,
                  height: 24,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child:
                      const Text("Movie", style: TextStyle(color: Colors.grey)),
                ),
                Container(
                  width: 56,
                  height: 24,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text("TVShow",
                      style: TextStyle(color: Colors.grey)),
                ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            child: SizedBox(
              width: size.width,
              height: height - 90,
              child: images(),
            ),
          ),
          Positioned(
            bottom: 20,
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
                  borderRadius: BorderRadius.circular(24),
                  image: const DecorationImage(
                      image: AssetImage("assets/images/movie2.jpg"),
                      fit: BoxFit.cover),
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
                    borderRadius: BorderRadius.circular(24),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/movie3.jpg"),
                        fit: BoxFit.cover),
                  )),
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
                image: const DecorationImage(
                    image: AssetImage("assets/images/movie1.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Interstellar 5555",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Movie - 2003",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(32)),
                      child: IconButton(
                        icon: const Icon(Icons.play_arrow_rounded),
                        color: Colors.white,
                        iconSize: 24,
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(32)),
                      child: IconButton(
                        icon: const Icon(Icons.add_rounded),
                        color: Colors.white,
                        iconSize: 22,
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
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
    return SizedBox(
      height: height,
      child: const Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: Row(children: [
          Icon(
            Icons.fast_forward_rounded,
            color: Colors.red,
            size: 24,
          ),
          SizedBox(width: 8),
          Text(
            "Continue Watching",
            style: TextStyle(color: Colors.white, fontSize: 20),
          )
        ]),
      ),
    );
  }
}

// repasar ListView 