import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerPage extends StatefulWidget {
  const AudioPlayerPage({super.key});

  @override
  State<AudioPlayerPage> createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  String audioUrl =
      "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-6.mp3";

  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double imgHeight = size.height * 0.40;

    return Scaffold(
      backgroundColor: const Color(0xff130e2a),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 48,
          left: 16,
          right: 16,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    )),
                const Text(
                  "Recently Played",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                      size: 32,
                    )),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              width: size.width,
              height: imgHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white10,
                image: const DecorationImage(
                  image: AssetImage("assets/images/wrrn.jpg"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            songInfo(),
            audioControls(size),
            const SizedBox(
              height: 4,
            ),
            Expanded(
                child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                height: size.height * 0.15,
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Lyrics",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.open_in_new_rounded),
                                color: Colors.white),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.open_in_full_rounded),
                                color: Colors.white)
                          ],
                        ),
                      ],
                    ),
                    const Text("lorem ipsum",
                        style: TextStyle(color: Colors.white24)),
                    const Text("lorem ipsum",
                        style: TextStyle(color: Colors.white)),
                    const Text("lorem ipsum",
                        style: TextStyle(color: Colors.white24)),
                    const Text("lorem ipsum",
                        style: TextStyle(color: Colors.white24)),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }

  songInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "WRRN - Balvanera",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "WRRN",
              style: TextStyle(
                color: Colors.white24,
                fontSize: 16,
              ),
            ),
          ],
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border_rounded,
              color: Colors.white,
            )),
      ],
    );
  }

  audioControls(Size size) {
    double percentage = size.width * 0.4;

    timeSlider() {
      return SizedBox(
        width: size.width,
        height: 10,
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            Container(
                width: size.width,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                )),
            Container(
              width: percentage,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.amber[700],
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Positioned(
              left: percentage,
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.amber[700],
                  border: Border.all(color: const Color(0xff130e2a)),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      );
    }

    myTimeSlider() {
      return Column(children: [
        Row(
          children: [
            Expanded(
                child: SizedBox(
              width: double.infinity,
              child: Slider(
                min: 0,
                max: 100,
                value: 50,
                onChanged: (value) {},
                activeColor: Colors.amber[700],
              ),
            )),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "0:30",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            Text(
              "-1:42",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      ]);
    }

    return Column(
      children: [
        Column(
          children: [
            myTimeSlider(),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shuffle_rounded,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.skip_previous_rounded,
                    color: Colors.white)),
            IconButton(
                onPressed: () {
                  _audioPlayer.setUrl(audioUrl);
                  _audioPlayer.play();
                },
                icon: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.skip_next_rounded, color: Colors.white)),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.repeat_rounded, color: Colors.white)),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}


//FONDO #130e2a
//DETALLES #d35900  #751d0e  #581426  #e78b01 #c86a00
//SECONDARY #312c43