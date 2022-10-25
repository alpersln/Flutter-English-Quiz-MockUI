import 'package:english_quiz_app/widgets/learning_video_examples.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/intro_info.dart';
import '../widgets/matching_boxes.dart';

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
    MatchingBoxes(),
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
        child: const Icon(Icons.add),
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
