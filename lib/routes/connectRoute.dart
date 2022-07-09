// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mongonav/routes/databasesRoute.dart';

class ConnectRoute extends StatefulWidget {
  const ConnectRoute({Key? key}) : super(key: key);

  @override
  State<ConnectRoute> createState() => _ConnectRouteState();
}

class _ConnectRouteState extends State<ConnectRoute> {
  TextEditingController connectionStringController = TextEditingController();
  Future<void> connectToDB() async {
    print('connecting');
    // get text from text field
    String connString = connectionStringController.text;
    print(connString);
    // Send API request
    dynamic url = Uri.parse(
        'https://dagmawibabi.com/mna/connect?connectionString=${connString}');
    dynamic response = await http.get(url);
    print(url);
    dynamic responseJSON = jsonDecode(response.body);
    print(response.statusCode);
    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DatabaseRoute(data: responseJSON),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00A35C),
        title: const Text('MongoNav'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter your MongoDB connection string',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: connectionStringController,
                decoration: const InputDecoration(
                  hintText: 'mongodb://localhost:27017',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                connectToDB();
              },
              child: Text(
                'Connect',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
