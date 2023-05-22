class ChatCompletion {
  String id = '';
  String object = '';
  int created = -1;
  String model = '';
  List<Choices>? choices;

  ChatCompletion({
    this.id = '',
    this.object = '',
    this.created = -1,
    this.model = '',
    this.choices,
  });

  ChatCompletion.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    object = json['object'] ?? '';
    created = json['created'] ?? -1;
    model = json['model'] ?? '';
    if (json['choices'] != null) {
      choices = <Choices>[];
      json['choices'].forEach((v) {
        choices!.add(Choices.fromJson(v));
      });
    } else {
      choices = <Choices>[];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['object'] = object;
    data['created'] = created;
    data['model'] = model;
    if (choices != null) {
      data['choices'] = choices!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Choices {
  Delta? delta;
  int index = -1;
  String finishReason = '';

  Choices({this.delta, this.index = -1, this.finishReason = ''});

  Choices.fromJson(Map<String, dynamic> json) {
    delta = json['delta'] != null ? Delta.fromJson(json['delta']) : Delta();
    index = json['index'] ?? -1;
    finishReason = json['finish_reason'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (delta != null) {
      data['delta'] = delta!.toJson();
    }
    data['index'] = index;
    data['finish_reason'] = finishReason;
    return data;
  }
}

class Delta {
  String role = '';
  String content = '';

  Delta({this.role = '', this.content = ''});

  Delta.fromJson(Map<String, dynamic> json) {
    role = json['role'] ?? '';
    content = json['content'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['role'] = role;
    return data;
  }
}
