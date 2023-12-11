import 'package:e_commerce_app/core/ui.dart';
import 'package:e_commerce_app/data/models/product/product_model.dart';
import 'package:e_commerce_app/logic/services/formatter.dart';
import 'package:e_commerce_app/presentations/screens/products/product_detail_screen.dart';
import 'package:e_commerce_app/presentations/widgets/gap_widget.dart';
import 'package:flutter/cupertino.dart';

class ProductListView extends StatelessWidget {
  final List<ProductModel> products;
  const ProductListView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return CupertinoButton(
          onPressed: () {
            Navigator.pushNamed(context, ProductDetailScreen.routeName,
                arguments: product);
          },
          padding: EdgeInsets.zero,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(
                product.images![0],
                width: MediaQuery.of(context).size.width / 3,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${product.title}",
                      style: TextStyles.body1
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${product.description}",
                      style: TextStyles.body2.copyWith(
                        color: AppColors.textLight,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const GapWidget(),
                    Text(
                      " ${Formatter.formatPrice(product.price!)}",
                      style: TextStyles.heading3,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
