class Message {
  String? message;
  String? id;

  Message({this.message, this.id});

  Message.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    data['id'] = id;
    return data;
  }
}
