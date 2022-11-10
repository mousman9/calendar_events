import 'package:calendar_events/utils/text_styles.dart';
import 'package:flutter/material.dart';

// All rights reserved by Healer

class PrimaryButton extends StatelessWidget {
  final String label;
  final Color? color;
  final GestureTapCallback onPress;
  final dynamic icon;
  final dynamic keys;
  final double buttonHight;
  double radius;

  PrimaryButton(
      {super.key,
      required this.label,
      required this.onPress,
      this.color,
      this.radius = 6,
      this.icon,
      this.keys,
      this.buttonHight = 40.0});

  @override
  Widget build(BuildContext context) => SizedBox(
        height: buttonHight,
        child: ElevatedButton(
          onPressed: onPress,
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(2),
              backgroundColor:
                  MaterialStateProperty.all(color ?? Colors.redAccent),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),
                ),
              )),
          child: Text(
            label,
            style: normalText(15).copyWith(color: Colors.white),
          ),
        ),
      );
}

// CupertinoButton(child: Text(
// label,
// style: Theme.of(context)
// .textTheme
//     .button
//     .copyWith(color: textColor ?? Theme.of(context).primaryColor),
// ), onPressed: onPress,):
