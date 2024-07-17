class DallE {
  int created = -1;
  List<Data>? data;

  DallE({this.created = -1, this.data});

  DallE.fromJson(Map<String, dynamic> json) {
    created = json['created'] ?? -1;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['created'] = created;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String url = '';

  Data({this.url = ''});

  Data.fromJson(Map<String, dynamic> json) {
    url = json['url'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    return data;
  }
}
