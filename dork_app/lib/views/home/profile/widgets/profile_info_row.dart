import 'package:flutter/material.dart';
import '../../../../core/constants/color_manager.dart';

class ProfileInfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const ProfileInfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: ColorManager.primary.withOpacity(0.6), size: 20),
        const SizedBox(width: 12),
        Text(
          "$label:",
          style: const TextStyle(fontFamily: 'Cairo', fontSize: 14, color: Colors.black54),
        ),
        const Spacer(),
        Text(
          value,
          style: const TextStyle(fontFamily: 'Cairo', fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ],
    );
  }
}