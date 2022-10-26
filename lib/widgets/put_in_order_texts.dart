import 'package:english_quiz_app/widgets/reusable_widgets/custom_speaker_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
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
          Text(
            widget.questionText,
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.headline6!.fontSize,
            ),
          ),
          Text(
            widget.infoText,
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.headline6!.fontSize,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Image.asset(widget.mockImageUrl),
          Row(
            children: [
              Text(
                joinedNames,
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headline4!.fontSize,
                ),
              ),
              Spacer(),
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
          ),
          Divider(thickness: 3),
          Wrap(
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
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: selectedChoice == e
                                    ? Colors.blue
                                    : Colors.grey,
                                width: 3,
                              ),
                            ),
                            child: Text(
                              e,
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .fontSize,
                              ),
                            ))),
                  ),
                )
                .toList(),
          ),
          ElevatedButton(
              onPressed: () {
                if (joinedNames == widget.correctSentence) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Icon(
                        Icons.done,
                        size: 42,
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
                          Text(
                            widget.correctSentence,
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .fontSize,
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Ok'))
                      ],
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Icon(Icons.cancel, size: 42, color: Colors.red),
                      content: Text(
                        'Try again',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.headline5!.fontSize,
                        ),
                      ),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Ok'))
                      ],
                    ),
                  );
                }
              },
              child: Text("Check Answer"))
        ],
      ),
    );
  }
}
