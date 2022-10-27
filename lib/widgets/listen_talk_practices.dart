import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:english_quiz_app/widgets/reusable_widgets/bottom_trick_info_container.dart';
import 'package:english_quiz_app/widgets/reusable_widgets/custom_speaker_button.dart';
import 'package:flutter/material.dart';

import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:text_to_speech/text_to_speech.dart';

class ListenTalkPractices extends StatefulWidget {
  final String infoText;
  final String mockImageUrl;
  final String learnEnglishText;
  final String translatedText;
  final bool isSpeechEnabled;
  final bool showTrickInfoContainer;
  final String trickInfoText;

  const ListenTalkPractices(
      {Key? key,
      required this.infoText,
      required this.mockImageUrl,
      required this.learnEnglishText,
      required this.translatedText,
      required this.isSpeechEnabled,
      required this.showTrickInfoContainer,
      required this.trickInfoText})
      : super(key: key);

  @override
  State<ListenTalkPractices> createState() => _ListenTalkPracticesState();
}

class _ListenTalkPracticesState extends State<ListenTalkPractices> {
  //             -------------  speech to text  -------------

  stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _textSpeech = '';

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  void onListen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _textSpeech = val.recognizedWords;
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  //             -------------   speech to text   -------------
  @override
  Widget build(BuildContext context) {
    TextToSpeech tts = TextToSpeech();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            infoText(context),
            const SizedBox(height: 24),
            Image.asset(widget.mockImageUrl),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                listenTextButton(tts),
                learnEnglishTextContainer(context),
                translatedTextPopupButton()
              ],
            ),
            Text(_textSpeech),
            const SizedBox(height: 12),
            widget.isSpeechEnabled ? textToSpeechButton(context) : Container(),
            const SizedBox(height: 12),
            if (widget.showTrickInfoContainer) ...[
              BottomTrickInfoContainer(
                infoText: widget.trickInfoText,
                exampleText: '',
              )
            ] else
              ...[],
          ],
        ),
      ]),
    );
  }

  ElevatedButton textToSpeechButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1.0,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        onListen();

        if (widget.learnEnglishText == _textSpeech) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Icon(
                Icons.check_circle,
                size: 84,
                color: Colors.green,
              ),
              content: Text(
                "Tebrikler!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headline5!.fontSize,
                ),
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _textSpeech = '';
                      });
                      Navigator.pop(context);
                    },
                    child: const Text('Ok'))
              ],
            ),
          );
        } else if (_textSpeech == '') {
          return;
        } else {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Icon(Icons.cancel, size: 84, color: Colors.red),
              content: Text(
                'Tekrar deneyin',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headline5!.fontSize,
                ),
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _textSpeech = '';
                      });
                      Navigator.pop(context);
                    },
                    child: const Text('Ok'))
              ],
            ),
          );
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            _isListening ? Icons.mic : Icons.mic_off,
            size: 32,
            color: Colors.blue,
          ),
          Text(
            _isListening ? 'DURDURMAK İÇİN DOKUNUN' : 'KONUŞMAK İÇİN DOKUN',
            style: const TextStyle(fontSize: 18, color: Colors.blue),
          ),
        ],
      ),
    );
  }

  CustomPopupMenu translatedTextPopupButton() {
    return CustomPopupMenu(
      menuBuilder: () => Container(
          decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border.all(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.translatedText,
              style: const TextStyle(fontSize: 24),
            ),
          )),
      position: PreferredPosition.bottom,
      barrierColor: Colors.transparent,
      pressType: PressType.singleClick,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
            width: 2,
          ),
        ),
        child: const Icon(
          Icons.translate,
          color: Colors.blue,
          size: 36,
        ),
      ),
    );
  }

  Expanded learnEnglishTextContainer(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
            width: 2,
          ),
        ),
        child: Text(
          widget.learnEnglishText,
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.headline5!.fontSize,
          ),
        ),
      ),
    );
  }

  CustomSpeakerButton listenTextButton(TextToSpeech tts) {
    return CustomSpeakerButton(
        onPressed: () {
          tts.speak(widget.learnEnglishText);
        },
        icon: Icons.volume_up);
  }

  Text infoText(BuildContext context) {
    return Text(
      widget.infoText,
      style: TextStyle(
        fontSize: Theme.of(context).textTheme.headline6!.fontSize,
      ),
    );
  }
}
