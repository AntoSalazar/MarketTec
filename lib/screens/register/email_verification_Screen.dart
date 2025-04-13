import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'career_data.dart';
class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  // Controller for the pin code
  final TextEditingController pinController = TextEditingController();

  // Optional error text to display under the fields
  String? errorText;

  void verifyCode() {
    if (pinController.text.length == 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('✅ Correo verificado exitosamente.')),
      );

      // Navegar a la pantalla CareerData
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const CareerDataScreen()),
      );
    } else {
      setState(() {
        errorText = 'Ingresa el código completo de 6 dígitos';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('❌ Ingresa un código completo de 6 dígitos.')),
      );
    }
  }


  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
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
              const SizedBox(height: 16),
              const Text(
                'Te hemos enviado un código de 6 dígitos a tu correo institucional',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF1A2B22),
                ),
              ),
              const SizedBox(height: 32),

              // PIN Code Fields
              PinCodeTextField(
                appContext: context,
                length: 6,
                controller: pinController,
                keyboardType: TextInputType.number,
                autoFocus: true,
                backgroundColor: const Color(0xFFFFFBF0),
                // Box styling
                pinTheme: PinTheme(

                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(12),
                  fieldHeight: 60,
                  fieldWidth: 48,
                  activeFillColor: const Color(0xFFEFF1EC),
                  inactiveFillColor: const Color(0xFFEFF1EC),
                  selectedFillColor: const Color(0xFFEFF1EC),
                  activeColor: const Color(0xFF2E6144),
                  inactiveColor: const Color(0xFFEFF1EC),
                  selectedColor: const Color(0xFF2E6144),
                  borderWidth: 2,
                ),

                // Text styling
                textStyle: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A2B22),
                ),

                // Make boxes filled
                enableActiveFill: true,

                // Error display
                errorAnimationController: null,
                errorAnimationDuration: 0,

                // Callbacks
                onChanged: (value) {
                  // Clear error message when user types
                  if (errorText != null) {
                    setState(() {
                      errorText = null;
                    });
                  }
                },
                onCompleted: (value) {
                  // Auto-verify when code is complete
                  verifyCode();
                },
              ),

              // Error text (if any)
              if (errorText != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    errorText!,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                  ),
                ),

              const SizedBox(height: 40),

              // Botón verificar
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: verifyCode,
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

              const SizedBox(height: 24),

              // Reenviar código
              Center(
                child: TextButton(
                  onPressed: () {
                    // Código para reenviar
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Nuevo código enviado')),
                    );

                    // Clear current code
                    pinController.clear();
                    setState(() {
                      errorText = null;
                    });
                  },
                  child: const Text(
                    '¿No recibiste el código? Reenviar',
                    style: TextStyle(
                      color: Color(0xFF2E6144),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}