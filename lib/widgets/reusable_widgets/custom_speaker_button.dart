import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomSpeakerButton extends StatelessWidget {
  final void Function() onPressed;
  const CustomSpeakerButton({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey,
          width: 2,
        ),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.volume_up,
          color: Colors.blue,
          size: 36,
        ),
      ),
    );
  }
}
