import 'package:blog_app/core/resources/pallet.dart';
import 'package:blog_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:blog_app/features/auth/presentation/widgets/auth_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const SignUpScreen(),
      );
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                  'Sign Up',
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 30,
                ),
                AuthField(hintText: 'Name', controller: _nameController),
                const SizedBox(
                  height: 20,
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
                    buttonText: 'Sign Up',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(AuthSignUp(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim()));
                      }
                    }),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: RichText(
                      text: TextSpan(
                          text: 'Already have an account? ',
                          style: Theme.of(context).textTheme.titleMedium,
                          children: [
                        TextSpan(
                          text: 'Sign In',
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
