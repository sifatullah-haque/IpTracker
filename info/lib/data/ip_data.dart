import 'dart:convert';

import 'package:http/http.dart' as http;

class ipData {
  static Future<String> myIpInfo() async {
    http.Response res =
        await http.get(Uri.parse("https://api.ipify.org/?format=json"));
    if (res.statusCode == 200) {
      return jsonDecode(res.body)["ip"];
    }
    return "No data found";
  }

  static getIpInformation(String ipAdress) async {
    http.Response res =
        await http.get(Uri.parse("https://ipinfo.io/$ipAdress/geo"));
    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    }
    return {
      "ip": "No data found",
      "city": "no data",
      "region": "no data",
      "country": "No data",
      "loc": "No data",
      "org": "No data",
      "postal": "No data",
      "timezone": "No data",
    };
  }
}
