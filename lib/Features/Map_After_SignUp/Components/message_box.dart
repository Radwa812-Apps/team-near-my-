import 'package:flutter/material.dart';
import 'package:nearme_app/core/constants.dart';

class MessageBox extends StatelessWidget {
  final VoidCallback onClose;

  const MessageBox({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: const Text(
              'Tap on the map to add your place',
              style: TextStyle(
                fontSize: 16,
                color: kPrimaryColor1,
                fontFamily: 'OpenSans-Bold',
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: GestureDetector(
              onTap: onClose, 
              child: const Icon(
                Icons.close,
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}