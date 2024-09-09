import 'package:qoutes/services/qoute_model.dart';
import 'package:qoutes/services/get_data.dart';

Future<List<QouteModel>> allQoutes(List<String>? category) async {
  List<QouteModel> myqoutes = [];
  Services qoute = Services();

  for (int i = 0; i < category!.length; i++) {
    myqoutes.add(await qoute.getData(category[i])!);
    
  }
  
  return myqoutes;
}
