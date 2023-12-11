import 'package:e_commerce_app/logic/cubits/category_cubit/category_state.dart';
import 'package:e_commerce_app/logic/cubits/category_product_cubit/category_product_cubit.dart';
import 'package:e_commerce_app/logic/cubits/category_product_cubit/category_product_state.dart';
import 'package:e_commerce_app/presentations/widgets/product_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryProductScreen extends StatefulWidget {
  const CategoryProductScreen({super.key});
  static const routeName = "category_product";

  @override
  State<CategoryProductScreen> createState() => _CategoryProductScreenState();
}

class _CategoryProductScreenState extends State<CategoryProductScreen> {
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CategoryProductCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("${cubit.categoryModel.title}"),
      ),
      body: SafeArea(
        child: BlocBuilder<CategoryProductCubit, CategoryProductState>(
          builder: (context, state) {
            if (state is CategoryProductLoadingState &&
                state.products.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CategoryProductErrorState && state.products.isEmpty) {
              return Center(
                child: Text(state.message),
              );
            }
            if (state is CategoryLoadedState && state.products.isEmpty) {
              return const Center(
                child: Text("No products found!"),
              );
            }
            return ProductListView(products: state.products);
          },
        ),
      ),
    );
  }
}
