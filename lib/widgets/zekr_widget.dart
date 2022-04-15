import 'package:flutter/material.dart';

class ZekrWidget extends StatelessWidget {
  final String name;
  final String? description;

  const ZekrWidget({Key? key, required this.name, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8.0),
      decoration: BoxDecoration(
          color: Color(0xff2D6A4F), borderRadius: BorderRadius.circular(33)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {},
                  iconSize: 30,
                  icon: Icon(
                    Icons.bookmark_add,
                    color: Colors.white,
                  ))
            ],
          ),
          SizedBox(
            height: description == null ? 0 : 10,
          ),
          Text(
            description == null ? "" : description!,
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.white54,
            ),
          ),
        ],
      ),
      padding: EdgeInsets.all(15.0),
    );
  }
}
