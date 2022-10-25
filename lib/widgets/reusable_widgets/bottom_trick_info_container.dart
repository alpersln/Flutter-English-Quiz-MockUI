import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.yellow,
            child: Column(
              children: [
                Text(
                  infoText,
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.headline6!.fontSize,
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
        ),
      ],
    );
  }
}