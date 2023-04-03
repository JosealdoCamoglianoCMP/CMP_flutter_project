import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  const OptionButton({
    super.key,
    required this.color,
    required this.icon,
    required this.text,
    required this.function,
  });
  final Color color;
  final IconData icon;
  final String text;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      heroTag: UniqueKey(),
      elevation: 0,
      backgroundColor: color,
      extendedPadding: const EdgeInsets.symmetric(horizontal: 16),
      onPressed: function,
      label: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 4),
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
