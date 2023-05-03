import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tv_demo/data/audio_file.dart';

class MusicCard extends HookWidget {
  MusicCard({Key? key, required AudioFile audioFile})
      : _audioFile = audioFile,
        super(key: key);
  final audioPlayer = AudioPlayer();
  final AudioFile _audioFile;

  @override
  Widget build(BuildContext context) {
    final isPlaying = useState(false);

    return Expanded(
      child: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(
          15,
        ),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xff54346b),
              Color(0xff754188),
              Color(0xff915d79),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xff69497e),
                Color(0xff825393),
                Color(0xff8b5c8b),
                Color(0xff966786),
              ],
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Image.asset('assets/images/cover_image.png',
                      height: 300)),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Ava Max',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(255, 255, 255, 0.3),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                _audioFile.title,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
                maxLines: 1,
              ),
              const Expanded(child: SizedBox()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.loop_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                  SizedBox(
                    width: 120,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.skip_previous_rounded,
                              color: Colors.white,
                              size: 26,
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              if (isPlaying.value) {
                                await pauseAudio();
                              } else {
                                await playAudio();
                              }
                              isPlaying.value = !isPlaying.value;
                            },
                            child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 18,
                                child: Icon(
                                  isPlaying.value
                                      ? Icons.pause_rounded
                                      : Icons.play_arrow_rounded,
                                  color: Colors.black,
                                  size: 26,
                                )),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.skip_next_rounded,
                              color: Colors.white,
                              size: 26,
                            ),
                          ),
                        ]),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.shuffle_rounded,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> playAudio() async {
    await audioPlayer.play(UrlSource(
        _audioFile.url));
  }

  Future<void> pauseAudio() async {
    await audioPlayer.pause();
  }
}
