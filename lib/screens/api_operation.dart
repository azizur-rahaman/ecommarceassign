import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiOperations extends StatefulWidget {
  const ApiOperations({super.key});

  @override
  State<ApiOperations> createState() => _ApiOperationsState();
}

class _ApiOperationsState extends State<ApiOperations> {
  var data;
  var brand;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'data',
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
              onPressed: () async {
                http.Response response = await http.get(Uri.parse(
                    'https://panel.supplyline.network/api/product/search-suggestions/?limit=10&offset=10&search=rice'));

                // print(jsonDecode(response.body)['data']);
                data = jsonDecode(response.body)['data']['products']['results'];

                setState(() {});
              },
              child: Text("Elevated")),
          SizedBox(height: 20),
          Expanded(
              child: data == null
                  ? Container()
                  : ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        var brand = data[index]['brand'];
                        var charge = data[index]['charge'];
                        print(brand);
                        return Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //id
                              Text("ID: ${data[index]['id']}",
                                  style: TextStyle(fontSize: 20)),
                              SizedBox(height: 10),

                              //name
                              Text("Brand Name: ${brand['name']}",
                                  style: TextStyle(fontSize: 20)),
                              SizedBox(height: 10),

                              //brand image
                              Image.network(brand['image'].toString()),
                              SizedBox(height: 10),

                              //slug
                              Text("Slug: ${brand['slug']}",
                                  style: TextStyle(fontSize: 20)),
                              SizedBox(height: 10),

                              //image
                              Image.network(data[index]['image']),
                              SizedBox(height: 10),
                            ],
                          ),
                        );
                      }))
        ],
      ),
    );
  }
}
