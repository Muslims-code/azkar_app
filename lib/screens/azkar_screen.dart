import 'package:flutter/material.dart';
import 'package:azkar_app/widgets/zekr_widget.dart';

import '../services/api_helper.dart';

class AzkarScreen extends StatefulWidget {
  final String zekrType;
  AzkarScreen({Key? key, required this.zekrType}) : super(key: key);

  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  List<ZekrWidget> azkar = [];
  ScrollController controller = ScrollController();
  @override
  void initState() {
    super.initState();
    addFirstDuaa();
  }

  void addFirstDuaa() async {
    Map<String, String?>? duaa = await Helper.getDuaaByType(widget.zekrType);
    setState(() {
      if (duaa != null) {
        azkar.add(ZekrWidget(
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
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Map<String, String?>? duaa =
                await Helper.getDuaaByType(widget.zekrType);
            setState(() {
              if (duaa != null) {
                azkar.add(ZekrWidget(
                  name: duaa["duaa"]!,
                  description: duaa["description"],
                ));
              }
              controller.animateTo(azkar.length.toDouble() * 200,
                  duration: Duration(milliseconds: 700), curve: Curves.ease);
            });
          },
          child: Icon(Icons.add),
          backgroundColor: Color(0xff1B4332),
        ),
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
            'الأذكار',
            style: TextStyle(fontFamily: "Cairo"),
          ),
        ),
        body: ListView.builder(
          controller: controller,
          itemCount: azkar.length,
          itemBuilder: (context, index) {
            return azkar[index];
          },
        ),
      ),
    );
  }
}
