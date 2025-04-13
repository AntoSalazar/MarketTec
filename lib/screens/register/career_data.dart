import 'package:flutter/material.dart';
import 'email_verification_screen.dart'; // Asegúrate que la ruta sea correcta

class CareerDataScreen extends StatefulWidget {
  const CareerDataScreen({super.key});

  @override
  State<CareerDataScreen> createState() => _CareerDataScreenState();
}

class _CareerDataScreenState extends State<CareerDataScreen> {
  String? selectedCampus;
  String? selectedSemester;
  String? selectedCareer;

  final List<String> campuses = ['Tuxtla Gutiérrez'];
  final List<String> semesters = List.generate(9, (index) => (index + 1).toString());
  final List<String> careers = [
    'Sistemas Computacionales',
    'Mecánica',
    'Industrial',
    'Electrónica',
    'Eléctrica',
    'Bioquímica',
    'Química',
    'Gestión Empresarial',
    'Logística',
    'Mecatrónica',
  ];

  bool isNextButtonEnabled() {
    return selectedCampus != null &&
        selectedSemester != null &&
        selectedCareer != null;
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
          'Datos de Carrera',
          style: TextStyle(
            color: Color(0xFF1A2B22),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Selecciona tu información académica',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A2B22),
                ),
              ),
              const SizedBox(height: 32),

              _buildDropdown(
                label: 'Campus',
                value: selectedCampus,
                items: campuses,
                onChanged: (value) => setState(() => selectedCampus = value),
              ),

              const SizedBox(height: 16),

              _buildDropdown(
                label: 'Semestre',
                value: selectedSemester,
                items: semesters,
                onChanged: (value) => setState(() => selectedSemester = value),
              ),

              const SizedBox(height: 16),

              _buildDropdown(
                label: 'Carrera',
                value: selectedCareer,
                items: careers,
                onChanged: (value) => setState(() => selectedCareer = value),
              ),

              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: isNextButtonEnabled()
                      ? () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>  EmailVerificationScreen(),
                      ),
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
                    disabledBackgroundColor: const Color(0xFF2E6144).withOpacity(0.5),
                  ),
                  child: const Text(
                    'Siguiente',
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

  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFEFF1EC),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
          border: InputBorder.none,
        ),
        dropdownColor: const Color(0xFFEFF1EC),
        iconEnabledColor: const Color(0xFF1A2B22),
        style: const TextStyle(
          color: Color(0xFF1A2B22),
          fontSize: 16,
        ),
        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
