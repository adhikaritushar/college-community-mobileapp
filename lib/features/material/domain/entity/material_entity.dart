// ignore_for_file: public_member_api_docs, sort_constructors_first
class MaterialEntity {
  final String? id;
  final String? faculty;
  final String? subject;
  final String? title;
  final String? link;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  MaterialEntity({
    this.id,
    this.faculty,
    this.subject,
    this.title,
    this.link,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  MaterialEntity copyWith({
    String? id,
    String? faculty,
    String? subject,
    String? title,
    String? link,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) {
    return MaterialEntity(
      id: id ?? this.id,
      faculty: faculty ?? this.faculty,
      subject: subject ?? this.subject,
      title: title ?? this.title,
      link: link ?? this.link,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }

  @override
  String toString() {
    return 'MaterialEntity(id: $id, faculty: $faculty, subject: $subject, title: $title, link: $link, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }

  @override
  bool operator ==(covariant MaterialEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.faculty == faculty &&
        other.subject == subject &&
        other.title == title &&
        other.link == link &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.v == v;
  }

  @override
  int get hashCode {
    return id.hashCode ^ faculty.hashCode ^ subject.hashCode ^ title.hashCode ^ link.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode ^ v.hashCode;
  }
}
