import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MatchingBoxes extends StatefulWidget {
  MatchingBoxes({Key? key}) : super(key: key);

  @override
  State<MatchingBoxes> createState() => _MatchingBoxesState();
}

class _MatchingBoxesState extends State<MatchingBoxes> {
  var selectedBox1 = "";
  var selectedBox2 = "";
  var selectedBorderColor = Colors.blue;
  var falseBorderColor = Colors.red;
  var columnList1 = [
    "She",
    "He",
    "It",
  ];

  var columnList2 = [
    "He",
    "It",
    "She",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              //    color: Colors.deepPurple,
              child: Column(
                children: columnList1
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
            ),
            Container(
              //  color: Colors.blue,
              child: Column(
                children: columnList2
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

                                Timer(Duration(seconds: 2), () {
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
                              child: Text(
                                e,
                                style: TextStyle(
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
            ),
          ],
        )
      ],
    );
  }
}
