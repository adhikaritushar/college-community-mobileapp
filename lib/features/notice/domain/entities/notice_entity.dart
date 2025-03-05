class NoticeEntity {
  final String? id;
  final String? title;
  final String? description;
  final String? type;
  final String? link;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  NoticeEntity({
    this.id,
    this.title,
    this.description,
    this.type,
    this.link,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  @override
  String toString() {
    return 'NoticeEntity(id: $id, title: $title, description: $description, type: $type, link: $link, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }

  @override
  bool operator ==(covariant NoticeEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.type == type &&
        other.link == link &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.v == v;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ description.hashCode ^ type.hashCode ^ link.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode ^ v.hashCode;
  }
}
