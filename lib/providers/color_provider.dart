import 'package:flutter/material.dart';

class ColorProvider extends ChangeNotifier {
  Color _color = Colors.black;
  bool _isEraser = false;
  double _brushSize = 5.0;
  Offset _brushPosition = Offset.zero;
  bool _isBrushVisible = false;

  Color get color => _isEraser ? Colors.white : _color;

  double get brushSize => _brushSize;

  Offset get brushPosition => _brushPosition;

  bool get isBrushVisible => _isBrushVisible;

  void changeColor(Color newColor) {
    _isEraser = false;
    _color = newColor.withOpacity(0.4);
    notifyListeners();
  }

  void toggleEraser() {
    _isEraser = !_isEraser;
    notifyListeners();
  }

  void changeBrushSize(double newSize) {
    _brushSize = newSize;
    notifyListeners();
  }

  void updateBrushPosition(Offset newPosition) {
    _brushPosition = newPosition;
    _isBrushVisible = true;
    notifyListeners();
  }

  void hideBrush() {
    _isBrushVisible = false;
    notifyListeners();
  }
}
