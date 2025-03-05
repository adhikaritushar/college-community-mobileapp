class BranchEntity {
  final String? id;
  final String? name;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  BranchEntity({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  BranchEntity copyWith({
    String? id,
    String? name,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) {
    return BranchEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }

  @override
  String toString() {
    return 'BranchEntity(id: $id, name: $name, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }

  @override
  bool operator ==(covariant BranchEntity other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.createdAt == createdAt && other.updatedAt == updatedAt && other.v == v;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode ^ v.hashCode;
  }
}
