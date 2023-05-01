
import 'usage.dart';

class TextCompletion {
  String? id;
  String? object;
  int? created;
  String? model;
  List<ChoicesTC>? choices;
  Usage? usage;

  TextCompletion(
      {this.id,
      this.object,
      this.created,
      this.model,
      this.choices,
      this.usage});

  TextCompletion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    created = json['created'];
    model = json['model'];
    if (json['choices'] != null) {
      choices = <ChoicesTC>[];
      json['choices'].forEach((v) {
        choices!.add(ChoicesTC.fromJson(v));
      });
    }
    usage = json['usage'] != null ? Usage.fromJson(json['usage']) : null;
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
    if (usage != null) {
      data['usage'] = usage!.toJson();
    }
    return data;
  }
}

class ChoicesTC {
  String? text;
  int? index;
  int? logprobs;
  String? finishReason;

  ChoicesTC({this.text, this.index, this.logprobs, this.finishReason});

  ChoicesTC.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    index = json['index'];
    logprobs = json['logprobs'];
    finishReason = json['finish_reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['index'] = index;
    data['logprobs'] = logprobs;
    data['finish_reason'] = finishReason;
    return data;
  }
}
