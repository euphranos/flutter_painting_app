// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_painting_game/widgets/color_pallet.dart';
import 'package:flutter_painting_game/widgets/eraser_button.dart';
import 'package:flutter_painting_game/widgets/paint_area_widget.dart';
import 'package:flutter_painting_game/widgets/size_buttons.dart';

class PaintingScreen extends StatelessWidget {
  final String imagePath;
  const PaintingScreen({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Painting Game'),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    const PaintAreaWidget(),
                    IgnorePointer(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(imagePath),
                      ],
                    )),
                  ],
                ),
              ),
              ColorPallet(),
              const EraserButton(),
              const SizeButtons(),
            ],
          ),
        ],
      ),
    );
  }
}
