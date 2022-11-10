import 'package:flutter/material.dart';
import 'package:flutter_testing_learn/home_screen.dart';
import 'package:flutter_testing_learn/validator.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                key: const ValueKey('email_field'),
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) => Validator.validateEmail(value ?? ""),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                key: const ValueKey('password_field'),
                controller: passController,
                decoration: const InputDecoration(labelText: 'Password'),
                validator: (value) => Validator.validatePassword(value ?? ''),
              ),
              const SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () {
                  //todo 3 (login_flow_test)
                  if (formKey.currentState?.validate() == true) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  }
                },
                child: const Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
