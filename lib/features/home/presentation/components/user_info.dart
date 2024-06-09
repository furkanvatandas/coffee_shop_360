import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildLocationInfo(),
          const CircleAvatar(
            child: Icon(Icons.person),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationInfo() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Location',
          style: TextStyle(color: Colors.white),
        ),
        Row(
          children: [
            Text(
              'Bilzen,Tanjung Balai',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Icon(Icons.keyboard_arrow_down, color: Colors.white)
          ],
        ),
      ],
    );
  }
}
