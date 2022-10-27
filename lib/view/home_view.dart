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
    MatchingBoxes(
      firstColumnList: const [
        "She",
        "He",
        "It",
      ],
      secondColumnList: const [
        "He",
        "It",
        "She",
      ],
      columnWithIcons: const {
        'He': Icons.man,
        'It': Icons.pets,
        'She': Icons.woman,
      },
    ),
    const MultipleChoiceQuestion(
      instructionText: "Aşağıdaki resim için doğru seçeneği seçiniz.",
      mockImage: "assets/multiple_choice/img_multiple_choice_doctor.png",
      questionText: "_____ is a doctor",
      correctAnswer: "He",
      fullAnswer: "He is a doctor",
      choices: [
        "He",
        "It",
        "She",
      ],
    ),
    const PutInOrderTexts(
      questionText: "",
      infoText: "Bu ifadeyi doğru sırayla oluşturalım",
      mockImageUrl: "assets/put_in_order/img_put_in_order_teacher.png",
      listOfWords: [
        "is",
        "teacher",
        "He",
        "She",
        "a",
      ],
      correctSentence: "She is a teacher",
    ),
    const ListenTalkPractices(
      infoText: "Cümleyi sesli şekilde söyle",
      mockImageUrl: "assets/listen_talk/img_listen_talk_girl.png",
      learnEnglishText: "She is a girl",
      translatedText: "O bir kız",
      isSpeechEnabled: true,
      showTrickInfoContainer: false,
      trickInfoText: '',
    ),
    const MultipleChoiceQuestion(
      instructionText: "Doğru çeviriyi seçiniz.",
      mockImage: "assets/multiple_choice/img_multiple_woman.png",
      questionText: "O bir kadın.",
      correctAnswer: "She is a woman",
      fullAnswer: "She is a woman",
      choices: [
        "He is a man",
        "It is a woman",
        "She is a woman",
      ],
    ),
    const ListenTalkPractices(
      infoText: "'is' fiiline 'not' getirerek cümleyi olumsuz yapabiliriz.",
      mockImageUrl: "assets/listen_talk/gif_listen_talk_loki.gif",
      learnEnglishText: "He is not my father",
      translatedText: "O benim babam değil",
      isSpeechEnabled: true,
      showTrickInfoContainer: false,
      trickInfoText: '',
    ),
    const ListenTalkPractices(
      infoText: "isn't şeklinde kısaltma yapabiliriz",
      mockImageUrl: "assets/listen_talk/img_listen_talk_ducks.png",
      learnEnglishText: "It isn't ugly",
      translatedText: "O çirkin değil",
      isSpeechEnabled: false,
      showTrickInfoContainer: false,
      trickInfoText: '',
    ),
    const ListenTalkPractices(
      infoText:
          "Is ifadesini cümlenin başında kullanıldığında bir soru cümlesi oluşmuş olur.",
      mockImageUrl: "assets/listen_talk/gif_listen_talk_girlfriend.gif",
      learnEnglishText: "Is she your girlfriend?",
      translatedText: "O senin kız arkadaşın mı?",
      isSpeechEnabled: false,
      showTrickInfoContainer: true,
      trickInfoText:
          "Evet ya da Hayır demek için 'Yes, She is' veya 'No, She isn't' denebilir",
    ),
    const ListenTalkPractices(
        infoText:
            "'Is' ifadesini cümlenin başında kullanıldığında bir soru cümlesi oluşmuş olur.",
        mockImageUrl: "assets/listen_talk/gif_listen_talk_he_okay.gif",
        learnEnglishText: "Is he okay?",
        translatedText: "O iyi mi?",
        isSpeechEnabled: true,
        showTrickInfoContainer: false,
        trickInfoText: ""),
    const ListenTalkPractices(
        infoText:
            "Soru ifadelerinde soru kelimesinden hemen sonra ve özneden önce kullanılır",
        mockImageUrl: "assets/listen_talk/gif_listen_talk_who_is_he.gif",
        learnEnglishText: "Who is he",
        translatedText: "Kim o?, O kim?",
        isSpeechEnabled: false,
        showTrickInfoContainer: true,
        trickInfoText:
            "Soru ifadelerinde cümle yapısı şu şekildedir.Wh… (What, Who, Where..) + am/is/are + I/He-She-It/You + …"),
    const PutInOrderTexts(
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
    const MultipleChoiceQuestion(
      instructionText: "Ses kaydını dinleyin ve doğru cevabı seçin.",
      mockImage: "assets/multiple_choice/img_multiple_mp4.png",
      questionText: "O bir kız.",
      correctAnswer: "she's a girl",
      fullAnswer: "she's a girl",
      choices: [
        "he's a girl",
        "she's a girl",
        "she isn't a girl",
      ],
    ),
    const ListenTalkPractices(
        infoText: "Cümleyi sesli şekilde söyle",
        mockImageUrl: "assets/listen_talk/img_listen_talk_ballons.png",
        learnEnglishText: "Is it a house?",
        translatedText: "O bir ev mi?",
        isSpeechEnabled: true,
        showTrickInfoContainer: true,
        trickInfoText:
            "Sadece tek bir evden bahsedildiği için başına “a” gelir"),
    MatchingBoxes(
      firstColumnList: const [
        "Who is he?",
        "Who is it?",
        "Who is she?",
      ],
      secondColumnList: const [
        "Who is she?",
        "Who is he?",
        "Who is it?",
      ],
      columnWithIcons: const {
        'Who is she?': Icons.woman,
        'Who is he?': Icons.man,
        'Who is it?': Icons.pets,
      },
    ),
    MatchingBoxes(
      firstColumnList: const [
        "a",
        "b",
        "c",
      ],
      secondColumnList: const [
        "c",
        "a",
        "b",
      ],
      columnWithIcons: const {
        'c': Icons.graphic_eq,
        'b': Icons.graphic_eq,
        'a': Icons.graphic_eq,
      },
    ),
  ];
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height * 0.9;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (selectedIndex <= lisOfWidgets.length - 2) {
              selectedIndex += 1;
            }
            // selectedIndex += 1;
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
