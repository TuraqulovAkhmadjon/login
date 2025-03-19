import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/l10n/app_localizations.dart';
import 'package:recipe_app/core/widgets/recipe_elevated_button2.dart';

import '../../../../core/utils/colors.dart';
import '../../../../main.dart';
import '../manager/sign_up_view_model.dart';
import '../widgets/recipe_date_of_birth.dart';
import '../widgets/recipe_password_form_field.dart';
import '../widgets/recipe_text_form_field.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpViewModel>(
      create: (context) => SignUpViewModel(
        authRepo: context.read(),
      ),
      builder: (context, child) {
        final vm = context.read<SignUpViewModel>();
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(MyLocalizations.of(context)!.signUp),
            actions: [
              PopupMenuButton<String>(
                icon: const Icon(Icons.language_sharp),
                onSelected: (value) {
                  context
                      .read<LocalizationViewModel>()
                      .setLocale(Locale(value));
                },
                itemBuilder: (context) => [
                  PopupMenuItem(value: "en", child: Text("English")),
                  PopupMenuItem(value: "uz", child: Text("O‘zbekcha")),
                ],
              ),
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const SizedBox(height: 20),
              Form(
                key: vm.formKey,
                child: Column(
                  children: [
                    RecipeTextFormField(
                      title: MyLocalizations.of(context)!.first_name,
                      hintText: "Ali",
                      validator: (value) => null,
                      controller: vm.firstNameController,
                    ),
                    RecipeTextFormField(
                      title: MyLocalizations.of(context)!.last_name,
                      hintText: "Valiyev",
                      validator: (value) => null,
                      controller: vm.lastNameController,
                    ),
                    RecipeTextFormField(
                      title: MyLocalizations.of(context)!.username,
                      hintText: "username",
                      validator: (value) => null,
                      controller: vm.usernameController,
                    ),
                    RecipeTextFormField(
                      title: MyLocalizations.of(context)!.email,
                      hintText: "example@example.com",
                      validator: (value) => null,
                      controller: vm.emailController,
                    ),
                    RecipeTextFormField(
                      title: MyLocalizations.of(context)!.phone_number,
                      hintText: "+90000000000",
                      validator: (value) => null,
                      controller: vm.numberController,
                    ),
                    const RecipeDateOfBirthField(),
                    RecipePasswordFormField(
                      controller: vm.passwordController,
                      title: MyLocalizations.of(context)!.password,
                      validator: (value) => null,
                    ),
                    RecipePasswordFormField(
                      controller: vm.confirmPasswordController,
                      title: MyLocalizations.of(context)!.confirm_password,
                      validator: (value) {
                        if (vm.passwordController.text !=
                            vm.confirmPasswordController.text) {
                          return MyLocalizations.of(context)!
                              .passwords_do_not_match;
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              RecipeElevatedButton2(
                text: MyLocalizations.of(context)!.signUp,
                size: const Size(195, 45),
                foregroundColor: Colors.white,
                backgroundColor: AppColors.redPinkMain,
                callback: () async {
                  if (vm.formKey.currentState!.validate()) {
                    if (await vm.signUp() && context.mounted) {
                      await showDialog(
                        context: context,
                        builder: (context) => Center(
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            width: 250,
                            height: 286,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  maxLines: 2,
                                  MyLocalizations.of(context)!
                                      .sign_up_successful,
                                  style: const TextStyle(
                                    color: AppColors.beigeColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                Image.asset(
                                  "assets/myassets/profile.png",
                                  width: 82,
                                  height: 82,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  maxLines: 4,
                                  MyLocalizations.of(context)!
                                      .sign_up_success_message,
                                  style: TextStyle(
                                      color: AppColors.beigeColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.none),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
