import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, disabled }

enum IconPosition { left, right }

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Custom Buttons')),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              CustomButton(
                title: 'Submit',
                type: ButtonType.primary,
                icon: Icons.check,
                iconPosition: IconPosition.left,
              ),
              SizedBox(height: 15),
              CustomButton(
                title: 'Time',
                type: ButtonType.secondary,
                icon: Icons.access_time,
                iconPosition: IconPosition.right,
              ),
              SizedBox(height: 15),
              CustomButton(
                title: 'Account',
                type: ButtonType.disabled,
                icon: Icons.person,
                iconPosition: IconPosition.right,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class CustomButton extends StatelessWidget {
  final String title;
  final ButtonType type;
  final IconData icon;
  final IconPosition iconPosition;

  const CustomButton({
    super.key,
    required this.title,
    required this.type,
    required this.icon,
    required this.iconPosition,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor = Colors.blueGrey;

    switch (type) {
      case ButtonType.primary:
        backgroundColor = Colors.blue;
        break;
      case ButtonType.secondary:
        backgroundColor = Colors.green;
        break;
      case ButtonType.disabled:
        backgroundColor = Colors.grey;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: iconPosition == IconPosition.left
            ? [
                Icon(icon, color: textColor, size: 20),
                const SizedBox(width: 8),
                Text(title, style: TextStyle(color: textColor, fontSize: 16)),
              ]
            : [
                Text(title, style: TextStyle(color: textColor, fontSize: 16)),
                const SizedBox(width: 8),
                Icon(icon, color: textColor, size: 20),
              ],
      ),
    );
  }
}
