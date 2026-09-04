import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveBottle extends StatefulWidget {
  const RiveBottle({super.key});

  @override
  State<RiveBottle> createState() => _RiveBottleState();
}

class _RiveBottleState extends State<RiveBottle> {
  late StateMachineController controller;
  late SMIBool smiWalk;
  late SMIBool smiGlance;

  @override
  Widget build(BuildContext context) {
    return RiveAnimation.asset(
      "assets/rive/bottle.riv",
      stateMachines: ['State Machine 1'],
      onInit: (Artboard artboard) {
        controller = StateMachineController.fromArtboard(artboard, 'State Machine 1')!;
        controller.isActive = true;
        artboard.addController(controller);
        smiWalk = controller.findInput<bool>('Walking') as SMIBool;
        smiGlance = controller.findInput<bool>('Glancing') as SMIBool;
        smiWalk.value = true;
      },
    );
  }
}
