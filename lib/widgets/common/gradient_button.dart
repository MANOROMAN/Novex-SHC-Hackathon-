import 'package:flutter/material.dart';

enum _GradientButtonStyle {
  primary,
  success,
}

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double? width;
  final _GradientButtonStyle _style;

  const GradientButton._({
    required String label,
    required _GradientButtonStyle style,
    this.onPressed,
    this.isLoading = false,
    this.width,
    super.key,
  })  : text = label,
        _style = style;

  factory GradientButton.primary({
    required String text,
    required VoidCallback? onPressed,
    bool isLoading = false,
    double? width,
    Key? key,
  }) {
    return GradientButton._(
      label: text,
      onPressed: onPressed,
      isLoading: isLoading,
      width: width,
      style: _GradientButtonStyle.primary,
      key: key,
    );
  }

  factory GradientButton.success({
    required String text,
    required VoidCallback? onPressed,
    double? width,
    Key? key,
  }) {
    return GradientButton._(
      label: text,
      onPressed: onPressed,
      width: width,
      style: _GradientButtonStyle.success,
      key: key,
    );
  }

  @override
  Widget build(BuildContext context) {
    final gradient = _style == _GradientButtonStyle.success
        ? const LinearGradient(
            colors: [Color(0xFF10B981), Color(0xFF059669)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
        : const LinearGradient(
            colors: [Color(0xFF4F46E5), Color(0xFF6366F1)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          );

    final child = Container(
      width: width ?? double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: gradient.colors.first.withOpacity(0.35),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Center(
        child: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
      ),
    );

    return Opacity(
      opacity: onPressed == null ? 0.6 : 1,
      child: IgnorePointer(
        ignoring: onPressed == null,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onPressed,
          child: child,
        ),
      ),
    );
  }
}

