import 'dart:math' as math;

import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({
    super.key,
    this.size = 60,
    this.color = const Color(0xFFC65A5A),
    this.words = const ['Ko', 'Nyo', 'Ha'],
    this.message = 'PLEASE WAIT',
  });

  /// Diameter area loading. Ring, font, dan jarak mengikuti nilai ini.
  final double size;
  final Color color;
  final List<String> words;
  final String message;

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget>
    with SingleTickerProviderStateMixin {
  late final _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 3200),
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (MediaQuery.disableAnimationsOf(context)) {
      _c
        ..stop()
        ..value = 0.5;
    } else if (!_c.isAnimating) {
      _c.repeat();
    }
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  Widget _word(String text, int i, double t) {
    final s = 0.05 + i * 0.1;
    final inn = Interval(s, s + 0.2, curve: Curves.easeOut).transform(t);
    final out = const Interval(0.88, 0.98, curve: Curves.easeIn).transform(t);

    return Opacity(
      opacity: inn * (1 - out),
      child: Transform.translate(
        offset: Offset(0, (1 - inn) * 3),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'serif',
            fontFamilyFallback: const ['Georgia', 'Noto Serif'],
            fontSize: widget.size * 0.18,
            letterSpacing: 0.6,
            height: 1,
            color: widget.color,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final s = widget.size;

    return Semantics(
      label: widget.message,
      liveRegion: true,
      child: Center(
        child: RepaintBoundary(
          child: AnimatedBuilder(
            animation: _c,
            builder: (context, _) {
              final t = _c.value;
              final pulse = 0.55 + 0.25 * math.sin(t * 2 * math.pi);

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox.square(
                    dimension: s,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Ring luar: searah jarum jam
                        CustomPaint(
                          size: Size.square(s * 0.94),
                          painter: _RingPainter(
                            widget.color,
                            t * 4 * math.pi,
                            math.pi * 1.1,
                            1.5,
                            0.15,
                          ),
                        ),
                        // Ring dalam: berlawanan arah, lebih tipis dan pendek
                        CustomPaint(
                          size: Size.square(s * 0.70),
                          painter: _RingPainter(
                            widget.color,
                            -t * 6 * math.pi,
                            math.pi * 0.8,
                            1.1,
                            0.08,
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            for (final (i, w) in widget.words.indexed)
                              _word(w, i, t),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: s * 0.14),
                  Opacity(
                    opacity: pulse,
                    child: Text(
                      widget.message,
                      style: const TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2.5,
                        color: Color(0xFFB5A1A1),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  const _RingPainter(
    this.color,
    this.rot,
    this.sweep,
    this.width,
    this.trackAlpha,
  );

  final Color color;
  final double rot, sweep, width, trackAlpha;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = (Offset.zero & size).deflate(1);
    final p = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = width;

    canvas.drawCircle(
      rect.center,
      rect.width / 2,
      p..color = color.withValues(alpha: trackAlpha),
    );

    canvas.drawArc(
      rect,
      rot,
      sweep,
      false,
      p
        ..shader = SweepGradient(
          endAngle: sweep,
          colors: [color.withValues(alpha: 0), color],
          transform: GradientRotation(rot),
        ).createShader(rect),
    );
  }

  @override
  bool shouldRepaint(_RingPainter o) => o.rot != rot || o.color != color;
}
