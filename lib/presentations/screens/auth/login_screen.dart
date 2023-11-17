import 'package:e_commerce_app/core/ui.dart';
import 'package:e_commerce_app/logic/cubits/user_cubit/user_cubit.dart';
import 'package:e_commerce_app/logic/cubits/user_cubit/user_state.dart';
import 'package:e_commerce_app/presentations/screens/auth/providers/login_provider.dart';
import 'package:e_commerce_app/presentations/screens/auth/sign_up_screen.dart';
import 'package:e_commerce_app/presentations/screens/splash/spalsh_screen.dart';
import 'package:e_commerce_app/presentations/widgets/gap_widget.dart';
import 'package:e_commerce_app/presentations/widgets/link_button.dart';
import 'package:e_commerce_app/presentations/widgets/primary_button.dart';
import 'package:e_commerce_app/presentations/widgets/primary_text_field.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
  static const String routeName = "login";
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserLoggedInState) {
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacementNamed(context, SplashScreen.routeName);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: const Text("Ecommerce App"),
        ),
        body: SafeArea(
          child: Form(
            key: provider.formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text(
                  "Login",
                  style: TextStyles.heading2,
                ),
                const GapWidget(),
                (provider.error != "")
                    ? Text(
                        provider.error,
                        style: const TextStyle(color: Colors.red),
                      )
                    : const SizedBox(),
                const GapWidget(),
                PrimaryTextField(
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Email is required";
                    }
                    if (!EmailValidator.validate(value.trim())) {
                      return "Invalid Email address";
                    }
                    return null;
                  },
                  lableText: "Email",
                  controller: provider.emailController,
                ),
                const GapWidget(),
                PrimaryTextField(
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Password is required";
                    }
                    return null;
                  },
                  obsecureText: true,
                  lableText: "Password",
                  controller: provider.passwordController,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    LinkButton(
                      text: "Forgot Password?",
                      onPressed: () {},
                    ),
                  ],
                ),
                const GapWidget(),
                PrimaryButton(
                  text: (provider.isLoading) ? "..." : "Login",
                  onPressed: provider.login,
                ),
                const GapWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an Account? ",
                      style: TextStyle(fontSize: 16),
                    ),
                    const GapWidget(),
                    LinkButton(
                      text: "Sign Up",
                      onPressed: () {
                        Navigator.pushNamed(context, SignUpScreen.routeName);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
