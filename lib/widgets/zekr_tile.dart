import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/azkar_screen.dart';
class ZekrTile extends StatelessWidget {
  final String title;
  final String zekrType;
  const ZekrTile(
    this.title, {
    required this.zekrType,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, right: 10, left: 10),
      child: Material(
        borderRadius: BorderRadius.circular(13),
        color: Color(0xff2D6A4F),
        child: InkWell(
          splashColor: Color(0xff081C15),
          highlightColor: Color.fromARGB(255, 23, 85, 63),
          onTap: () {
            Navigator.push(context, CupertinoPageRoute(
              builder: (context) {
                return AzkarScreen(zekrType: zekrType);
              },
            ));
          },
          borderRadius: BorderRadius.circular(13),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
        ),
      ),
    );
  }
}