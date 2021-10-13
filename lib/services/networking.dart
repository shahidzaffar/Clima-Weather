import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkingHelper
{
  NetworkingHelper({this.url});

  final String url;


  Future getData() async {

    Uri abc=Uri.parse(url);
    http.Response response=await http.get(abc);

    print(response.body);
    if(response.statusCode==200)
      {
        String data=response.body;

        return jsonDecode(data);
      }
    else
      {
        print(response.statusCode);
      }
  }
}