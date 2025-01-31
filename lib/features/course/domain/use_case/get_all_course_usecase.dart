import 'package:college_community_main/app/usecase/usecase.dart';
import 'package:college_community_main/core/error/failure.dart';
import 'package:college_community_main/features/course/domain/entity/course_entity.dart';
import 'package:college_community_main/features/course/domain/repository/course_repository.dart';
import 'package:dartz/dartz.dart';


class GetAllCourseUsecase implements UsecaseWithoutParams<List<CourseEntity>> {
  final ICourseRepository _courseRepository;

  GetAllCourseUsecase({required ICourseRepository courseRepository})
      : _courseRepository = courseRepository;

  @override
  Future<Either<Failure, List<CourseEntity>>> call() {
    return _courseRepository.getCourses();
  }
}
