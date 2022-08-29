import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../helpers/constants.dart';
import '../../models/message_model.dart';
import 'message_screen.dart';

class ItemAudio extends StatefulWidget {
  final MessageModel item;

  ItemAudio({required this.item});

  @override
  State<ItemAudio> createState() => _ItemAudioState();
}

class _ItemAudioState extends State<ItemAudio> {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioPlayerState audioPlayerState = AudioPlayerState.PAUSED;

  /// Optional

  int timeProgress = 0;
  int audioDuration = 0;

  /// Compulsory
  @override
  void dispose() {
    audioPlayer.release();
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.item.messageText!+">>>>>>>");
    audioPlayer.onPlayerStateChanged.listen((AudioPlayerState state) {
      setState(() {
        audioPlayerState = state;
        if (state == AudioPlayerState.COMPLETED) {
          timeProgress = 0;
        }
      });
    });

    audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        audioDuration = duration.inSeconds;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((Duration position) async {
      setState(() {
        timeProgress = position.inSeconds;
      });
    });
  }

  /// Optional
  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    audioPlayer
        .seek(newPos); // Jumps to the given position within the audio file
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 200,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:
              widget.item.typeSender == "sender" ? Colors.white : primaryColor),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: widget.item.typeSender == "sender"
              ? MainAxisAlignment.start
              : MainAxisAlignment.end,
          children: [
            InkWell(
                onTap: () {
                  if(audioPlayerState == AudioPlayerState.PLAYING){

                  print("okkkkkk");
                    audioPlayer.pause();
                  }else{
                    print("noooooo");
                    play(baseurlImage+widget.item.messageText!);


                  }


                },
                child: Icon(
                  audioPlayerState == AudioPlayerState.PLAYING?Icons.pause : Icons.play_arrow,
                  color: widget.item.typeSender == "sender"
                      ? primaryColor
                      : Colors.white,
                  size: 30,
                )),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: SliderTheme(
                data: SliderThemeData(
                    thumbColor: widget.item.typeSender == "sender"
                        ? primaryColor
                        : Colors.white,
                    overlayColor: widget.item.typeSender == "sender"
                        ? primaryColor.withOpacity(.5)
                        : Colors.black,
                    trackShape: CustomTrackShape(),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10)),
                child: Slider.adaptive(
                  inactiveColor: widget.item.typeSender == "sender"
                      ? primaryColor.withOpacity(.5)
                      : Colors.white.withOpacity(.5),

                  value: timeProgress.toDouble(),
                  max: audioDuration.toDouble(),
                  onChanged: (value) {

                    seekToSec(value.toInt());
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  play(url) async {
    await audioPlayer.play(url).then((value) {}).onError((error, stackTrace) {
      print(error.toString()+"errrrrrrrrrrrr");
    });

  }
}
