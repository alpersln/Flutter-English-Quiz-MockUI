import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LearningVideoExamples extends StatelessWidget {
  final String infoText;
  final String mockVideoUrl;
  final String learnEnglishText;
  final String learnTranslatedText;
  const LearningVideoExamples(
      {Key? key,
      required this.infoText,
      required this.mockVideoUrl,
      required this.learnEnglishText,
      required this.learnTranslatedText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Spacer(),
          Text(
            infoText,
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.headline6!.fontSize,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Image.asset(mockVideoUrl),
          Text(
            learnEnglishText,
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.headline4!.fontSize,
            ),
          ),
          Text(
            learnTranslatedText,
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: Theme.of(context).textTheme.headline6!.fontSize,
            ),
          ),
          Spacer(),
          //   Expanded(child: ),
        ],
      ),
    );
  }
}
