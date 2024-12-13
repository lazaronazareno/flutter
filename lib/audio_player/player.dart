import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerPage extends StatefulWidget {
  const AudioPlayerPage({super.key});

  @override
  State<AudioPlayerPage> createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  String audioUrl = "assets/mp3/song1.mp3";
  late AudioPlayer _audioPlayer;

  // ignore: prefer_final_fields
  Duration? _totalDuration = const Duration(seconds: 0);
  // ignore: prefer_final_fields
  Duration _sliderValue = Duration.zero;

  double lyricsHeight = 70;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.setAsset(audioUrl);

    _audioPlayer.durationStream.listen((duration) {
      setState(() {
        _totalDuration = duration;
      });
    });

    _audioPlayer.positionStream.listen((position) {
      setState(() {
        _sliderValue = position;
      });
    });
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    return "$minutes:${seconds.toString().padLeft(2, '0')}";
  }

  double _calculatePercentage() {
    if (_totalDuration == null || _totalDuration!.inMilliseconds == 0) {
      return 0.0;
    }
    return _sliderValue.inMilliseconds / _totalDuration!.inMilliseconds;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double imgHeight = size.height * 0.40;

    Duration animationDuration = const Duration(milliseconds: 100);

    return Scaffold(
      backgroundColor: const Color(0xff130e2a),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 24,
          left: 16,
          right: 16,
        ),
        child: Stack(
          children: [
            Positioned(
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
                  const SizedBox(
                    height: 4,
                  ),
                  audioControls(size),
                  const SizedBox(
                    height: 4,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: AnimatedContainer(
                duration: animationDuration,
                curve: Curves.linearToEaseOut,
                height: lyricsHeight,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: const BoxDecoration(
                  color: Color(0xff312c43),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Lyrics",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  isExpanded = !isExpanded;
                                  lyricsHeight =
                                      isExpanded ? size.height - 80 : 80;
                                });
                              },
                              icon: Icon(isExpanded
                                  ? Icons.close_fullscreen_outlined
                                  : Icons.open_in_full_rounded),
                              color: Colors.white),
                        ],
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("¿Que mas da? Si ya es tarde",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white24,
                                fontSize: 16,
                              )),
                          Text("¿Que se siente estar mejor?",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          SizedBox(height: 16),
                          Text("Que no estás, que no hay nadie",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white24, fontSize: 16)),
                          Text("¿Que se siente estar mejor?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white24, fontSize: 16)),
                          Text("Y que no duela como antes",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white24, fontSize: 16)),
                          Text("Cada espina el tratar de olvidarte",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white24, fontSize: 16)),
                          Text("Y que pregunten lo que quieran",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white24, fontSize: 16)),
                          Text("Que supliquen nuestros nombres en las calles",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white24, fontSize: 16)),
                          SizedBox(height: 16),
                          Text("Balvanera sigue intacta y no estas",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white24, fontSize: 16)),
                          Text("Se deshace en la garganta",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white24, fontSize: 16)),
                          Text("Nuestro modo de sangrar",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white24, fontSize: 16)),
                          Text("Se distinguen nuestras sombras",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white24, fontSize: 16)),
                          Text("Y el espejo esperando nuestras formas",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white24, fontSize: 16)),
                          SizedBox(height: 16),
                          Text("Y cuándo calle, todos caigan",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white24, fontSize: 16)),
                          Text("No seremos más que polvo a la distancia",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white24, fontSize: 16)),
                          Text("Que se apague la mirada",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white24, fontSize: 16)),
                          Text("Que me duela en la parte que me falta",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white24, fontSize: 16)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
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
    double percentage = _calculatePercentage() * 100;
    print(percentage);

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
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.amber[700],
                  inactiveTrackColor: Colors.amber[100],
                  trackShape: const RoundedRectSliderTrackShape(),
                  trackHeight: 4.0,
                  thumbColor: Colors.amber[700],
                  thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 8.0),
                  overlayColor: Colors.amber.withAlpha(32),
                  overlayShape:
                      const RoundSliderOverlayShape(overlayRadius: 0.0),
                ),
                child: Slider(
                  min: 0,
                  max: 100,
                  value: percentage,
                  onChanged: (value) {},
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _formatDuration(_sliderValue),
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
            Text(
              _formatDuration(_totalDuration!),
              style: const TextStyle(color: Colors.white, fontSize: 12),
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
                    color: Colors.white, size: 32)),
            CircleAvatar(
              radius: 24,
              backgroundColor: Colors.amber[700],
              child: IconButton(
                  onPressed: () {
                    if (_audioPlayer.playing) {
                      _audioPlayer.pause();
                    } else {
                      _audioPlayer.play();
                    }
                  },
                  icon: Icon(
                    _audioPlayer.playing ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                    size: 32,
                  )),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.skip_next_rounded,
                  color: Colors.white,
                  size: 32,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.repeat_rounded,
                  color: Colors.white,
                )),
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

//usar stack para que el lyrics se apropie de todo el espacio al clickear el boton de expandir