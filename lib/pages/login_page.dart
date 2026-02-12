import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isEmailVisible = false;

  // Logo Widget
  Widget _buildLogo() {
    return Image.asset(
      'assets/images/logo.png',
      width: 120,
      height: 120,
    );
  }

  // Header
  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text(
          'Welcome Back!',
          style: TextStyle(
            fontFamily: 'Merienda',
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4A2E14),
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Login to continue',
          style: TextStyle(
            fontFamily: 'Merienda',
            fontSize: 16,
            color:Color(0xFF4A2E14),
          ),
        ),
      ],
    );
  }

  // Email Input
Widget _buildEmailField() {
  return TextFormField(
    controller: _emailController,
    obscureText: !_isEmailVisible, // ini akan sembunyikan teks
    decoration: InputDecoration(
      icon: const Icon(Icons.email, color: Color(0xFF4A2E14)),
      labelText: 'Email',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      suffixIcon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          return RotationTransition(
            turns: animation,
            child: child,
          );
        },
        child: IconButton(
          key: ValueKey<bool>(_isPasswordVisible), // penting! biar AnimatedSwitcher tahu beda state
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Color(0xFF4A2E14),
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
      ),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Email tidak boleh kosong';
      }
      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
        return 'Format email tidak valid';
      }
      return null;
    },
  );
}


  // Password Input
  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
        icon: const Icon(Icons.lock, color: Color(0xFF4A2E14)),
        labelText: 'Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        suffixIcon: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) {
            return RotationTransition(
              turns: animation,
              child: child,
            );
          },
          child: IconButton(
            key: ValueKey<bool>(_isPasswordVisible), // penting! biar AnimatedSwitcher tahu beda state
            icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: Color(0xFF4A2E14),
            ),
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
          ),
        ),

      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password tidak boleh kosong';
        }
        if (value.length < 6) {
          return 'Password minimal 6 karakter';
        }
        return null;
      },
    );
  }


  // Tombol Login
  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Navigator.pushNamed(context, '/');
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF4A2E14),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: const Text(
        'Login',
        style: TextStyle(
          fontFamily: 'Merienda',
          fontSize: 18,
        ),
      ),
    );
  }

  // Link ke Register
  Widget _buildSignupLink() {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, '/register');
      },
      child: const Text(
        "Don't have an account? Sign Up",
        style: TextStyle(
          fontFamily: 'Merienda',
          color: Color(0xFF4A2E14),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9C96A),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                _buildLogo(),
                const SizedBox(height: 20),
                _buildHeader(),
                const SizedBox(height: 40),
                _buildEmailField(),
                const SizedBox(height: 20),
                _buildPasswordField(),
                const SizedBox(height: 30),
                _buildLoginButton(),
                const SizedBox(height: 20),
                _buildSignupLink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
