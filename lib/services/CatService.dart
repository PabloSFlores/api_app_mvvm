import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:api_app_mvvm/models/Cat.dart';

class CatService {
  // URL de la api que vamos a consumir
  static const String _url = "https://api.thecatapi.com/v1/images/search";

  Future<Cat> fetchRandomCat() async{
    final response = await http.get(Uri.parse(_url));
    if(response.statusCode == 200){
      final List<dynamic> data = jsonDecode(response.body);
      return Cat.fromJson(data[0]);
    } else {
      throw Exception("No le sabes, ya no le muevas");
    }
  }
}
