import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DatabaseStats extends StatefulWidget {
  const DatabaseStats({Key? key, required this.label, required this.data})
      : super(key: key);
  final dynamic label;
  final dynamic data;

  @override
  State<DatabaseStats> createState() => _DatabaseStatsState();
}

class _DatabaseStatsState extends State<DatabaseStats> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.label.toString(),
        ),
        Text(
          widget.data.toString(),
        ),
      ],
    );
  }
}
