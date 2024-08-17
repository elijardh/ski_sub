class Make {
  int? id;
  String? name;

  Make({this.id, this.name});

  factory Make.fromJson(Map<String, dynamic> json) => Make(
        id: json['id'] as int?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
