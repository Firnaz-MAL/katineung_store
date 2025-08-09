import 'package:flutter/material.dart';

class ChangepasswordPage extends StatefulWidget {
  const ChangepasswordPage({super.key});

  @override
  State<ChangepasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangepasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController = TextEditingController();

  bool _isCurrentPasswordVisible = false;
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  Widget _buildLogo() {
    return Image.asset(
      'assets/images/logo.png',
      width: 120,
      height: 120,
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text(
          'Ubah Password',
          style: TextStyle(
            fontFamily: 'Merienda',
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4A2E14),
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Pastikan password baru aman dan mudah diingat',
          style: TextStyle(
            fontFamily: 'Merienda',
            fontSize: 16,
            color: Color(0xFF4A2E14),
          ),
        ),
      ],
    );
  }

  Widget _buildCurrentPasswordField() {
    return TextFormField(
      controller: _currentPasswordController,
      obscureText: !_isCurrentPasswordVisible,
      decoration: InputDecoration(
        icon: const Icon(Icons.lock_clock, color: Color(0xFF4A2E14)),
        labelText: 'Password Saat Ini',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _isCurrentPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Color(0xFF4A2E14),
          ),
          onPressed: () {
            setState(() {
              _isCurrentPasswordVisible = !_isCurrentPasswordVisible;
            });
          },
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password saat ini wajib diisi';
        }
        return null;
      },
    );
  }

  Widget _buildNewPasswordField() {
    return TextFormField(
      controller: _newPasswordController,
      obscureText: !_isNewPasswordVisible,
      decoration: InputDecoration(
        icon: const Icon(Icons.lock_open, color: Color(0xFF4A2E14)),
        labelText: 'Password Baru',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _isNewPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Color(0xFF4A2E14),
          ),
          onPressed: () {
            setState(() {
              _isNewPasswordVisible = !_isNewPasswordVisible;
            });
          },
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password baru wajib diisi';
        }
        if (value.length < 6) {
          return 'Password minimal 6 karakter';
        }
        return null;
      },
    );
  }

  Widget _buildConfirmNewPasswordField() {
    return TextFormField(
      controller: _confirmNewPasswordController,
      obscureText: !_isConfirmPasswordVisible,
      decoration: InputDecoration(
        icon: const Icon(Icons.lock_reset, color: Color(0xFF4A2E14)),
        labelText: 'Konfirmasi Password Baru',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Color(0xFF4A2E14),
          ),
          onPressed: () {
            setState(() {
              _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
            });
          },
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Konfirmasi password wajib diisi';
        }
        if (value != _newPasswordController.text) {
          return 'Password baru tidak cocok';
        }
        return null;
      },
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          // Ganti navigasi sesuai kebutuhan setelah ubah password
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
        'Simpan Password',
        style: TextStyle(
          fontFamily: 'Merienda',
          fontSize: 15,
        ),
      ),
    );
  }

  Widget _buildCancelLink() {
    return TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text(
        'Batalkan',
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
              children: [
                const SizedBox(height: 30),
                _buildLogo(),
                const SizedBox(height: 20),
                _buildHeader(),
                const SizedBox(height: 40),
                _buildCurrentPasswordField(),
                const SizedBox(height: 20),
                _buildNewPasswordField(),
                const SizedBox(height: 20),
                _buildConfirmNewPasswordField(),
                const SizedBox(height: 30),
                _buildSubmitButton(),
                const SizedBox(height: 20),
                _buildCancelLink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
