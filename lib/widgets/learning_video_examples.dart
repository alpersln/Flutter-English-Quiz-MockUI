import 'package:english_quiz_app/widgets/reusable_widgets/bottom_trick_info_container.dart';
import 'package:flutter/material.dart';

class LearningVideoExamples extends StatelessWidget {
  final String infoText;
  final String mockVideoUrl;
  final String learnEnglishText;
  final String learnTranslatedText;
  final bool showTrickInfoContainer;
  final String trickInfoText;
  final String trickExampleText;
  const LearningVideoExamples({
    Key? key,
    required this.infoText,
    required this.mockVideoUrl,
    required this.learnEnglishText,
    required this.learnTranslatedText,
    required this.showTrickInfoContainer,
    required this.trickInfoText,
    required this.trickExampleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InfoTextWidget(infoText: infoText),
          const SizedBox(height: 24),
          Image.asset(mockVideoUrl),
          LearnEnglishText(learnEnglishText: learnEnglishText),
          TranslatedText(learnTranslatedText: learnTranslatedText),
          const SizedBox(height: 12),
          if (showTrickInfoContainer) ...[
            BottomTrickInfoContainer(
              infoText: trickInfoText,
              exampleText: trickExampleText,
            )
          ] else
            ...[]
        ],
      ),
    );
  }
}

class TranslatedText extends StatelessWidget {
  const TranslatedText({
    Key? key,
    required this.learnTranslatedText,
  }) : super(key: key);

  final String learnTranslatedText;

  @override
  Widget build(BuildContext context) {
    return Text(
      learnTranslatedText,
      style: TextStyle(
        fontStyle: FontStyle.italic,
        fontSize: Theme.of(context).textTheme.headline6!.fontSize,
      ),
    );
  }
}

class LearnEnglishText extends StatelessWidget {
  const LearnEnglishText({
    Key? key,
    required this.learnEnglishText,
  }) : super(key: key);

  final String learnEnglishText;

  @override
  Widget build(BuildContext context) {
    return Text(
      learnEnglishText,
      style: TextStyle(
        fontSize: Theme.of(context).textTheme.headline4!.fontSize,
      ),
    );
  }
}

class InfoTextWidget extends StatelessWidget {
  const InfoTextWidget({
    Key? key,
    required this.infoText,
  }) : super(key: key);

  final String infoText;

  @override
  Widget build(BuildContext context) {
    return Text(
      infoText,
      style: TextStyle(
        fontSize: Theme.of(context).textTheme.headline6!.fontSize,
      ),
    );
  }
}
