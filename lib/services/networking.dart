import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkAid {
  NetworkAid(this.url);
  late final String url;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
      // print(data);
      var weatherdescription =
          jsonDecode(data)['current']['weather'][0]['description'];

      print(weatherdescription);
      // print(response.body);

      var jsDec = jsonDecode(data);
      return jsDec;
    } else {
      print(response.statusCode);
    }
  }
}
