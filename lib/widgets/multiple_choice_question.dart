import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:text_to_speech/text_to_speech.dart';

class MultipleChoiceQuestion extends StatefulWidget {
  final String instructionText;
  final String mockImage;
  final String questionText;
  final String firstChoice;
  final String secondChoice;
  final String thirdChoice;
  final String correctAnswer;

  const MultipleChoiceQuestion(
      {Key? key,
      required this.instructionText,
      required this.mockImage,
      required this.questionText,
      required this.firstChoice,
      required this.secondChoice,
      required this.thirdChoice,
      required this.correctAnswer})
      : super(key: key);

  @override
  State<MultipleChoiceQuestion> createState() => _MultipleChoiceQuestionState();
}
// TODO: Text to speech

class _MultipleChoiceQuestionState extends State<MultipleChoiceQuestion> {
  TextToSpeech tts = TextToSpeech();

  var selectedBorderColor = Colors.blue;
  var selectedChoice = "";

  @override
  Widget build(BuildContext context) {
    var columnList1 = [
      "He",
      "It",
      "She",
    ];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            widget.instructionText,
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.headline6!.fontSize,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Image.asset(widget.mockImage),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.questionText,
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.headline4!.fontSize,
              ),
            ),
          ),
          Column(
            children: columnList1
                .map((e) => Padding(
                      padding: EdgeInsets.all(8),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedChoice = e;
                            print(selectedChoice);
                          });
                          if (selectedChoice == widget.correctAnswer) {
                            selectedBorderColor = Colors.green;
                            tts.speak(
                                "${widget.correctAnswer} ${widget.questionText}");
                          } else {
                            selectedBorderColor = Colors.red;
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          width: MediaQuery.of(context).size.width / 1.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: selectedChoice == e
                                  ? selectedBorderColor
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
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
          // InkWell(
          //   onTap: () {
          //     setState(() {
          //       selectedChoice = widget.secondChoice;
          //     });
          //   },
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Container(
          //       padding: EdgeInsets.all(8.0),
          //       width: MediaQuery.of(context).size.width / 1.5,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(16),
          //         border: Border.all(
          //           color: Colors.grey,
          //           width: 3,
          //         ),
          //       ),
          //       child: Text(
          //         widget.secondChoice,
          //         style: TextStyle(
          //           fontStyle: FontStyle.italic,
          //           fontSize: Theme.of(context).textTheme.headline6!.fontSize,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // InkWell(
          //   onTap: () {
          //     setState(() {
          //       selectedChoice = widget.thirdChoice;
          //     });
          //   },
          //   child: Container(
          //     padding: EdgeInsets.all(8.0),
          //     width: MediaQuery.of(context).size.width / 1.5,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(16),
          //       border: Border.all(
          //         color: Colors.grey,
          //         width: 3,
          //       ),
          //     ),
          //     child: Text(
          //       widget.thirdChoice,
          //       style: TextStyle(
          //         fontStyle: FontStyle.italic,
          //         fontSize: Theme.of(context).textTheme.headline6!.fontSize,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
