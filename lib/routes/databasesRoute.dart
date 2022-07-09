// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mongonav/components/databaseInfo.dart';
import 'package:mongonav/components/databasesCard.dart';

class DatabaseRoute extends StatefulWidget {
  const DatabaseRoute({Key? key, required this.data}) : super(key: key);
  final dynamic data;

  @override
  State<DatabaseRoute> createState() => _DatabaseRouteState();
}

class _DatabaseRouteState extends State<DatabaseRoute> {
// bottom sheet
  void showDBStats() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return DatabaseInfo(data: widget.data['stats']);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Databases'),
      ),
      body: ListView(
        children: [
          // Server Info
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            padding: EdgeInsets.only(
                left: 15.0, right: 15.0, top: 10.0, bottom: 15.0),
            child: Column(
              children: [
                Text("Server Info"),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Port:',
                    ),
                    Text(
                      widget.data['serverInfo']['port'].toString(),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Host:',
                    ),
                    Text(
                      widget.data['serverInfo']['host'].toString(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Databases
          Container(
            // height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            padding:
                EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0, bottom: 5.0),
            child: Column(
              children: [
                Text("Databases"),
                // Database Info
                Container(
                  padding: EdgeInsets.only(
                      left: 25.0, right: 25.0, top: 10.0, bottom: 5.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Size (MB):',
                          ),
                          Text(
                            widget.data['totalDB']['totalSizeMb'].toString(),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Size (KB):',
                          ),
                          Text(
                            widget.data['totalDB']['totalSize'].toString(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Databases
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.data['totalDB']['databases'].length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        showDBStats();
                      },
                      child: DatabasesCard(
                        data: widget.data['totalDB']['databases'][index],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Text("......"),
        ],
      ),
    );
  }
}
