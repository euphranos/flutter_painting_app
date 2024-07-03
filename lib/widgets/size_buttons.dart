import 'package:flutter/material.dart';
import 'package:flutter_painting_game/providers/color_provider.dart';
import 'package:provider/provider.dart';

class SizeButtons extends StatelessWidget {
  const SizeButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              Provider.of<ColorProvider>(context, listen: false)
                  .changeBrushSize(2.0);
            },
            child: const Text('Small\nBrush'),
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<ColorProvider>(context, listen: false)
                  .changeBrushSize(5.0);
            },
            child: const Text('Middle\nBrush'),
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<ColorProvider>(context, listen: false)
                  .changeBrushSize(10.0);
            },
            child: const Text('Large\nBrush'),
          ),
        ],
      ),
    );
  }
}
