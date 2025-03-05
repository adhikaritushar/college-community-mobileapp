import 'package:flutter/foundation.dart';

class MarksEntity {
  final String? id;
  final int? enrollmentNo;
  final Map<String, String>? internal;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  final Map<String, String>? external;

  MarksEntity({
    this.id,
    this.enrollmentNo,
    this.internal,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.external,
  });

  MarksEntity copyWith({
    String? id,
    int? enrollmentNo,
    Map<String, String>? internal,
    String? createdAt,
    String? updatedAt,
    int? v,
    Map<String, String>? external,
  }) {
    return MarksEntity(
      id: id ?? this.id,
      enrollmentNo: enrollmentNo ?? this.enrollmentNo,
      internal: internal ?? this.internal,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
      external: external ?? this.external,
    );
  }

  @override
  String toString() {
    return 'MarksEntity(id: $id, enrollmentNo: $enrollmentNo, internal: $internal, createdAt: $createdAt, updatedAt: $updatedAt, v: $v, external: $external)';
  }

  @override
  bool operator ==(covariant MarksEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.enrollmentNo == enrollmentNo &&
        mapEquals(other.internal, internal) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.v == v &&
        mapEquals(other.external, external);
  }

  @override
  int get hashCode {
    return id.hashCode ^ enrollmentNo.hashCode ^ internal.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode ^ v.hashCode ^ external.hashCode;
  }
}
