import 'package:e_commerce_app/data/models/category/category_model.dart';
import 'package:e_commerce_app/data/repositories/category_repo.dart';
import 'package:e_commerce_app/logic/cubits/category_cubit/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitialState()) {
    _initialize();
  }
  final _categoryRepo = CategoryRepository();
  void _initialize() async {
    emit(CategoryLoadingState(state.categories));
    try {
      List<CategoryModel> categories = await _categoryRepo.fetchAllCategories();
      emit(CategoryLoadingState(categories));
    } catch (e) {
      emit(CategoryErrorState(state.categories, e.toString()));
    }
  }
}
