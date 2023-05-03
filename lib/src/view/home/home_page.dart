import 'package:flutter/material.dart';
import 'package:tv_demo/data/audio_file.dart';
import 'package:tv_demo/src/view/home/widgets/music_card.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
    final audioFile = AudioFile(
      title: 'Mere dil mei aaj kya hai tu kahe to me bata du',
      thumbnailUrl:
      'https://fastly.picsum.photos/id/0/5000/3333.jpg?hmac=_j6ghY5fCfSD6tvtcV74zXivkJSPIfR9B8w34XeQmvU',
      url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
    );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xff1E1E1E),
              Color(0xff4e2268),
              Color(0xff894f68),
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 550,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding:EdgeInsets.all(15),
                    child: Text(
                      'Top Songs',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                            ),
                            child: Image.asset(
                              'assets/images/billie_image.png',
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            MusicCard(audioFile: audioFile,),
          ],
        ),
      ),
    );
  }
}
