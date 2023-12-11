import 'package:e_commerce_app/data/models/category/category_model.dart';
import 'package:e_commerce_app/data/repositories/prodcut_repo.dart';
import 'package:e_commerce_app/logic/cubits/category_product_cubit/category_product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryProductCubit extends Cubit<CategoryProductState> {
  final CategoryModel categoryModel;
  CategoryProductCubit(this.categoryModel)
      : super(CategoryProductInitialState()) {
    _intialize();
  }
  final _productRepository = ProductRepository();
  void _intialize() async {
    emit(CategoryProductLoadingState(state.products));
    try {
      final products =
          await _productRepository.fetchProductsByCategory(categoryModel.id!);
      emit(CategoryProductLoadedState(products));
    } catch (e) {
      emit(
        CategoryProductErrorState(
          state.products,
          e.toString(),
        ),
      );
    }
  }
}
