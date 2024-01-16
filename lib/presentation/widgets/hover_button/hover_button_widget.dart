import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HoverButton extends StatefulWidget {
  const HoverButton({
    super.key,
    required this.icon,
    required this.borderColor,
    required this.onPressed,
    required this.width,
    required this.height,
    required this.backgroundColor,
  });

  final SvgPicture icon;
  final Color borderColor;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color backgroundColor;

  @override
  // ignore: library_private_types_in_public_api
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool _isHovering = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => _isHovering = true),
      onExit: (event) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTapDown: (details) => setState(() => _isPressed = true),
        onTapUp: (details) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            shape: BoxShape.circle, // Button shape
            border: Border.all(
              color: widget.borderColor,
              width: 1.0, // Border width
            ),
            boxShadow: _isHovering || _isPressed
                ? [
                    // Optional, adds shadow on hover/press
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: InkWell(
            onTap: () => widget.onPressed(),
            borderRadius:
                BorderRadius.circular(24.0), // Same as the container's radius
            child: Padding(
              padding: const EdgeInsets.all(
                  4.0), // Padding to shrink the icon's size
              child: widget.icon,
            ),
          ),
        ),
      ),
    );
  }
}
