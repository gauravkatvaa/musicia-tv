import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tv_demo/data/audio_file.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent(),
      },
      child: MaterialApp(
        theme: ThemeData(focusColor: Colors.grey.shade400),
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final audioFile = AudioFile(
      title: 'Mere dil mei aaj kya hai tu kahe to me bata du',
      thumbnailUrl:
          'https://fastly.picsum.photos/id/0/5000/3333.jpg?hmac=_j6ghY5fCfSD6tvtcV74zXivkJSPIfR9B8w34XeQmvU',
      url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MusicPlayer(audioFile: audioFile),
            const MusicList(),
          ],
        ),
      ),
    );
  }
}

class MusicPlayer extends StatefulWidget {
  final AudioFile audioFile;

  const MusicPlayer({Key? key, required this.audioFile}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  final audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    playAudio();
  }

  void playAudio() async {
    await audioPlayer.play(UrlSource(widget.audioFile.url));
  }

  void pauseAudio() async {
    await audioPlayer.pause();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.45,
      child: Row(
        children: [
          Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(15),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(widget.audioFile.thumbnailUrl),
                  fit: BoxFit.cover,
                ),
              ),
              height: size.height * 0.4,
              width: size.width * 0.35,
            ),
          ),
          SizedBox(width: size.width * 0.03),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(widget.audioFile.title),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.pause),
                    onPressed: pauseAudio,
                  ),
                  IconButton(
                    icon: const Icon(Icons.play_arrow),
                    onPressed: playAudio,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MusicList extends StatelessWidget {
  const MusicList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.45,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Musics that you may like'),
          SizedBox(
            height: size.height * 0.3,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 50,
              itemBuilder: (context, index) {
                return MusicCard(
                  title: '$index Element',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MusicCard extends StatelessWidget {
  const MusicCard({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        width: 200,
        child: ListTile(
          title: Text(title),
        ),
      ),
    );
  }
}
