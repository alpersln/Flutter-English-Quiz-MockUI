import 'package:english_quiz_app/widgets/learning_video_examples.dart';
import 'package:english_quiz_app/widgets/listen_talk_practices.dart';
import 'package:english_quiz_app/widgets/multiple_choice_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/intro_info.dart';
import '../widgets/matching_boxes.dart';
import '../widgets/put_in_order_texts.dart';

class HomeView extends StatefulWidget {
  int selectedIn = 0;

  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var selectedIndex = 0;
  // void tabChanger(int index) {
  //   setState(() {
  //     selectedIndex = index;
  //   });
  // }

  List lisOfWidgets = [
    ListenTalkPractices(
        infoText: "Cümleyi sesli şekilde söyle",
        mockImageUrl: "assets/listen_talk/img_listen_talk_girl.png",
        learnEnglishText: "She is a girl",
        translatedText: "O bir kız",
        isSpeechEnabled: true),
    const IntroInfo(),
    const LearningVideoExamples(
      infoText:
          "Bir erkekten bahsederken 'he' öznesi ve sonrasında 'is' kullanılır",
      mockVideoUrl: "assets/learn/img_learn_he_man.png",
      learnEnglishText: "He is a man.",
      learnTranslatedText: "O bir erkek.",
      showTrickInfoContainer: false,
      trickInfoText: "",
      trickExampleText: "",
    ),
    const LearningVideoExamples(
      infoText:
          "Bir erkekten bahsederken 'he' öznesi ve sonrasında 'is' kullanılır",
      mockVideoUrl: "assets/learn/img_learn_obama.png",
      learnEnglishText: "He is a good man.",
      learnTranslatedText: "O iyi bir adam.",
      showTrickInfoContainer: false,
      trickInfoText: "",
      trickExampleText: "",
    ),
    const LearningVideoExamples(
      infoText:
          "Bir kadından bahsederken 'she' öznesi ve sonrasında 'is' kullanılır",
      mockVideoUrl: "assets/learn/img_learn_she_ra.png",
      learnEnglishText: "She is a woman.",
      learnTranslatedText: "O bir kadın.",
      showTrickInfoContainer: true,
      trickInfoText: "Aynı cümle şu şekilde de yazılabilir:",
      trickExampleText: "She's a woman.",
    ),
    const LearningVideoExamples(
      infoText:
          "İnsan dışındaki özneler veya nesnelerden bahsederken 'it' kullanırız ve 'is' ile devam ederiz",
      mockVideoUrl: "assets/learn/img_learn_cat.png",
      learnEnglishText: "It is a cat.",
      learnTranslatedText: "O bir kedi.",
      showTrickInfoContainer: true,
      trickInfoText:
          "Cinsiyeti bilinen hayvanlar için de 'he/she' kullanılabilir",
      trickExampleText: "She's a woman.",
    ),
    MatchingBoxes(),
    const MultipleChoiceQuestion(
      instructionText: "Aşağıdaki resim için doğru seçeneği seçiniz.",
      mockImage: "assets/multiple_choice/img_multiple_choice_doctor.png",
      questionText: "_____ is a doctor",
      firstChoice: "He",
      secondChoice: "It",
      thirdChoice: "She",
      correctAnswer: "He",
    ),
    PutInOrderTexts(
      questionText: "O bekar mı?",
      infoText: "Bu ifadeyi doğru sırayla oluşturalım",
      mockImageUrl: "assets/put_in_order/img_put_in_order_single.png",
      listOfWords: [
        "is",
        "single",
        "he",
        "she",
        "boy",
        "What",
        "good",
      ],
      correctSentence: "is he single",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height * 0.9;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            selectedIndex += 1;
          });
          print(selectedIndex);
        },
        child: const Icon(Icons.navigate_next),
      ),
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: lisOfWidgets.length - 1,
          itemBuilder: (context, index) {
            return Container(
                alignment: Alignment.topCenter,
                height: _height,
                child: lisOfWidgets[selectedIndex]);
          }),
    );
  }
}
