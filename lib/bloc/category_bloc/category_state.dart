part of 'category_bloc.dart';

@immutable
abstract class CategoryState extends Equatable {}

final class CategoryInitial extends CategoryState {
  @override
  List<Object?> get props => [];
}

final class LoadingCategories extends CategoryState{
  @override
  List<Object?> get props => [];
}

final class LoadedCategories extends CategoryState{
  final List<String> categories;

  LoadedCategories({required this.categories});

  @override
  List<Object?> get props => [categories];

}

final class FailedToLoadCategories extends CategoryState{
  final String error;

  FailedToLoadCategories({required this.error});
  
  @override
  List<Object?> get props => [error];
}


