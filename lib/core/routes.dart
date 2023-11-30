// import 'package:e_commerce_app/data/models/product/product_model.dart';
import 'package:e_commerce_app/data/models/product/product_model.dart';
import 'package:e_commerce_app/presentations/screens/auth/login_screen.dart';
import 'package:e_commerce_app/presentations/screens/auth/providers/login_provider.dart';
import 'package:e_commerce_app/presentations/screens/auth/providers/signup_provider.dart';
import 'package:e_commerce_app/presentations/screens/auth/sign_up_screen.dart';
import 'package:e_commerce_app/presentations/screens/cart/cart_screen.dart';
// import 'package:e_commerce_app/presentations/screens/cart/cart_screen.dart';
import 'package:e_commerce_app/presentations/screens/home/home_screen.dart';
import 'package:e_commerce_app/presentations/screens/products/product_detail_screen.dart';
// import 'package:e_commerce_app/presentations/screens/products/product_detail_screen.dart';
import 'package:e_commerce_app/presentations/screens/splash/spalsh_screen.dart';
import 'package:flutter/cupertino.dart';
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
      default:
        return null;
    }
  }
}
