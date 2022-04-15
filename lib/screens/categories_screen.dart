import 'dart:io';

import 'package:azkar_app/screens/azkar_screen.dart';
import 'package:azkar_app/services/api_helper.dart';
import 'package:azkar_app/widgets/zekr_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/zekr_widget.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Helper.getDuaa();
    addFirstDuaa();
  }

  List<ZekrWidget> initZikr = [];
  void addFirstDuaa() async {
    Map<String, String?>? duaa = await Helper.getDuaa();
    setState(() {
      if (duaa != null) {
        initZikr.add(ZekrWidget(
          name: duaa["duaa"]!,
          description: duaa["description"],
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xff081C15),
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 70,
          backgroundColor: Color(0xff1B4332),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30.0),
            ),
          ),
          centerTitle: true,
          title: Text(
            'اختر نوعا من الأذكار',
            style: TextStyle(
              fontFamily: "Cairo",
            ),
          ),
        ),
        body: ListView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          padding: EdgeInsets.all(8.0),
          children: [
            ...initZikr,
            ZekrTile(
              "أذكار الصباح",
              zekrType: "m",
            ),
            ZekrTile(
              "أذكار المساء",
              zekrType: "e",
            ),
            ZekrTile(
              "أذكار بعد السلام من الصلاة المفروضة",
              zekrType: "as",
            ),
            ZekrTile(
              "تسابيح و اذكار عشوائية	",
              zekrType: "t",
            ),
            ZekrTile(
              "أذكار قبل النوم	",
              zekrType: "bs",
            ),
            ZekrTile(
              "أذكار الاستيقاظ	",
              zekrType: "wu",
            ),
            ZekrTile(
              "أدعية قرآنية	",
              zekrType: "qd",
            ),
            ZekrTile(
              "أدعية الأنبياء",
              zekrType: "pd",
            )
          ],
        ),
      ),
    );
  }
}
