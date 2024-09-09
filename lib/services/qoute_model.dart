class QouteModel {
  String qoute;
  String author;

  QouteModel({required this.qoute, required this.author});

  factory QouteModel.fromJason(dynamic data) {
    
    return QouteModel(qoute: data[0]["quote"], author: data[0]["author"]);
  }
}
