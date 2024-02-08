import 'dart:convert';

import 'package:http/http.dart' as http;

class PlantApiService {
  Future<dynamic> sendData(String name, String type, String qty, String price) async
  {
    var client = http.Client();
    var apiUrl = Uri.parse("http://localhost:3001/api/plant/entry");

    var response = await client.post(apiUrl,
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8"
        },
        body: jsonEncode(<String, String>{
          "name": name,
          "type": type,
          "qty": qty,
          "price": price,
        })
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    else {
      throw Exception("failed to add");
    }
  }
}