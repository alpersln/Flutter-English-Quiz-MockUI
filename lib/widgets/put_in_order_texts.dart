import 'package:english_quiz_app/widgets/reusable_widgets/custom_speaker_button.dart';
import 'package:flutter/material.dart';
import 'package:text_to_speech/text_to_speech.dart';

class PutInOrderTexts extends StatefulWidget {
  final String questionText;
  final String mockImageUrl;
  final String infoText;
  final List listOfWords;
  final String correctSentence;
  const PutInOrderTexts(
      {Key? key,
      required this.questionText,
      required this.mockImageUrl,
      required this.infoText,
      required this.listOfWords,
      required this.correctSentence})
      : super(key: key);

  @override
  State<PutInOrderTexts> createState() => _PutInOrderTextsState();
}

class _PutInOrderTextsState extends State<PutInOrderTexts> {
  TextToSpeech tts = TextToSpeech();

  var listOfSelectedWords = [];
  var selectedChoice = "";
  @override
  Widget build(BuildContext context) {
    final joinedNames = listOfSelectedWords.join(' ');

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          questionText(context),
          infoText(context),
          const SizedBox(height: 24),
          Image.asset(widget.mockImageUrl),
          selectedWordsText(joinedNames, context),
          const Divider(thickness: 3),
          selectableWords(context),
          checkAnswerButton(joinedNames, context)
        ],
      ),
    );
  }

  ElevatedButton checkAnswerButton(String joinedNames, BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          if (joinedNames == widget.correctSentence) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Icon(
                  Icons.check_circle,
                  size: 66,
                  color: Colors.green,
                ),
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomSpeakerButton(
                      icon: Icons.volume_up,
                      onPressed: () {
                        tts.speak(widget.correctSentence);
                      },
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      widget.correctSentence,
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.headline5!.fontSize,
                      ),
                    ),
                  ],
                ),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Ok'))
                ],
              ),
            );
          } else {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Icon(Icons.cancel, size: 66, color: Colors.red),
                content: Text(
                  'Try again',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.headline5!.fontSize,
                  ),
                ),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Ok'))
                ],
              ),
            );
          }
        },
        child: const Text("Check Answer"));
  }

  Wrap selectableWords(BuildContext context) {
    return Wrap(
      children: widget.listOfWords
          .map(
            (e) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedChoice = e;
                      listOfSelectedWords.add(e);
                    });
                  },
                  child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color:
                              selectedChoice == e ? Colors.blue : Colors.grey,
                          width: 3,
                        ),
                      ),
                      child: Text(
                        e,
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize:
                              Theme.of(context).textTheme.headline6!.fontSize,
                        ),
                      ))),
            ),
          )
          .toList(),
    );
  }

  Row selectedWordsText(String joinedNames, BuildContext context) {
    return Row(
      children: [
        Text(
          joinedNames,
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.headline4!.fontSize,
          ),
        ),
        const Spacer(),
        //reset button
        IconButton(
          onPressed: () {
            setState(() {
              listOfSelectedWords = [];
            });
          },
          icon: const Icon(
            Icons.refresh,
            color: Colors.blue,
            size: 36,
          ),
        ),
      ],
    );
  }

  Text infoText(BuildContext context) {
    return Text(
      widget.infoText,
      style: TextStyle(
        fontSize: Theme.of(context).textTheme.headline6!.fontSize,
      ),
    );
  }

  Text questionText(BuildContext context) {
    return Text(
      widget.questionText,
      style: TextStyle(
        fontSize: Theme.of(context).textTheme.headline6!.fontSize,
      ),
    );
  }
}
