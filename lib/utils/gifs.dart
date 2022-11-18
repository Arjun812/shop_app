import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatefulWidget {


  const Loading({super.key,});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with TickerProviderStateMixin{
  late final AnimationController controller;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Lottie.asset(
        'assets/lotties/loading.json',
        controller: controller,
        onLoaded: (composition) {
          controller..duration = composition.duration..forward();
          controller.repeat();
        },
      ),
    );
  }
}