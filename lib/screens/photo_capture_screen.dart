import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:self_capture/l10n/app_localizations.dart';

class PhotoCaptureScreen extends StatefulWidget {
  const PhotoCaptureScreen({super.key});

  @override
  State<PhotoCaptureScreen> createState() => _PhotoCaptureScreenState();
}

class _PhotoCaptureScreenState extends State<PhotoCaptureScreen> {
  int _selectedAngleIndex = 0; // 0: Front, 1: Top, 2: Left, 3: Right

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.shadow,
      body: Stack(
        children: [
          // Camera Background with Gradient Overlay
          Positioned.fill(
            child: Stack(
              children: [
                Image.network(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuBFV_eUTWGAM3gWz3qXxth1Jm6xaJeHpwa6t8CFDpDt96TIxO7Sm3-oJd_Ex4gCtbLca5vFcvmjv_ScJWRDkRHtQsC6MM5_n4OYmeK-blQXQ7hg_thcApKNXUdsK-7fFFV-UWPEpmvRLbloDBdqKkUhVTjVVVsM46xBy73lfUhZ9Wg6GVhzd6jsKCKHIVn0m9kqUgJzemib1Q8yjM-p_yLSOzEZyhfK5XPRInrQhTCVr0n14Qy-kiE8DZ1-K3CsoV0m7dXYr0PdNQ',
                  fit: BoxFit.cover,
                  opacity: const AlwaysStoppedAnimation(0.9),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.4),
                        Colors.transparent,
                        Colors.black.withOpacity(0.6),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // UI Overlay
          Column(
            children: [
              // Enhanced Top App Bar
              SafeArea(
                child: Container(
                  margin: const EdgeInsets.all(12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.shadow.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surface.withOpacity(0.2),
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                icon: Icon(Icons.arrow_back, color: Theme.of(context).colorScheme.surface),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                l10n.photoCaptureFrontView,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.surface,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surface.withOpacity(0.2),
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                icon: Icon(Icons.help_outline, color: Theme.of(context).colorScheme.surface),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Main Content Area with Enhanced Guide
              Expanded(
                child: Center(
                  child: Container(
                    width: 320,
                    height: 420,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
                        width: 4,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).colorScheme.surface.withOpacity(0.3),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(26),
                      child: CustomPaint(
                        painter: _EnhancedGuidePainter(),
                      ),
                    ),
                  ),
                ),
              ),
              // Enhanced Bottom Controls
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.8),
                    ],
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).colorScheme.shadow.withOpacity(0.1),
                            blurRadius: 20,
                            offset: const Offset(0, -5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            decoration: BoxDecoration(
                              color: const Color(0xFF1C2A39).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              l10n.photoCapturePositionHead,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1C2A39),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Enhanced Segmented Buttons
                          Container(
                            height: 52,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF0F2F5),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context).colorScheme.shadow.withOpacity(0.05),
                                  blurRadius: 10,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                _buildAngleButton(l10n.photoCaptureFront, l10n),
                                _buildAngleButton(l10n.photoCaptureTop, l10n),
                                _buildAngleButton(l10n.photoCaptureLeft, l10n),
                                _buildAngleButton(l10n.photoCaptureRight, l10n),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          // Enhanced Camera Controls
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildControlButton(
                                icon: Icons.flash_on,
                                onPressed: () {},
                              ),
                              Container(
                                width: 88,
                                height: 88,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color(0xFF1C2A39),
                                      Color(0xFF2C3E50),
                                    ],
                                  ),
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFF1C2A39).withOpacity(0.5),
                                      blurRadius: 25,
                                      spreadRadius: 5,
                                      offset: const Offset(0, 8),
                                    ),
                                  ],
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/capture-flow');
                                    },
                                    borderRadius: BorderRadius.circular(44),
                                    child: Icon(
                                      Icons.photo_camera,
                                      size: 44,
                                      color: Theme.of(context).colorScheme.surface,
                                    ),
                                  ),
                                ),
                              ),
                              _buildControlButton(
                                icon: Icons.flip_camera_android,
                                onPressed: () {},
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAngleButton(String angleLabel, AppLocalizations l10n) {
    final angleLabels = [
      l10n.photoCaptureFront,
      l10n.photoCaptureTop,
      l10n.photoCaptureLeft,
      l10n.photoCaptureRight,
    ];
    final buttonIndex = angleLabels.indexOf(angleLabel);
    final isSelected = _selectedAngleIndex == buttonIndex;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedAngleIndex = buttonIndex;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            gradient: isSelected
                ? const LinearGradient(
                    colors: [Color(0xFF1C2A39), Color(0xFF2C3E50)],
                  )
                : null,
            color: isSelected ? null : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: const Color(0xFF1C2A39).withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Center(
            child: Text(
              angleLabel,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : const Color(0xFF6C757D),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildControlButton({required IconData icon, required VoidCallback onPressed}) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(28),
          child: Icon(
            icon,
            size: 28,
            color: const Color(0xFF1C2A39),
          ),
        ),
      ),
    );
  }
}

class _EnhancedGuidePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Outer glow effect
    final glowPaint = Paint()
      ..color = Colors.white.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);

    // Main outline
    final mainPaint = Paint()
      ..color = Colors.white.withOpacity(0.8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    // Draw head outline with glow
    final path = Path();
    path.moveTo(size.width * 0.5, size.height * 0.2);
    path.quadraticBezierTo(
      size.width * 0.2,
      size.height * 0.25,
      size.width * 0.2,
      size.height * 0.4,
    );
    path.lineTo(size.width * 0.2, size.height * 0.6);
    path.quadraticBezierTo(
      size.width * 0.2,
      size.height * 0.85,
      size.width * 0.5,
      size.height * 0.85,
    );
    path.quadraticBezierTo(
      size.width * 0.8,
      size.height * 0.85,
      size.width * 0.8,
      size.height * 0.6,
    );
    path.lineTo(size.width * 0.8, size.height * 0.4);
    path.quadraticBezierTo(
      size.width * 0.8,
      size.height * 0.25,
      size.width * 0.5,
      size.height * 0.2,
    );
    path.close();

    canvas.drawPath(path, glowPaint);
    canvas.drawPath(path, mainPaint);

    // Draw circle for top view with glow
    final circleCenter = Offset(size.width * 0.5, size.height * 0.2);
    final circleRadius = size.width * 0.2;
    canvas.drawCircle(circleCenter, circleRadius, glowPaint);
    canvas.drawCircle(circleCenter, circleRadius, mainPaint);

    // Draw horizontal guide lines with glow
    final lineGlowPaint = Paint()
      ..color = Colors.white.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5);

    final linePaint = Paint()
      ..color = Colors.white.withOpacity(0.6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final y1 = size.height * 0.45;
    final y2 = size.height * 0.6;
    canvas.drawLine(
      Offset(size.width * 0.15, y1),
      Offset(size.width * 0.85, y1),
      lineGlowPaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.15, y1),
      Offset(size.width * 0.85, y1),
      linePaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.15, y2),
      Offset(size.width * 0.85, y2),
      lineGlowPaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.15, y2),
      Offset(size.width * 0.85, y2),
      linePaint,
    );

    // Draw corner indicators
    final cornerPaint = Paint()
      ..color = Colors.white.withOpacity(0.9)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    final cornerLength = 20.0;
    // Top corners
    canvas.drawLine(
      Offset(size.width * 0.2, size.height * 0.25),
      Offset(size.width * 0.2 + cornerLength, size.height * 0.25),
      cornerPaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.2, size.height * 0.25),
      Offset(size.width * 0.2, size.height * 0.25 + cornerLength),
      cornerPaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.8, size.height * 0.25),
      Offset(size.width * 0.8 - cornerLength, size.height * 0.25),
      cornerPaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.8, size.height * 0.25),
      Offset(size.width * 0.8, size.height * 0.25 + cornerLength),
      cornerPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

}
