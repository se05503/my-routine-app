import 'dart:math';
import 'package:flutter/material.dart';

class TickTimerPainter extends CustomPainter {
  final double progress; // 0.0 ~ 1.0

  TickTimerPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    const tickCount = 60; // 눈금 개수

    final paint = Paint()
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < tickCount; i++) {
      // 현재 눈금 각도 계산
      // 컴퓨터 수학에서 0도는 3시 방향이다.
      // 하지만 타이머는 12시 방향에서 시작해야 하므로 90도만큼 뒤로 돌려주기
      final angle = ((2 * pi / tickCount) * i) - pi / 2;

      // 진행률을 눈금 개수 단위로 환산해서 색상 결정
      final isProcessed = i < (tickCount * progress);
      paint.color = isProcessed ? Colors.blue : Colors.grey.shade200;

      // 눈금의 시작점(안쪽)과 끝점(바깥쪽) 좌표 계산
      final innerRadius = radius * 0.8; // 안쪽 반지름
      final outerRadius = radius; // 바깥쪽 반지름

      // 원의 특정 좌표 계산을 위해 삼각함수(cos, sin) 활용
      final startOffset = Offset(
        center.dx + innerRadius * cos(angle),
        center.dy + innerRadius * sin(angle),
      );
      final endOffset = Offset(
        center.dx + outerRadius * cos(angle),
        center.dy + outerRadius * sin(angle),
      );

      canvas.drawLine(startOffset, endOffset, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true; // true로 지정하면 값이 바뀔 때마다 다시 그린다
}
