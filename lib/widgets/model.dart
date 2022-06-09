class GraphInfo {
  int? id;
  // String code;
  String number;

  GraphInfo({
    this.id,
    // required this.code,
    required this.number,
  });

  factory GraphInfo.fromJson(Map<String, dynamic> json) {
    return GraphInfo(
        id: json["id"],
        // code: json["code"],
        number: json["number"],
     );
  }

  factory GraphInfo.fromMap(Map<String, dynamic> map) => GraphInfo(
    id: map["id"]?.toInt() ?? 0,
    // code: map["code"] ?? '',
    number: map["number"] ?? '',
  );
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      // "code": code,
      "number": number,
    };
  }

  @override
  String toString() => '{'
      //'code: $code, '
      'number: $number,}';
}