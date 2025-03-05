class SubjectEntity {
  final String? id;
  final String? name;
  final int? code;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  SubjectEntity({
    this.id,
    this.name,
    this.code,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  SubjectEntity copyWith({
    String? id,
    String? name,
    int? code,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) {
    return SubjectEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }

  @override
  String toString() {
    return 'SubjectEntity(id: $id, name: $name, code: $code, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }

  @override
  bool operator ==(covariant SubjectEntity other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.code == code && other.createdAt == createdAt && other.updatedAt == updatedAt && other.v == v;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ code.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode ^ v.hashCode;
  }
}
