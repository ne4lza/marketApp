part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent extends Equatable {}

class LoadAllCategories extends CategoryEvent{
  @override
  List<Object?> get props => [];

}
