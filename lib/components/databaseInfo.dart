// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mongonav/components/databaseStats.dart';

class DatabaseInfo extends StatefulWidget {
  const DatabaseInfo({Key? key, required this.data}) : super(key: key);
  final Map data;

  @override
  State<DatabaseInfo> createState() => _DatabaseInfoState();
}

class _DatabaseInfoState extends State<DatabaseInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.5,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Title
          Text(
            widget.data['db'],
            style: TextStyle(
              fontSize: 22.0,
              color: Color(0xff00A35C),
            ),
          ),
          // DB Stats
          DatabaseStats(label: 'Databases', data: widget.data['db']),
          DatabaseStats(label: 'collections', data: widget.data['collections']),
          DatabaseStats(label: 'views', data: widget.data['views']),
          DatabaseStats(label: 'objects', data: widget.data['objects']),
          DatabaseStats(label: 'avgObjSize', data: widget.data['avgObjSize']),
          DatabaseStats(label: 'dataSize', data: widget.data['dataSize']),
          DatabaseStats(label: 'storageSize', data: widget.data['storageSize']),
          DatabaseStats(
              label: 'totalFreeStorageSize',
              data: widget.data['totalFreeStorageSize']),
          DatabaseStats(label: 'numExtents', data: widget.data['numExtents']),
          DatabaseStats(label: 'indexes', data: widget.data['indexes']),
          DatabaseStats(label: 'indexSize', data: widget.data['indexSize']),
          DatabaseStats(
              label: 'indexFreeStorageSize',
              data: widget.data['indexFreeStorageSize']),
          DatabaseStats(label: 'fileSize', data: widget.data['fileSize']),
          DatabaseStats(label: 'nsSizeMB', data: widget.data['nsSizeMB']),
          // View Collections Button
          ElevatedButton(
            onPressed: () {},
            child: Text("View Collections"),
          ),
        ],
      ),
    );
  }
}
