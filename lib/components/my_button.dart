import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Color color;
  final Color textColor;
  final VoidCallback onPress;

  const MyButton({
    super.key,
    required this.title,
    required this.color,
    required this.textColor,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: GestureDetector(
          onTap: onPress,
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(2, 4),
                )
              ],
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 26,
                  color: textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
