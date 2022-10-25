import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class IntroInfo extends StatelessWidget {
  const IntroInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Text(
                "Introducing Others",
                style: TextStyle(
                  fontSize:
                      //bodytext1
                      Theme.of(context).textTheme.headline3!.fontSize,
                ),
              ),
            ),
            Expanded(
                flex: 3,
                child: Image.asset(
                  "assets/img_intro_info.png",
                )),
            Expanded(
                flex: 3,
                child: Container(
                  color: Colors.yellow[200],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      Expanded(
                        child: Text(
                          "Birinden bahsederken dilimizde 'O' diye belirttiğimiz kişi için İngilizce dilinde",
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Icon(Icons.trip_origin),
                            ),
                            Text("Erkekler için 'He'"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Icon(Icons.trip_origin),
                            ),
                            Text("Kadınlar için 'She'"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Icon(Icons.trip_origin),
                            ),
                            Flexible(
                              child: Text(
                                  "Hayvan, Nesne veya Bitkilerden bahsederken ise 'It' kullanırız"),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                )),
            Expanded(child: Text("")),
          ],
        ),
      ),
    );
  }
}
