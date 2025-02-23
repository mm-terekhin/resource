import 'package:equatable/equatable.dart';

abstract interface class UseCase<Type, Params> {
  Object? call(Params params);
}

abstract class Params extends Equatable {}

class NoParams extends Params {
  @override
  List<Object?> get props => [];
}
