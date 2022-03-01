import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {


  final String urlbeforeparse;

  NetworkHelper(this.urlbeforeparse);

  Future  getData() async{
    var url = Uri.parse(urlbeforeparse);
    http.Response response = await http.get(url);
    if(response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    }
    else {
      print(response.statusCode);
    }
  }
}