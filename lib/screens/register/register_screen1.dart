import 'package:flutter/material.dart';
import 'career_data.dart'; // Asegúrate de tener este archivo

class RegisterScreen1 extends StatefulWidget {
  const RegisterScreen1({super.key});

  @override
  State<RegisterScreen1> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen1> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _termsAccepted = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFBF0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const SizedBox(height: 40),

                const Text(
                  'Crear cuenta',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A2B22),
                    height: 1.1,
                  ),
                ),

                const SizedBox(height: 16),
                const Text(
                  'Registrate para comenzar',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF1A2B22),
                  ),
                ),

                const SizedBox(height: 40),

                // Nombre
                _buildInputField(
                  controller: _nameController,
                  hintText: 'Nombre completo',
                  icon: Icons.person_outline,
                ),

                const SizedBox(height: 16),

                // Email
                _buildInputField(
                  controller: _emailController,
                  hintText: 'Email institucional',
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 16),

                // Contraseña
                _buildInputField(
                  controller: _passwordController,
                  hintText: 'Contraseña',
                  icon: Icons.lock_outline,
                  obscureText: _obscurePassword,
                  toggleVisibility: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),

                const SizedBox(height: 16),

                // Confirmar contraseña
                _buildInputField(
                  controller: _confirmPasswordController,
                  hintText: 'Confirmar contraseña',
                  icon: Icons.lock_outline,
                  obscureText: _obscureConfirmPassword,
                  toggleVisibility: () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    });
                  },
                ),

                const SizedBox(height: 20),

                // Aceptar términos
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _termsAccepted = !_termsAccepted;
                    });
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Checkbox(
                          value: _termsAccepted,
                          onChanged: (value) {
                            setState(() {
                              _termsAccepted = value ?? false;
                            });
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          side: BorderSide(
                            color: Colors.black.withOpacity(0.5),
                            width: 1.5,
                          ),
                          activeColor: const Color(0xFF2E6144),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Al crear una cuenta, aceptas nuestros Términos y Política de Privacidad',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                // Botón Crear cuenta
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _termsAccepted
                        ? () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CareerDataScreen()),
                      );
                    }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2E6144),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      disabledBackgroundColor:
                      const Color(0xFF2E6144).withOpacity(0.5),
                    ),
                    child: const Text(
                      'Crear cuenta',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed('/login');
                    },
                    child: const Text(
                      '¿Ya tienes una cuenta? Iniciar sesión',
                      style: TextStyle(
                        color: Color(0xFF1A2B22),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    TextInputType? keyboardType,
    bool obscureText = false,
    VoidCallback? toggleVisibility,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFEFF1EC),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
          prefixIcon: Icon(icon, color: Colors.black.withOpacity(0.7)),
          suffixIcon: toggleVisibility != null
              ? IconButton(
            icon: Icon(
              obscureText
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: Colors.black.withOpacity(0.7),
            ),
            onPressed: toggleVisibility,
          )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }
}
