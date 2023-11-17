import 'package:e_commerce_app/core/ui.dart';
import 'package:e_commerce_app/presentations/screens/auth/providers/signup_provider.dart';
import 'package:e_commerce_app/presentations/widgets/gap_widget.dart';
import 'package:e_commerce_app/presentations/widgets/link_button.dart';
import 'package:e_commerce_app/presentations/widgets/primary_button.dart';
import 'package:e_commerce_app/presentations/widgets/primary_text_field.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
  static const String routeName = "signup";
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignupProvider>(context);
    return Scaffold(
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
                "Create Account",
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
              const GapWidget(),
              PrimaryTextField(
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Confirm your password";
                  }
                  if (value.trim() != provider.passwordController.text.trim()) {
                    return "Password do not match";
                  }
                  return null;
                },
                obsecureText: true,
                lableText: "Confirm Password",
                controller: provider.confirmpasswordController,
              ),
              const GapWidget(),
              PrimaryButton(
                text: (provider.isLoading) ? "..." : "Create Account",
                onPressed: provider.createAccount,
              ),
              const GapWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an Account? ",
                    style: TextStyle(fontSize: 16),
                  ),
                  const GapWidget(),
                  LinkButton(
                    text: "Login",
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
