import 'package:flutter/material.dart';
import 'package:flutter_painting_game/models/colored_line.dart';
import 'package:flutter_painting_game/providers/color_provider.dart';
import 'package:provider/provider.dart';

class PaintAreaWidget extends StatefulWidget {
  const PaintAreaWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PaintAreaWidgetState createState() => _PaintAreaWidgetState();
}

class _PaintAreaWidgetState extends State<PaintAreaWidget> {
  List<ColoredLine> lines = [];
  List<Offset> currentLine = [];

  @override
  Widget build(BuildContext context) {
    ColorProvider colorProvider = Provider.of<ColorProvider>(context);
    Color selectedColor = colorProvider.color;
    double brushSize = colorProvider.brushSize;

    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          RenderBox renderBox = context.findRenderObject() as RenderBox;
          Offset localPosition =
              renderBox.globalToLocal(details.globalPosition);
          currentLine.add(localPosition);
          colorProvider.updateBrushPosition(localPosition);
        });
      },
      onPanEnd: (details) {
        setState(() {
          lines.add(ColoredLine(currentLine, selectedColor, brushSize));
          currentLine = [];
        });
        colorProvider.hideBrush();
      },
      child: CustomPaint(
        painter: ColoringPainter(lines, currentLine, selectedColor, brushSize),
        child: Container(),
      ),
    );
  }

  void undo() {
    setState(() {
      if (lines.isNotEmpty) {
        lines.removeLast();
      }
    });
  }
}

class ColoringPainter extends CustomPainter {
  final List<ColoredLine> lines;
  final List<Offset> currentLine;
  final Color color;
  final double brushSize;

  ColoringPainter(this.lines, this.currentLine, this.color, this.brushSize);

  @override
  void paint(Canvas canvas, Size size) {
    for (var line in lines) {
      final paint = Paint()
        ..color = line.color
        ..strokeCap = StrokeCap.round
        ..strokeWidth = line.brushSize;

      for (int i = 0; i < line.points.length - 1; i++) {
        canvas.drawLine(line.points[i], line.points[i + 1], paint);
      }
    }

    final currentPaint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = brushSize;

    for (int i = 0; i < currentLine.length - 1; i++) {
      canvas.drawLine(currentLine[i], currentLine[i + 1], currentPaint);
    }
  }

  @override
  bool shouldRepaint(ColoringPainter oldDelegate) {
    return true;
  }
}
