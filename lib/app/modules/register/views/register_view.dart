import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubes_motion/app/common/widgets/custom_button.dart';
import 'package:tubes_motion/app/common/widgets/custom_text_field.dart';
import 'package:tubes_motion/app/routes/app_pages.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
        init: RegisterController(),
        builder: (_) {
          return Scaffold(
            body: Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Image.asset('assets/icon/icon.png')),
                    const SizedBox(height: 20),
                    Text(
                      'Register',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Start Your Journey With Motion Lab',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: const Color(0xFF707070),
                          ),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      hintText: 'Full Name',
                      icon: const Icon(Icons.person_2_outlined,
                          color: Colors.black),
                      textInputType: TextInputType.name,
                      controller: controller.nameController,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      hintText: 'Email',
                      icon:
                          const Icon(Icons.email_outlined, color: Colors.black),
                      textInputType: TextInputType.emailAddress,
                      controller: controller.emailController,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      hintText: 'Password',
                      icon: const Icon(Icons.lock_outline_rounded,
                          color: Colors.black),
                      isPassword: true,
                      controller: controller.passwordController,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      hintText: 'Confirm Password',
                      icon: const Icon(Icons.lock_outline_rounded,
                          color: Colors.black),
                      isPassword: true,
                      controller: controller.confirmPasswordController,
                    ),
                    const SizedBox(height: 40),
                    CustomButton(
                      text: 'Register',
                      onTap: () {
                        controller.register();
                      },
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account? ',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.offAndToNamed(Routes.LOGIN);
                          },
                          child: const Text(
                            ' Login',
                            style: TextStyle(
                              fontSize: 14,
                              color: const Color.fromARGB(255, 64, 70, 251),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
