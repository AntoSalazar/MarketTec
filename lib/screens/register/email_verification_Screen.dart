import 'package:flutter/material.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController codeController = TextEditingController();

  void verifyCode(String inputCode) {
    if (inputCode.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('✅ Correo verificado exitosamente.')),
      );
      // Aquí podrías redirigir al login o home
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('❌ Ingresa un código.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFBF0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFBF0),
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF1A2B22)),
        title: const Text(
          'Verificación de Correo',
          style: TextStyle(
            color: Color(0xFF1A2B22),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ingresa el código de verificación',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A2B22),
                ),
              ),
              const SizedBox(height: 32),

              // Campo de código
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF1EC),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: codeController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Código de 6 dígitos',
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: Colors.black.withOpacity(0.7),
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Botón verificar
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    verifyCode(codeController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2E6144),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Verificar Código',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
