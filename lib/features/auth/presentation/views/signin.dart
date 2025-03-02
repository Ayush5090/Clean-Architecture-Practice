import 'package:blog_app/core/resources/pallet.dart';
import 'package:blog_app/features/auth/presentation/views/signup.dart';
import 'package:blog_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:blog_app/features/auth/presentation/widgets/auth_field.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.3,
                ),
                const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 30,
                ),
                AuthField(hintText: 'Email', controller: _emailController),
                const SizedBox(
                  height: 20,
                ),
                AuthField(
                  hintText: 'Password',
                  controller: _passwordController,
                  isObscureText: true,
                ),
                const SizedBox(
                  height: 40,
                ),
                AuthGradientButton(
                    buttonText: 'Sign In',
                    onPressed: () {
                      _formKey.currentState!.validate();
                    }),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () => Navigator.push(context, SignUpScreen.route()),
                  child: RichText(
                      text: TextSpan(
                          text: 'Don\'t have an account? ',
                          style: Theme.of(context).textTheme.titleMedium,
                          children: [
                        TextSpan(
                          text: 'Sign Up',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  color: AppPallet.gradient2,
                                  fontWeight: FontWeight.w700),
                        )
                      ])),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
