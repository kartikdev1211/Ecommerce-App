// import 'package:e_commerce_app/data/models/product/product_model.dart';
import 'package:e_commerce_app/data/models/category/category_model.dart';
import 'package:e_commerce_app/data/models/product/product_model.dart';
import 'package:e_commerce_app/logic/cubits/category_product_cubit/category_product_cubit.dart';
import 'package:e_commerce_app/presentations/screens/auth/login_screen.dart';
import 'package:e_commerce_app/presentations/screens/auth/providers/login_provider.dart';
import 'package:e_commerce_app/presentations/screens/auth/providers/signup_provider.dart';
import 'package:e_commerce_app/presentations/screens/auth/sign_up_screen.dart';
import 'package:e_commerce_app/presentations/screens/cart/cart_screen.dart';
// import 'package:e_commerce_app/presentations/screens/cart/cart_screen.dart';
import 'package:e_commerce_app/presentations/screens/home/home_screen.dart';
import 'package:e_commerce_app/presentations/screens/products/category_products_screen.dart';
import 'package:e_commerce_app/presentations/screens/products/product_detail_screen.dart';
// import 'package:e_commerce_app/presentations/screens/products/product_detail_screen.dart';
import 'package:e_commerce_app/presentations/screens/splash/spalsh_screen.dart';
import 'package:e_commerce_app/presentations/screens/user/edit_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginScreen.routeName:
        return CupertinoPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => LoginProvider(context),
            child: const LoginScreen(),
          ),
        );
      case SignUpScreen.routeName:
        return CupertinoPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => SignupProvider(context),
            child: const SignUpScreen(),
          ),
        );
      case HomeScreen.routeName:
        return CupertinoPageRoute(builder: (context) => const HomeScreen());
      case SplashScreen.routeName:
        return CupertinoPageRoute(builder: (context) => const SplashScreen());
      case ProductDetailScreen.routeName:
        return CupertinoPageRoute(
          builder: (context) => ProductDetailScreen(
            productModel: settings.arguments as ProductModel,
          ),
        );
      case CartScreen.routeName:
        return CupertinoPageRoute(builder: (context) => const CartScreen());
      case CategoryProductScreen.routeName:
        return CupertinoPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                CategoryProductCubit(settings.arguments as CategoryModel),
            child: const CategoryProductScreen(),
          ),
        );
      case EditProfileScreen.routeName:
        return CupertinoPageRoute(
            builder: (context) => const EditProfileScreen());
      default:
        return null;
    }
  }
}
