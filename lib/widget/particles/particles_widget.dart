

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_study/widget/particles/particle_model.dart';
import 'package:simple_animations/simple_animations.dart';
import 'particle_painter.dart';
import 'package:supercharged/supercharged.dart';

class ParticleWidget extends StatefulWidget {
  final int numberOfParticles;

  ParticleWidget(this.numberOfParticles);

  @override
  _ParticleWidgetState createState() => _ParticleWidgetState();


}

class _ParticleWidgetState extends State<ParticleWidget> with WidgetsBindingObserver{


  final List<ParticleModel> particles = [];
  final random = Random();

  @override
  void initState() {
    widget.numberOfParticles.times(() => particles.add(ParticleModel(random)));
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    /// 从后台切回时重置粒子
    if(state == AppLifecycleState.resumed){
      particles.forEach((element) {
        element.restart();
        element.shuffle();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoopAnimation(
      tween: ConstantTween(1),
      builder: (context, child, value) {
        _simulateParticles();
        return CustomPaint(
          painter: ParticlePainter(particles),
        );
      },
    );
  }

  _simulateParticles(){
    particles.forEach((element) {
      element.checkIfParticleNeedsToBeRestarted();
    });
  }


}

