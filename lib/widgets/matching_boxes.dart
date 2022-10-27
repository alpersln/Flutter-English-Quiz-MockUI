import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MatchingBoxes extends StatefulWidget {
  final List firstColumnList;
  final List secondColumnList;
  final columnWithIcons;
  MatchingBoxes(
      {Key? key,
      required this.firstColumnList,
      required this.secondColumnList,
      required this.columnWithIcons})
      : super(key: key);

  @override
  State<MatchingBoxes> createState() => _MatchingBoxesState();
}

class _MatchingBoxesState extends State<MatchingBoxes> {
  var selectedBox1 = "";
  var selectedBox2 = "";
  var selectedBorderColor = Colors.blue;
  var falseBorderColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        exactMatchText(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            matchFirstColumn(context),
            matchSecondColumn(),
          ],
        )
      ],
    );
  }

  Container matchSecondColumn() {
    return Container(
      child: Column(
        children: widget.secondColumnList
            .map((e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (() {
                      setState(
                        () {
                          selectedBox2 = e;
                          print(selectedBox2);
                        },
                      );
                      if (selectedBox1 == selectedBox2) {
                        selectedBorderColor = Colors.green;
                      } else {
                        selectedBorderColor = Colors.red;

                        Timer(Duration(seconds: 1), () {
                          setState(() {
                            selectedBorderColor = Colors.blue;
                          });
                        });
                      }
                    }),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: selectedBox2 == e
                                ? selectedBorderColor
                                : Colors.grey,
                            width: 5),
                      ),
                      height: 100,
                      width: 150,
                      child: Icon(
                        widget.columnWithIcons.entries
                            .firstWhere((element) => element.key == e)
                            .value,
                        size: 54,
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }

  Container matchFirstColumn(BuildContext context) {
    return Container(
      child: Column(
        children: widget.firstColumnList
            .map((e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (() {
                      setState(() {
                        selectedBox1 = e;
                        selectedBox2 = "";
                      });

                      print(selectedBox1);
                    }),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: selectedBox1 == e
                                ? selectedBorderColor
                                : Colors.grey,
                            width: 5),
                      ),
                      height: 100,
                      width: 150,
                      child: Text(
                        e,
                        style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.headline6!.fontSize,
                        ),
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }

  Padding exactMatchText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        "Doğru eşleştirmeleri yapınız",
        style: TextStyle(
            fontSize: Theme.of(context).textTheme.headline5!.fontSize),
      ),
    );
  }
}
