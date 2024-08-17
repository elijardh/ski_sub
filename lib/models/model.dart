import 'make.dart';

class Model {
  int? id;
  String? name;
  Make? make;

  Model({this.id, this.name, this.make});

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        id: json['id'] as int?,
        name: json['name'] as String?,
        make: json['make'] == null
            ? null
            : Make.fromJson(json['make'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'make': make?.toJson(),
      };
}
