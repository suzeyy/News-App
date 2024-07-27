class SourceModel {
  SourceModel({
    this.id,
    this.name,
  });

  String? id, name;

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      id: json['_id'] ?? "",
      name: json['name'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
