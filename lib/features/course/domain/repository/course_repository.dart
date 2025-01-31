import 'package:college_community_main/core/error/failure.dart';
import 'package:college_community_main/features/course/domain/entity/course_entity.dart';
import 'package:dartz/dartz.dart';


abstract interface class ICourseRepository {
  Future<Either<Failure, List<CourseEntity>>> getCourses();
  Future<Either<Failure, void>> createCourse(CourseEntity course);
  Future<Either<Failure, void>> deleteCourse(String id);
}
