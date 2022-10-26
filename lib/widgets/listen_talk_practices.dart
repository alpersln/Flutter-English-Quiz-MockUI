import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:english_quiz_app/widgets/reusable_widgets/custom_speaker_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:text_to_speech/text_to_speech.dart';

class ListenTalkPractices extends StatefulWidget {
  final String infoText;
  final String mockImageUrl;
  final String learnEnglishText;
  final String translatedText;
  final bool isSpeechEnabled;
  const ListenTalkPractices(
      {Key? key,
      required this.infoText,
      required this.mockImageUrl,
      required this.learnEnglishText,
      required this.translatedText,
      required this.isSpeechEnabled})
      : super(key: key);

  @override
  State<ListenTalkPractices> createState() => _ListenTalkPracticesState();
}

class _ListenTalkPracticesState extends State<ListenTalkPractices> {
  //             -------------   s t t   -------------

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

  //             -------------   s t t   -------------
  @override
  Widget build(BuildContext context) {
    TextToSpeech tts = TextToSpeech();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            widget.infoText,
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.headline6!.fontSize,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Image.asset(widget.mockImageUrl),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomSpeakerButton(
                  onPressed: () {
                    tts.speak(widget.learnEnglishText);
                  },
                  icon: Icons.volume_up),
              Expanded(
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
                      fontSize: Theme.of(context).textTheme.headline4!.fontSize,
                    ),
                  ),
                ),
              ),
              //---
              CustomPopupMenu(
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    Icons.translate,
                    color: Colors.blue,
                    size: 36,
                  ),
                ),
                menuBuilder: () => Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.translatedText,
                        style: TextStyle(fontSize: 24),
                      ),
                    )),
                position: PreferredPosition.bottom,
                barrierColor: Colors.transparent,
                pressType: PressType.singleClick,
              )
            ],
          ),
          Text(
            _textSpeech,
          ),
          const SizedBox(
            height: 72,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              onListen();

              if (widget.learnEnglishText == _textSpeech) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Icon(
                      Icons.check_circle,
                      size: 84,
                      color: Colors.green,
                    ),
                    content: Text(
                      "Tebrikler!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.headline5!.fontSize,
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
                          child: Text('Ok'))
                    ],
                  ),
                );
              } else if (_textSpeech == '') {
                return;
              } else {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Icon(Icons.cancel, size: 84, color: Colors.red),
                    content: Text(
                      'Tekrar deneyin',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.headline5!.fontSize,
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
                          child: Text('Ok'))
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
                ),
                Text(
                  _isListening
                      ? 'DURDURMAK İÇİN DOKUNUN'
                      : 'KONUŞMAK İÇİN DOKUN',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
