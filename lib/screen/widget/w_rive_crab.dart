import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveCrab extends StatefulWidget {
  const RiveCrab({super.key});

  @override
  State<RiveCrab> createState() => _RiveCrabState();
}

class _RiveCrabState extends State<RiveCrab> {
  late StateMachineController controller;
  late SMIBool smiWalk;
  late SMIBool smiHands;

  @override
  Widget build(BuildContext context) {
    return RiveAnimation.asset(
      "assets/rive/crab.riv",
      stateMachines: ['State Machine 1'],
      onInit: (Artboard artboard) {
        controller = StateMachineController.fromArtboard(artboard, 'State Machine 1')!;
        controller.isActive = true;
        artboard.addController(controller);
        smiWalk = controller.findInput<bool>('Walk') as SMIBool;
        smiHands = controller.findInput<bool>('Hands') as SMIBool;
        smiWalk.value = true;
      },
    );
  }
}
