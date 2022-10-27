import 'package:flutter/material.dart';

class BottomTrickInfoContainer extends StatelessWidget {
  final String infoText;
  final String exampleText;
  const BottomTrickInfoContainer(
      {Key? key, required this.infoText, required this.exampleText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Image.asset("assets/learn/img_trick_info_container.png")),
        trickInfoText(context),
      ],
    );
  }

  Expanded trickInfoText(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        color: Colors.yellow,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                infoText,
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headline6!.fontSize,
                ),
              ),
            ),
            Text(
              exampleText,
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.headline6!.fontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
