import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _loading = false;

  Future<void> login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _loading = true);

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "Login Failed")),
      );
    }

    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Login",
                  style: TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold)),

              const SizedBox(height: 30),

              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Enter email" : null,
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.length < 6 ? "Min 6 characters" : null,
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _loading ? null : login,
                  child: _loading
                      ? const CircularProgressIndicator(
                          color: Colors.white)
                      : const Text("Login"),
                ),
              ),

              const SizedBox(height: 20),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const RegisterScreen()),
                  );
                },
                child: const Text("Don't have an account? Register"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
