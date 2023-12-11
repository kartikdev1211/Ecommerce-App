// import 'package:e_commerce_app/presentations/screens/cart/cart_screen.dart';
import 'package:e_commerce_app/logic/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/logic/cubits/cart_cubit/cart_state.dart';
import 'package:e_commerce_app/logic/cubits/user_cubit/user_cubit.dart';
import 'package:e_commerce_app/logic/cubits/user_cubit/user_state.dart';
import 'package:e_commerce_app/presentations/screens/cart/cart_screen.dart';
import 'package:e_commerce_app/presentations/screens/home/category_screen.dart';
import 'package:e_commerce_app/presentations/screens/home/profile_screen.dart';
import 'package:e_commerce_app/presentations/screens/home/user_feed_screen.dart';
import 'package:e_commerce_app/presentations/screens/splash/spalsh_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> screens = const [
    UserFeedScreen(),
    CategoryScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserLoggedOutState) {
          Navigator.pushReplacementNamed(context, SplashScreen.routeName);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Ecommerce App"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, CartScreen.routeName);
              },
              icon:
                  BlocBuilder<CartCubit, CartState>(builder: (context, state) {
                return Badge(
                  label: Text("${state.items.length}"),
                  isLabelVisible: (state is CartLoadingState) ? false : true,
                  child: const Icon(CupertinoIcons.cart_fill),
                );
              }),
            ),
          ],
        ),
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Categories",
              icon: Icon(Icons.category),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.person),
            )
          ],
        ),
      ),
    );
  }
}
