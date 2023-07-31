import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ApisFile extends StatefulWidget {
  const ApisFile({Key? key}) : super(key: key);

  @override
  State<ApisFile> createState() => _ApisFileState();
}

class _ApisFileState extends State<ApisFile> {
  List<dynamic> apiData = [];
  Future<void> fetchData() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts'); // Replace with your API endpoint
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Request succeeded
      final data = json.decode(response.body);
      setState(() {
        apiData = data;
      });
      // Process the data as needed
      print(data);
    } else {
      // Request failed
      print('Request failed with status: ${response.statusCode}');
    }
  }

  @override
  void initState() {
   super.initState();
   fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
          child: ListView.builder(
              itemCount: apiData.length,
              itemBuilder: (BuildContext context, int index){
            return Container(
              color: Colors.blue,
              height: 100,
              margin: EdgeInsets.only(bottom: 20),
              width: double.infinity,
              child: Center(child: Text("Content here",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),)),
            );
          }),
        ),
      ),
    );
  }
}
