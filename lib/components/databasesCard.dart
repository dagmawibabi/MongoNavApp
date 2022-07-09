// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DatabasesCard extends StatefulWidget {
  const DatabasesCard({Key? key, required this.data}) : super(key: key);
  final Map data;

  @override
  State<DatabasesCard> createState() => _DatabasesCardState();
}

class _DatabasesCardState extends State<DatabasesCard> {
  Color dbNameColor = Color(0xff00A35C);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 4.0),
      padding:
          EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0, bottom: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.data['name'].toString(),
            style: TextStyle(
              fontSize: 18.0,
              color: dbNameColor,
            ),
          ),
          SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Size',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              Text(
                '${widget.data['sizeOnDisk']} kb',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Empty',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              Text(
                widget.data['empty'].toString(),
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
