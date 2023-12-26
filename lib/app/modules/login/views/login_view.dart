import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pasar_petani/app/routes/app_pages.dart';
import 'package:pasar_petani/app/shared/theme/color.dart';
import 'package:pasar_petani/app/shared/theme/font.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Form(
                key: controller.formKey,
                child: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 72),
                        Center(
                          child: Image.asset(
                            'assets/img/logo.png',
                            width: 127,
                            height: 118,
                          ),
                        ),
                        Text(
                          'Email',
                          style: h5Regular.copyWith(
                            color: bottomNavigationBarColor,
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: controller.emailController,
                          validator: controller.emailValidate,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Password',
                          style: h5Regular.copyWith(
                            color: bottomNavigationBarColor,
                          ),
                        ),
                        TextFormField(
                          controller: controller.passwordController,
                          decoration: InputDecoration(
                            suffixIconConstraints: const BoxConstraints(
                              minWidth: 24,
                              minHeight: 24,
                            ),
                            suffix: GestureDetector(
                              onTap: controller.showPassword,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: Image.asset(
                                  controller.isShowPassword
                                      ? "assets/img/eye-slash.png"
                                      : "assets/img/eye.png",
                                  color: placeHolderIcon,
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                            ),
                          ),
                          obscureText: controller.isShowPassword,
                          validator: controller.passwordValidate,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const SizedBox(
                                height: 28,
                              ),
                              Text(
                                'Lupa password?',
                                style: body2Regular.copyWith(
                                  color: primaryColor,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 38,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 44,
                          child: ElevatedButton(
                            onPressed: controller.login,
                            child: Text(
                              'Masuk',
                              style: bodyBold.copyWith(
                                color: whiteColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 48,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.REGISTER);
                          },
                          child: Center(
                            child: Text.rich(
                              TextSpan(
                                style: body2Regular,
                                children: [
                                  const TextSpan(
                                    text: 'Belum memiliki akun? ',
                                  ),
                                  TextSpan(
                                    text: 'Daftar',
                                    style: body2Bold.copyWith(
                                      color: primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'assets/img/bottom.png',
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
