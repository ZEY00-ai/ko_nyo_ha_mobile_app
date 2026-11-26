import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading,
    this.color = const Color(0xFFDC2626),
  });

  final String text;
  final FutureOr<void> Function()? onPressed;

  /// null = otomatis mengikuti Future dari [onPressed].
  final bool? isLoading;
  final Color color;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _busy = false;
  bool _pressed = false;

  bool get _loading => widget.isLoading ?? _busy;

  Future<void> _handlePressed() async {
    if (_loading) return;
    HapticFeedback.lightImpact();
    setState(() => _busy = true);

    try {
      await widget.onPressed?.call();
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  void _setPressed(bool v) {
    if (_pressed != v) setState(() => _pressed = v);
  }

  @override
  Widget build(BuildContext context) {
    final enabled = widget.onPressed != null && !_loading;

    return Listener(
      onPointerDown: (_) => _setPressed(true),
      onPointerUp: (_) => _setPressed(false),
      onPointerCancel: (_) => _setPressed(false),
      child: AnimatedScale(
        scale: _pressed && enabled ? 0.97 : 1,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOut,
        child: SizedBox(
          width: double.infinity,
          height: 54,
          child: ElevatedButton(
            onPressed: enabled ? _handlePressed : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.color,
              foregroundColor: Colors.white,
              disabledBackgroundColor: widget.color.withValues(
                alpha: _loading ? 0.9 : 0.4,
              ),
              disabledForegroundColor: Colors.white,
              elevation: enabled ? 4 : 0,
              shadowColor: widget.color.withValues(alpha: 0.3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              transitionBuilder: (child, anim) => FadeTransition(
                opacity: anim,
                child: ScaleTransition(scale: anim, child: child),
              ),
              child: _loading
                  ? const SizedBox.square(
                      key: ValueKey('loading'),
                      dimension: 23,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2.5,
                      ),
                    )
                  : Text(
                      widget.text,
                      key: const ValueKey('text'),
                      style: const TextStyle(
                        fontSize: 15,
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
