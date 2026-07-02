import 'package:dork_app/core/constants/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/ticket_controller.dart';

class BottomNavTicket extends GetView<TicketController> {
  const BottomNavTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: ColorManager.white,
        border: Border(top: BorderSide(color: ColorManager.grey.withOpacity(0.2))),
        boxShadow: [
          BoxShadow(
            color: ColorManager.shadow,
            blurRadius: 4,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home, 'الرئيسية', 0, controller.goToHome),
          _buildNavItem(Icons.event, 'المواعيد', 1, controller.goToAppointments),
          _buildNavItem(Icons.folder, 'الملف', 2, controller.goToProfile),
          _buildNavItem(Icons.search, 'البحث', 3, () {}),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index, VoidCallback onTap) {
    final isSelected = index == 0;
    
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? ColorManager.primary : ColorManager.grey,
            size: 28,
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? ColorManager.primary : ColorManager.grey,
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}