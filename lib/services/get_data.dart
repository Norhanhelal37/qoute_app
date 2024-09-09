import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:qoutes/services/qoute_model.dart';

class Services {
  Future<QouteModel>? getData(String? category) async {
      http.Response response = await http.get(
          Uri.parse(
            "https://api.api-ninjas.com/v1/quotes?category=$category",
          ),
          headers: {"X-Api-Key": "G9Xuswydn06sYirZTsIEsA==SmGAP3VEC9XZy5lR"});

    dynamic jasonData = jsonDecode(response.body);

    QouteModel data = QouteModel.fromJason(jasonData);

    return data;
  }
}
