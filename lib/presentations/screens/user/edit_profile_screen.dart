// ignore_for_file: use_build_context_synchronously

import 'package:e_commerce_app/core/ui.dart';
import 'package:e_commerce_app/data/models/user/user_model.dart';
import 'package:e_commerce_app/logic/cubits/user_cubit/user_cubit.dart';
import 'package:e_commerce_app/logic/cubits/user_cubit/user_state.dart';
import 'package:e_commerce_app/presentations/widgets/gap_widget.dart';
import 'package:e_commerce_app/presentations/widgets/primary_button.dart';
import 'package:e_commerce_app/presentations/widgets/primary_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileScreen extends StatefulWidget {
  static const routeName = "edit_profile";
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),
      body: SafeArea(
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UserErrorState) {
              return Center(
                child: Text(state.message),
              );
            }
            if (state is UserLoggedInState) {
              return editProfile(state.userModel);
            }
            return const Center(
              child: Text("An error occurred!"),
            );
          },
        ),
      ),
    );
  }

  Widget editProfile(UserModel userModel) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          "Personal Details",
          style: TextStyles.body2.copyWith(fontWeight: FontWeight.bold),
        ),
        const GapWidget(),
        PrimaryTextField(
          lableText: "Full name",
          onChanged: (value) {
            userModel.fullName = value;
          },
          initialValue: userModel.fullName,
        ),
        const GapWidget(),
        PrimaryTextField(
          lableText: "Phone number",
          onChanged: (value) {
            userModel.phoneNumber = value;
          },
          initialValue: userModel.phoneNumber,
        ),
        const GapWidget(size: 20),
        Text(
          "Address",
          style: TextStyles.body2.copyWith(fontWeight: FontWeight.bold),
        ),
        const GapWidget(),
        PrimaryTextField(
          lableText: "Address",
          onChanged: (value) {
            userModel.address = value;
          },
          initialValue: userModel.address,
        ),
        const GapWidget(),
        PrimaryTextField(
          lableText: "City",
          onChanged: (value) {
            userModel.city = value;
          },
          initialValue: userModel.city,
        ),
        const GapWidget(),
        PrimaryTextField(
          lableText: "State",
          onChanged: (value) {
            userModel.state = value;
          },
          initialValue: userModel.state,
        ),
        const GapWidget(),
        PrimaryButton(
          text: "Save",
          onPressed: () async {
            bool success =
                await BlocProvider.of<UserCubit>(context).updateUser(userModel);
            if (success) {
              Navigator.pop(context);
            }
          },
        ),
      ],
    );
  }
}
